import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CustomDialogBoxTimer extends StatefulWidget {
  const CustomDialogBoxTimer({Key? key, required this.uid })
      : super(key: key);
  final String? uid;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBoxTimer> {
  bool isChecked = false;
  bool loading = false;
  bool error= false;
  bool isChecked_mouthwash = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(45),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: 20, top: 45 + 20, right: 20, bottom: 20),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Tebrikler',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text('Fırçalamayı tamamladınız!'),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),

                  const Text('Arayüz fırçası kullandım')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: isChecked_mouthwash,
                    onChanged: (value) {
                      setState(() {
                        isChecked_mouthwash = !isChecked_mouthwash;
                      });
                    },
                  ),

                  const Text('Ağız gargaramı yaptım')
                ],
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {

                      _add();
                    },
                    child: const Text(
                      'Kaydet',
                      style: TextStyle(fontSize: 13),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor:Color.fromRGBO(1, 24, 38, 1),
            radius: 45,
            child:  ClipRRect(

                child: Image.asset('assets/toothbrush.png', height:55)),
          ),
        ),
      ],
    );
  }
  Future<void> _add() async {
    try {
      setState(() {
        loading = true;
      });
      FirebaseFirestore.instance.collection('users').doc(widget.uid).update({
        "brushing_diary": FieldValue.arrayUnion([
          {"interface_brush": isChecked, "date": DateTime.now(), "mouthwash": isChecked_mouthwash}
        ])
      }).then((res) => {
        setState(() {
          loading = false;
          Navigator.of(context).pop();
        })
      });
    } catch (e) {
      setState(() {
        loading = false;
        error = true;
      });
    }
  }
}
