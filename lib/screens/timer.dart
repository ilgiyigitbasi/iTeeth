
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:iteeth/components/custom_dialog_timer.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  int _duration = 5;
  CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kronometre'),
        backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {Navigator.of(context).pop()},
        ),
      ),
      body:
      Column(
        children: [
          Expanded(
            child: Container(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.07),
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(1, 24, 38, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween
                ,
                children: [
                  CircularCountDownTimer(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.4,
                    duration: _duration,
                    controller: CountDownController(),
                    isReverse: true,
                    isReverseAnimation: true,
                    strokeCap: StrokeCap.round,
                    strokeWidth: 20,
                    backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
                    textStyle: const TextStyle(
                        fontSize: 75.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.grey[600]!,
                    ringColor: Colors.white,
                    onComplete: () =>
                         showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return  const CustomDialogBoxTimer(
                              );
                            }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _controller.start(),
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(
                        onPressed: () => _controller.pause(),
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromRGBO(1, 24, 38, 1),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Kaydet',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
