import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/application/theme/colors.dart';
import 'package:weather_app/presentation/router/router_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          textTheme: TextTheme(bodyText2: TextStyle(color: white))),
      // home: Dashboard(),
      onGenerateRoute: RouterNavigator.generateRoute,
    );
  }
}
