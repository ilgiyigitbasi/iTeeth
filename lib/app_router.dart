

import 'package:flutter/material.dart';

import 'Screens/login.dart';
import 'Screens/appointment.dart';
import 'Screens/diary.dart';
import 'Screens/home.dart';
import 'Screens/information_page.dart';
import 'Screens/timer.dart';
import 'constants.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      ///dashboard
      case login_view_route:
        return MaterialPageRoute(builder: (context) => const Login());
      case home_view:
        return MaterialPageRoute(builder: (context) =>  const Home(userName: '',));
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
