import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/components/loading.dart';
import 'package:iteeth/components/register_popup.dart';
import 'package:iteeth/screens/home.dart';
import 'package:iteeth/services/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String emailForget = '';
  String password = '';
  bool loading = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();

    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     print('stay here');
    //   } else {
    //     loading = true;
    //     print('login');
    //     Navigator.pushNamed(context, home_view);
    //     loading = false;
    //   }
    // });
    func();

  }
  func() async {
    final SharedPreferences prefs =await _prefs;
    if(prefs.getString('uid') != null) {
      print(prefs.getString('uid'));
      Navigator.pushNamed(context, home_view);
      loading = false;
    }
  }

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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              )),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(45),
                                        ),
                                        elevation: 0,
                                        backgroundColor: Colors.transparent,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 40, right: 20, bottom: 20),
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,

                                            children: [
                                              const Text('Şifre Sıfırla', textAlign: TextAlign.center,),
                                              TextField(
                                                  onChanged: (val) {
                                                    setState(() =>
                                                        emailForget = val);
                                                  },
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          1, 24, 38, 1)),
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'E-mail',
                                                    labelStyle: TextStyle(
                                                        color: Color.fromRGBO(
                                                            1, 24, 38, 1),
                                                        fontSize: 12),
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color.fromRGBO(
                                                                  1,
                                                                  24,
                                                                  38,
                                                                  0.8)),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Color
                                                                    .fromRGBO(
                                                                        1,
                                                                        24,
                                                                        38,
                                                                        0.8))),
                                                    border:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Color.fromRGBO(
                                                                  1,
                                                                  24,
                                                                  38,
                                                                  1)),
                                                    ),
                                                  )),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                    top: 35),
                                                child: ElevatedButton(
                                                  style: ElevatedButton
                                                      .styleFrom(
                                                    primary:
                                                        const Color.fromRGBO(
                                                            1, 24, 38, 1),
                                                  ),
                                                  onPressed: () async {
                                                    await FirebaseAuth
                                                        .instance
                                                        .sendPasswordResetEmail(
                                                            email:
                                                                emailForget);

                                                    Navigator.of(context)
                                                        .pop();
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(15.0),
                                                    child: Text(
                                                      'Şifre Sıfırla',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily:
                                                              'Poppins',
                                                          fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: const Text(
                                'Şifremi Unuttum',
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
      final prefs = await SharedPreferences.getInstance();

      if(prefs.getString('uid') == null) {
        prefs.setString('uid', user.uid);
        prefs.setString('displayName', user.displayName!);
      }

      Navigator.pushNamed(context, home_view, arguments: const Home());
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
