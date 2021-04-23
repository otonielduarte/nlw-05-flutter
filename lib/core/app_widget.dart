import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}
