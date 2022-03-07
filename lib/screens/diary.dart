import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key, required this.uid}) : super(key: key);

  final String? uid;

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final List<bool> _isSelected = [true, false, false, false];
  FirebaseFirestore? _instance;
  List<DiaryList> _list_diary = [];
  int _interfaceCount = 0;
  int _total = 0;
  bool loading = false;

  Future<void> getAppointmentsFromFirestore() async {
    setState(() {
      loading = true;
    });
    _instance = FirebaseFirestore.instance;
    CollectionReference diary = _instance!.collection('users');

    DocumentSnapshot snapshot = await diary.doc(widget.uid).get();

    var data = snapshot.data() as Map;
    var diaryData = data['brushing_diary'] as List<dynamic>;

    for (var item in diaryData) {
      _list_diary.add(DiaryList(item['interface_brush'], item['date']));
    }

    var interfaceCount = _list_diary.where((element) => element.interface_brush).length;
    var total = _list_diary.length;

    setState(() {
      _list_diary = _list_diary;
      _interfaceCount = interfaceCount;
      _total = total;

      loading = false;
    });
    filter();
  }
  filter() {
    if(_isSelected[0]){
      var now1 = DateTime.now();
      var now =  DateTime(now1.year, now1.month, now1.day, 0, 0, 0);
      var filteredTotal = _list_diary.where((element) {
        final date = element.date.toDate();
        return now.isBefore(date);
      });
      var filteredInterface = filteredTotal.where((element) => element.interface_brush).length;

      setState(() {
        _total= filteredTotal.length;
        _interfaceCount= filteredInterface;
      });
    } else if (_isSelected[1]) {
      var now = DateTime.now();
      var now_1w = now.subtract(const Duration(days: 7));

      var filteredTotal= _list_diary.where((element) {
        final date = element.date.toDate();
        return now_1w.isBefore(date);
      });

      var filteredInterface = filteredTotal.where((element) => element.interface_brush).length;

      setState(() {
        _total= filteredTotal.length;
        _interfaceCount= filteredInterface;
      });

    } else if (_isSelected[2]){
      var now = DateTime.now();

      var now_1m =  DateTime(now.year, now.month-1, now.day);

      var filteredTotal= _list_diary.where((element) {
        final date = element.date.toDate();
        return now_1m.isBefore(date);
      });

      var filteredInterface = filteredTotal.where((element) => element.interface_brush).length;

      setState(() {
        _total= filteredTotal.length;
        _interfaceCount= filteredInterface;
      });

    }else if (_isSelected[3]){


      var interfaceCount = _list_diary.where((element) => element.interface_brush).length;
      var total = _list_diary.length;

      setState(() {
        _total= total;
        _interfaceCount= interfaceCount;
      });

    }
  }
  @override
  void initState() {
    super.initState();
    getAppointmentsFromFirestore();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fırçalama Günlüğüm'),
        backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.02, horizontal: MediaQuery.of(context).size.width*0.01),
        child: Column(
          children: [
            ToggleButtons(
              borderRadius: BorderRadius.circular(8.0),
              fillColor: const Color.fromRGBO(1, 24, 38, 1),
              selectedBorderColor: const Color.fromRGBO(1, 24, 38, 1),
              selectedColor: Colors.white,
              children:  <Widget>[
                Container(width: (MediaQuery.of(context).size.width-120)/3,child: Text('Günlük', textAlign: TextAlign.center,)),
                Container(width: (MediaQuery.of(context).size.width-120)/3,child: Text('Haftalık', textAlign: TextAlign.center,)),
                Container(width: (MediaQuery.of(context).size.width-120)/3,child: Text('Aylık', textAlign: TextAlign.center,)),
                Container(width: (MediaQuery.of(context).size.width-120)/3,child: Text('Hepsi', textAlign: TextAlign.center,)),
              ],
              isSelected: _isSelected,
              onPressed: (int index) {

                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                });
                filter();
              },

            ),
            const Divider(
              height: 15,
              thickness: 1,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment:  MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        width: MediaQuery.of(context).size.width*0.9,

                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromRGBO(1, 24, 38, 0.3) ),
                          borderRadius: BorderRadius.circular(45.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/washing.png', height: 115,),
                            SizedBox(height: 25,),
                            Text('Arayüz Fırçası', style: TextStyle(fontWeight: FontWeight.bold),),
                            Text('Kullandığım Fırçalamalar',  style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(_interfaceCount.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),

                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment:  MainAxisAlignment.center,

                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.3,
                        width: MediaQuery.of(context).size.width*0.9,

                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromRGBO(1, 24, 38, 0.3) ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/toothhappy.png', height: 115,),
                            SizedBox(height: 25,),

                            Text('Toplam Fırçalama',  style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(_total.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),

                          ],
                        ),
                      )
                    ],
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class DiaryList {
  bool interface_brush;
  Timestamp date;

  DiaryList(this.interface_brush, this.date);
}
