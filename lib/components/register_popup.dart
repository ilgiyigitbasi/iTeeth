import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String email = '';
  String password = '';
  String nameSurname = '';

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
                'Kayıt ol',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        onChanged: (val) {
                          setState(() => nameSurname = val);
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(1, 24, 38, 1),
                            fontFamily: 'Poppins',
                            fontSize: 12),
                        decoration: const InputDecoration(
                          labelText: 'İsim Soyisim',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(1, 24, 38, 1)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(1, 24, 38, 1))),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(1, 24, 38, 1)),
                          ),
                        )),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 0),
                      child: TextFormField(
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          style: const TextStyle(
                              color: Color.fromRGBO(1, 24, 38, 1)),
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(1, 24, 38, 1),
                                fontSize: 12),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(1, 24, 38, 0.8)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(1, 24, 38, 0.8))),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(1, 24, 38, 1)),
                            ),
                          )),
                    ),
                    TextFormField(
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        style: const TextStyle(
                            color: Color.fromRGBO(1, 24, 38, 1),
                            fontFamily: 'Poppins',
                            fontSize: 12),
                        decoration: const InputDecoration(
                          labelText: 'Şifre',
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(1, 24, 38, 1)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(1, 24, 38, 1))),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(1, 24, 38, 1)),
                          ),
                        )),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    onPressed: () async {
                      await _register();
                    },
                    child: const Text(
                      'Kayıt ol',
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

  Future<void> _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,

    ))
        .user;

    if (user != null) {
      user.updateDisplayName(nameSurname);
      Navigator.of(context).pop();
      setState(() {

        email = user.email ?? '';
      });
    } else {
      print('no');
    }
  }
}
