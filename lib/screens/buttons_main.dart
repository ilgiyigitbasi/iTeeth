import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/constants.dart';

class ButtonsMain extends StatelessWidget {
  final String displayName;
  const ButtonsMain({Key? key, required this.displayName}) : super(key: key);

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
                  onPressed: () {},
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
                      transform: Matrix4.translationValues(0, -size.height*0.06, 0),
                      child: Image.asset(
                        'assets/avatar.png',
                        height: size.height*0.15,
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center,children:  [
                      Container(
                        transform: Matrix4.translationValues(0, -size.height*0.06, 0),
                        height: size.height*0.05,
                        width:  size.width*0.8,
                        child: const Text(
                          'Hoş geldiniz!',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    Row( mainAxisAlignment: MainAxisAlignment.center,children:  [
                      Container(
                        transform: Matrix4.translationValues(0, -size.height*0.06, 0),
                        height: size.height*0.05,
                        width: size.width*0.8,
                        child: const Text(
                          'İlgi Yiğitbaşı',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
                    Container(
                      transform: Matrix4.translationValues(0, -size.height*0.06, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: size.height*0.20,
                            width: size.height*0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    appointment_view);

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(color: Color.fromRGBO(1, 24, 38, 1), width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/calendar.png', height: size.height*0.09,),
                                  Container(
                                      margin:  EdgeInsets.only(top: size.height*0.01),
                                      child:  Text(
                                        'Randevularım',
                                        style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold,fontSize: size.height*0.018 ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height:  size.height*0.20,
                            width:  size.height*0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    timer_view);

                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(color: Color.fromRGBO(1, 24, 38, 1), width: 1.5),
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
                                            Image.asset('assets/toothbrush.png', height: size.height*0.09,),
                                            Container(
                                                margin:
                                                 EdgeInsets.only(top: size.height*0.01),
                                                child:  Text(
                                                  'Fırçalamaya',
                                                  style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018 ),
                                                )),
                                            Text(
                                              'Başla',
                                              style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018  ),
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
                      margin: EdgeInsets.only(top: size.height*0.04),
                      transform: Matrix4.translationValues(0, -size.height*0.06, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height:  size.height*0.20,
                            width:  size.height*0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    diary_view);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(color: Color.fromRGBO(1, 24, 38, 1), width: 1.5),
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
                                        Image.asset('assets/dental-record.png', height: size.height*0.09,),
                                        Container(
                                            margin:
                                                 EdgeInsets.only(top: size.height*0.01),
                                            child:  Text(
                                              'Fırçalama',
                                              style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018 ),
                                            )),
                                         Text(
                                          'Günlüğüm',
                                          style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018 ),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height:  size.height*0.20,
                            width:  size.height*0.20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    information_view);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.white,
                                elevation: 10,
                                side: const BorderSide(color: Color.fromRGBO(1, 24, 38, 1), width: 1.5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:  [
                                  Image.asset('assets/analysis.png',height: size.height*0.09,),
                                  Container(
                                    margin:  EdgeInsets.only(top: size.height*0.01),
                                    child:  Text(
                                      'Tedavimle İlgili',
                                      style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018 ),
                                    ),
                                  ),
                                   Text('Bilmem Gerekenler', textAlign: TextAlign.center, style: TextStyle(color:Color.fromRGBO(1, 24, 38, 1), fontWeight: FontWeight.bold, fontSize: size.height*0.018 ),)
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
