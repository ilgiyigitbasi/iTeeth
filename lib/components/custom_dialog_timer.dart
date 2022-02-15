import 'package:flutter/material.dart';

class CustomDialogBoxTimer extends StatefulWidget {
  const CustomDialogBoxTimer({Key? key, @required this.isChecked})
      : super(key: key);
  final isChecked;

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBoxTimer> {
  bool isChecked = false;

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

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
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
            backgroundColor: Colors.grey[200],
            radius: 45,
            child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Icon(
                  Icons.add_circle,
                  color: Colors.white,
                  size: 48,
                )),
          ),
        ),
      ],
    );
  }
}
