import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Diary extends StatefulWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  _DiaryState createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  final List<bool> _isSelected = [false, true, false];

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
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
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
              ],
              isSelected: _isSelected,
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < _isSelected.length; i++) {
                    _isSelected[i] = i == index;
                  }
                });
              },

            ),
            const Divider(
              height: 15,
              thickness: 1,
            ),
            Column(

              children: [
                Column(
                  children: const [
                    Align(alignment: Alignment.centerLeft,child: Text('Randevu1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                    Align(alignment: Alignment.centerLeft,child: Text('11/02/1991', style: TextStyle( fontSize: 12),)),
                    Divider()
                  ],
                ), Column(
                  children: const [
                    Align(alignment: Alignment.centerLeft,child: Text('Randevu1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                    Align(alignment: Alignment.centerLeft,child: Text('11/02/1991', style: TextStyle( fontSize: 12),)),
                    Divider()
                  ],
                ), Column(
                  children: const [
                    Align(alignment: Alignment.centerLeft,child: Text('Randevu1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),)),
                    Align(alignment: Alignment.centerLeft,child: Text('11/02/1991', style: TextStyle( fontSize: 12),)),
                    Divider()
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
