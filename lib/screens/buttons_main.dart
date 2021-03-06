import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/constants.dart';
import 'package:iteeth/screens/appointment.dart';
import 'package:iteeth/screens/timer.dart';
import 'package:lottie/lottie.dart';

import '../notifications.dart';
import '../utilities.dart';
import 'diary.dart';

class ButtonsMain extends StatefulWidget {
  final String? displayName;
  final String? uid;

  const ButtonsMain({Key? key, required this.displayName, required this.uid})
      : super(key: key);

  @override
  State<ButtonsMain> createState() => _ButtonsMainState();
}

class _ButtonsMainState extends State<ButtonsMain> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications()
            .requestPermissionToSendNotifications()
            .then((_) => Navigator.pop(context));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
      body: Stack(
        children: [
          Positioned(
              top: 20,
              child: Container(
                height: size.height * 0.25,
                width: size.width,
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () async {

                  },
                  color: Colors.white,
                  iconSize: 25,
                ),
              )),
          Positioned(
            bottom: 0,
            child: Container(
                height: size.height * 0.75,
                width: size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.elliptical(350, 50),
                        topLeft: Radius.elliptical(350, 50))),
                child: Column(
                  children: [
                    Container(
                      transform:
                          Matrix4.translationValues(0, -size.height * 0.07, 0),
                      child: Lottie.asset(
                        "assets/36878-clean-tooth.json",
                        width: size.width * 0.3,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        transform: Matrix4.translationValues(
                            0, -size.height * 0.06, 0),
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: const Text(
                          'Ho?? geldiniz!',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        transform: Matrix4.translationValues(
                            0, -size.height * 0.06, 0),
                        height: size.height * 0.05,
                        width: size.width * 0.8,
                        child: Text(
                          widget.displayName.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    Container(
                      transform:
                          Matrix4.translationValues(0, -size.height * 0.06, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: size.height * 0.20,
                            width: size.height * 0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, appointment_view,
                                    arguments: Appointments(uid: widget.uid.toString()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 24, 38, 1),
                                    width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/calendar.png',
                                    height: size.height * 0.09,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.01),
                                      child: Text(
                                        'Randevular??m',
                                        style: TextStyle(
                                            color: Color.fromRGBO(1, 24, 38, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: size.height * 0.018),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.20,
                            width: size.height * 0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, timer_view,
                                    arguments: Timer(uid: widget.uid.toString()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 24, 38, 1),
                                    width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset(
                                              'assets/toothbrush.png',
                                              height: size.height * 0.09,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    top: size.height * 0.01),
                                                child: Text(
                                                  'F??r??alamaya',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          1, 24, 38, 1),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          size.height * 0.018),
                                                )),
                                            Text(
                                              'Ba??la',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      1, 24, 38, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.height * 0.018),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * 0.04),
                      transform:
                          Matrix4.translationValues(0, -size.height * 0.06, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: size.height * 0.20,
                            width: size.height * 0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, diary_view,
                                    arguments: Diary(uid: widget.uid.toString()));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 24, 38, 1),
                                    width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                          'assets/dental-record.png',
                                          height: size.height * 0.09,
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: size.height * 0.01),
                                            child: Text(
                                              'F??r??alama',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      1, 24, 38, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.height * 0.018),
                                            )),
                                        Text(
                                          'G??nl??????m',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(1, 24, 38, 1),
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.height * 0.018),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.20,
                            width: size.height * 0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(information_view);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(
                                    color: Color.fromRGBO(1, 24, 38, 1),
                                    width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/analysis.png',
                                    height: size.height * 0.09,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.01),
                                    child: Text(
                                      'Tedavimle ??lgili',
                                      style: TextStyle(
                                          color: Color.fromRGBO(1, 24, 38, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.height * 0.018),
                                    ),
                                  ),
                                  Text(
                                    'Bilmem Gerekenler',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color.fromRGBO(1, 24, 38, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: size.height * 0.018),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
