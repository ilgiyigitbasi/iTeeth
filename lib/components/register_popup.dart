import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/components/loading.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  bool error = false;
  String email = '';
  String password = '';
  String nameSurname = '';
  String? errorTxt = '';
  bool loading = false;


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
          child: SingleChildScrollView(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Zorunlu Alan';
                            }
                            return null;
                          },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Zorunlu Alan';
                              }
                              return null;
                            },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Zorunlu Alan';
                            }
                            return null;
                          },
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
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.05,
                ),
                Container(child: error ?  Text(errorTxt!, style: TextStyle(color: Colors.red), textAlign: TextAlign.center,): null),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(1, 24, 38, 1),
                      ) ,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await _register();

                        }
                      },
                      child: const Text(
                        'Kayıt ol',
                        style: TextStyle(fontSize: 13),
                      )),
                ),

              ],

            ),

          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Color.fromRGBO(1, 24, 38, 1),
            radius: 45,
            child:  ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child:Image.asset('assets/dentist_1.png', height: 65,))
          ),
        ),
        Container(
          child: loading ? const Loading() : null,
        ),
        
      ],
    );
  }

  Future<void> _register() async {
    try {
      setState(() {
        loading=true;
      });
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,

      ))
          .user!;


      setState(() {
        loading=false;
      });
      user.updateDisplayName(nameSurname);

      FirebaseFirestore.instance.collection('users').doc(user.uid).set({"name": nameSurname});

      Navigator.of(context).pop();
      setState(() {

        email = user.email ?? '';
      });
    } on FirebaseAuthException  catch(e) {
      print(e.code);
      if(e.code == "email-already-in-use") {
        setState(() {
          loading = false;
          error = true;
          errorTxt = "Bu mail adresi ile hesap mevcut!";
        });
      } else {
        setState(() {
          loading = false;
          error = true;
          errorTxt= e.message;
        });
      }

    }






  }
}
