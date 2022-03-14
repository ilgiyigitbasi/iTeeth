import 'package:flutter/cupertino.dart';
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
  int _duration = 120;
  int selectedIndex = 0;

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
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
              decoration:
              const BoxDecoration(color: Color.fromRGBO(1, 24, 38, 1)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      TextButton(

                          onPressed: () {
                            showTimerPicker();
                          },

                          child: const Text(
                            'Kronometreyi ayarla',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ))
                    ],
                  ),
                  CircularCountDownTimer(
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.4,
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
                      onComplete: () => {completed()}),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => {_controller.resume(), setState(() {
                          selectedIndex=0;
                        })},
                        icon:  Icon(
                          Icons.play_arrow,
                          color: selectedIndex==0 ? Colors.grey : Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(

                        onPressed: () => {_controller.pause(), setState(() {
                          selectedIndex=1;
                        })},
                        icon:  Icon(
                          Icons.pause,
                          color: selectedIndex==1 ? Colors.grey : Colors.white,
                        ),
                        iconSize: 55,
                      ),
                      IconButton(
                        onPressed: () => {_controller.restart(), setState(() {
                          selectedIndex=2;
                        })},
                        icon:  Icon(
                          Icons.stop,
                          color: selectedIndex==2 ? Colors.grey : Colors.white,
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
          return CustomDialogBoxTimer(uid: widget.uid);
        });
  }

  void showTimerPicker() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return Container(
              height: MediaQuery.of(context).copyWith().size.height * 0.25,
              width: double.infinity,
              color: Colors.white,
              child: CupertinoTimerPicker(
                initialTimerDuration: Duration(seconds: _duration),
                backgroundColor: Colors.white,
                mode: CupertinoTimerPickerMode.ms,
                onTimerDurationChanged: (value) {
                  setState(() {
                    _controller.restart(duration: value.inSeconds);
                    _controller.pause();
                  });
                },
              ));
        });
  }
}
