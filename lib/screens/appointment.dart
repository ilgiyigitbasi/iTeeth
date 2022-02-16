import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/components/custom_dialog_box.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  dynamic dataAppointment;

  Future<dynamic> getData() async {
    final dataref = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshots, _) =>
            dataAppointment.fromJson(snapshots.data()!),
        toFirestore: (data, _) => dataAppointment.toJson());

  }

  @override
  void initState() {
    super.initState();
    getData();
    final dataref = FirebaseFirestore.instance.collection('user').withConverter(
        fromFirestore: (snapshots, _) =>
            dataAppointment.fromJson(snapshots.data()!),
        toFirestore: (data, _) => dataAppointment.toJson());
    print(dataref.snapshots());
  }

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
        child: Column(
          children: [
            TextButton(
                onPressed: () =>
                {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialogBox(
                            onConfirm: () =>
                            {
                              print('ajshdkajshd')
                            }
                        );
                      })
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
            Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.alarm),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: const [
                            Text(
                              'Randevu1',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text('11/02/1991',
                                style: TextStyle(fontSize: 12),
                                textAlign: TextAlign.left),
                          ],
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.alarm),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: const [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Randevu1',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('11/02/1991',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.left)),
                          ],
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.alarm),
                        const SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: const [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'jahsd',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.left,
                                )),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text('11/02/1991',
                                    style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.left)),
                          ],
                        ),
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
