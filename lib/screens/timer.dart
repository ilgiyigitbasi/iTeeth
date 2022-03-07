
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:iteeth/components/custom_dialog_timer.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key, required this.uid}) : super(key: key);
  final String? uid;
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  late CountDownController _controller = CountDownController();
  final int _duration = 120;

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
                      controller: _controller,
                      isReverse: true,
                      isReverseAnimation: true,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 20,
                      backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
                      textStyle: const TextStyle(
                          fontSize: 50.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      fillColor: Colors.grey[600]!,
                      ringColor: Colors.white,
                      onComplete: ()=> {
                        completed()
                      }

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _controller.resume(),
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(
                        onPressed:()=>{(_controller.pause())},
                        icon: const Icon(
                          Icons.pause,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(
                        onPressed:()=>{(_controller.restart())},
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.white,
                        ),
                        iconSize: 55,
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
  completed() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return   CustomDialogBoxTimer(
              uid: widget.uid
          );
        });}

}
