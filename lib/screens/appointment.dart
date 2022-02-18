import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iteeth/components/custom_dialog_box.dart';
import 'package:iteeth/components/loading.dart';

class Appointments extends StatefulWidget {
  final String? uid;

  const Appointments({Key? key, required this.uid}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  FirebaseFirestore? _instance;
  List<Appointment> _list = [];
  bool loading = false;

  Future<void> getAppointmentsFromFirestore() async {
    setState(() {
      loading=true;
    });
    _instance = FirebaseFirestore.instance;
    CollectionReference appointments = _instance!.collection('users');

    DocumentSnapshot snapshot = await appointments.doc(widget.uid).get();
    var data = snapshot.data() as Map;
    var appointmentsData = data['appointments'] as List<dynamic>;

    for (var item in appointmentsData) {
      _list.add(Appointment(item['name'], item['date']));
    }
    setState(() {
      _list = _list;
      loading=false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAppointmentsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.uid);
    print('here');
    FirebaseFirestore.instance
        .collection('users')
        .doc(widget.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
      } else {
        print('Document does not exist on the database');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randevularım'),
        backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body: Stack(
        children: [Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(children: [
            TextButton(
                onPressed: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomDialogBox(
                              uid: widget.uid,

                            );
                          }).then((value) => getAppointmentsFromFirestore())
                    },
                child: Row(
                  children: [
                    const Icon(
                      Icons.add_rounded,
                      color: Color.fromRGBO(1, 24, 38, 1),
                      size: 35,
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 0),
                        child: const Center(
                            child: Text(
                          'Yeni Randevu Ekle',
                          style: TextStyle(
                              color: Color.fromRGBO(1, 24, 38, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )))
                  ],
                )),
            const Divider(
              height: 15,
              thickness: 1,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(children: [
                        const Icon(Icons.access_alarm),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${_list[index].name}'),
                            Row(
                              children: [
                                Icon(Icons.date_range, size: 12,),
                                Text(
                                    '${DateFormat('dd/MM/yyyy').format(_list[index].date.toDate())}'),
                                SizedBox(width: 10,),
                                Icon(Icons.access_time, size: 12,),
                                Text(
                                    '${DateFormat('HH:mm').format(_list[index].date.toDate())}'),
                              ],
                            ),
                          ],
                        )
                      ]);
                    }),
              ),
            )
          ]),
        ),
        Container(
          child: loading ? const Loading(): null,
        )
        ]
      ),
    );
  }
}

class Appointment {
  String name;
  Timestamp date;

  Appointment(this.name, this.date);
}
