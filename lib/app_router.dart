import 'package:flutter/material.dart';

import 'screens/login.dart';
import 'screens/appointment.dart';
import 'screens/diary.dart';
import 'screens/home.dart';
import 'screens/information_page.dart';
import 'screens/timer.dart';
import 'constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

    ///dashboard
      case login_view_route:
        return MaterialPageRoute(builder: (context) => const Login());
      case home_view:
        return MaterialPageRoute(builder: (context) => const Home());

      case appointment_view:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (BuildContext context) {
          Appointments argument = args as Appointments;
          return Appointments(uid: argument.uid);
        });
      case timer_view:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (BuildContext context) {
          Timer argument = args as Timer;
          return Timer(uid: argument.uid);
        });
      case diary_view:
        final args = settings.arguments;
        return MaterialPageRoute(builder: (BuildContext context) {
          Diary argument = args as Diary;
          return Diary(uid: argument.uid);
        });
      case information_view:
        return MaterialPageRoute(builder: (context) => const InformationPage());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
