import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/challenge/challenge_page.dart';
import 'package:flutter_nlw_05/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}
