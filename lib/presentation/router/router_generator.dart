import 'package:flutter/material.dart';
import 'package:weather_app/presentation/pages/weather_app.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<Weather>(builder: (context) => Weather());

      default:
        return MaterialPageRoute<Weather>(builder: (context) => Weather());
    }
  }
}
