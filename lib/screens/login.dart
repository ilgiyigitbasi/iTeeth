import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/components/loading.dart';
import 'package:iteeth/components/register_popup.dart';
import 'package:iteeth/screens/home.dart';
import 'package:iteeth/services/auth.dart';

import '../constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String password = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.6,
              child:
                  Center(child: Image.asset('assets/logo3.png', height: 200)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(238, 238, 238, 1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.08,
                      width: size.width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const Register();
                                    });
                              },
                              child: const Text(
                                'Hesap Oluştur',
                                style: TextStyle(
                                    color: Color.fromRGBO(1, 24, 38, 1),
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 65),
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
                        Container(
                          padding: const EdgeInsets.only(left: 65, right: 65),
                          child: TextFormField(
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 35),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(1, 24, 38, 1),
                            ),
                            onPressed: () async {
                              await _signInWithEmailAndPassword();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Text(
                                'Giriş Yap',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(child: loading ? const Loading() : null),
        ],
      ),
    );
  }

  Future<void> _signInWithEmailAndPassword() async {
    try {
      setState(() {
        loading = true;
      });
      final User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;

      Navigator.pushNamed(context, home_view,
          arguments: Home(userName: user.displayName, uid: user.uid));
      setState(() {
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red[300],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Text("Girdiğiniz bilgileri kontrol ederek tekrar deneyin!"),
      ));
      print(e);
    }
  }
}

const TextStyle h1 = TextStyle(color: Colors.white, fontSize: 20);
