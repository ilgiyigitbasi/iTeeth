
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/constants.dart';

import '../notifications.dart';
import '../utilities.dart';

class Profile extends StatefulWidget {
  Profile({Key? key, required this.displayName, required this.uid}) : super(key: key);

  String? displayName;
  String? uid;
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched= false;
  int notification_hour = 0;
  int notification_minute= 0;
  List _hourList=[];


  Future<void> listScheduledNotifications(BuildContext context) async {
    List<NotificationModel> activeSchedules =
    await AwesomeNotifications().listScheduledNotifications();
    List _list =[];
    List _hoursList=[];
    for (NotificationModel schedule in activeSchedules) {
      _list.add(schedule.schedule);
    }
    _list.sort((a, b) => a.hour.compareTo(b.hour));

   for(int i = 0 ; i < _list.length; i++) {
     if(i%7 == 0) {
       _hoursList.add('${_list[i].hour}:${_list[i].minute}' );
     }
   }
   print(_hourList);
    setState(() {
      _hourList = _hoursList;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listScheduledNotifications(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
          backgroundColor: const Color.fromRGBO(1, 24, 38, 1),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Image.asset('assets/mobile-phone.png', height: 100,),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text('İsim Soyisim:', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(widget.displayName.toString()),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bildirim Gönder'),

                  TextButton(onPressed: () async {

                    NotificationWeekAndTime? pickedSchedule =
                    await pickSchedule(context, _hourList);

                    if (pickedSchedule != null) {
                      createWaterReminderNotification(pickedSchedule).then((value) => listScheduledNotifications(context) );
                    }

                  }, child: Text('Yeni Bildirim'))
                ],
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height*0.15,
                child: _hourList.isEmpty ?const Text('Hiç bildirim yok'):ListView(
                  children: _hourList.map((element) => ListTile(title: Text(element))).toList(),
                ),
              ),
            ),
            TextButton(onPressed: () async {

             cancelScheduledNotifications().then((value) => listScheduledNotifications(context));

            }, child: Text('Bildirimleri iptal et')),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: ()async=> {await FirebaseAuth.instance.signOut().then((value) => print('signed out')), Navigator.pushNamed(context, login_view_route,)},
                    child: Text('Çıkış Yap', style: TextStyle(color: Colors.red),),)
                ],
              ),
            ),
          ],
        )
    );
  }
}
class Hours {
  final String hour;
  Hours(this.hour);
}
