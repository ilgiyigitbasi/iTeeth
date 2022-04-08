import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:iteeth/screens/login.dart';

import 'app_router.dart';
import 'constants.dart';
import 'firebase_options.dart';

void main() async {


    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

  AwesomeNotifications().initialize(
    'resource://drawable/ic_stat_iteeth',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true, channelDescription: 'description',
      ),
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Colors.teal,
        locked: true,
        importance: NotificationImportance.High,
        channelDescription: 'description',
      ),
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: login_view_route,
    );
  }
}
