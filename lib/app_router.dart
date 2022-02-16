

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
        final args = settings.arguments;
        return MaterialPageRoute(builder: (BuildContext context) {
          Home argument = args as Home;
          return Home(
            userName: argument.userName,
          );
        });
      case appointment_view:
        return MaterialPageRoute(builder: (context) => const Appointments());
      case timer_view:
        return MaterialPageRoute(builder: (context) => const Timer());
      case diary_view:
        return MaterialPageRoute(builder: (context) => const Diary());
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
