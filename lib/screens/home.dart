import 'dart:io';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/screens/appointment.dart';
import 'package:iteeth/screens/buttons_main.dart';
import 'package:iteeth/screens/profile.dart';
import 'package:iteeth/screens/settings1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../notifications.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  late List<Widget> children;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    var name = FirebaseAuth.instance.currentUser?.displayName;
    var uid = FirebaseAuth.instance.currentUser?.uid;


    // AwesomeNotifications().actionStream.listen((notification) {
    //   if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
    //     AwesomeNotifications().getGlobalBadgeCounter().then(
    //           (value) =>
    //           AwesomeNotifications().setGlobalBadgeCounter(value - 1),
    //     );
    //   }
    //
    //   // Navigator.pushAndRemoveUntil(
    //   //   context,
    //   //   MaterialPageRoute(
    //   //     builder: (_) => PlantStatsPage(),
    //   //   ),
    //   //       (route) => route.isFirst,
    //   // );
    // });

    children = [
      ButtonsMain(displayName: name, uid: uid),
      Profile(displayName: name, uid: uid),
    ];
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  static const List<String> _appBarTitles = <String>[
    'Ana Sayfa',
    'Randevularım',
    'Ayarlar',
    'Hesabım'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: children[_selectedIndex],
      bottomNavigationBar: Container(
        height: size.height * 0.09,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(1, 24, 38, 1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(1, 24, 38, 0.6),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ]),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                icon: _selectedIndex == 0
                    ? const Icon(
                  Icons.home_filled,
                  color: Colors.white,
                  size: 25,
                )
                    : const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                  createPlantFoodNotification;
                },
                icon: _selectedIndex == 1
                    ? const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 25,
                )
                    : const Icon(
                  Icons.person_outline_outlined,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
