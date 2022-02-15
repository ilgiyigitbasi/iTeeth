import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_date_picker.dart';

class CustomDialogBox extends StatefulWidget {
  final Function onConfirm;

  const CustomDialogBox({Key? key, required this.onConfirm}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  var selectedTime1 = DateTime.now();

  bool enabled = true;
  var baslangictarihi = DateFormat('dd/mm/yyyy').format(DateTime.now());

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
                'Randevu Ekle',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Randevu Adı'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: CustomDatePicker(
                      title: const Text('Randevu Tarihi'),
                      selectedTime: selectedTime1,
                      onConfirm: (val) {
                        setState(() {
                          selectedTime1 = val;
                          enabled = true;
                          baslangictarihi =
                              DateFormat('dd/mm/yyyy').format(DateTime.now());
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                        color: const Color.fromRGBO(1, 24, 38, 1),
                        child: const Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => widget.onConfirm),
                  )
                ],
              ))
            ],
          ),
        ),
        const Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(1, 24, 38, 1),
            radius: 45,
            child: ClipRRect(
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
