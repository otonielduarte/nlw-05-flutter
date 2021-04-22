import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/challenge/widgets/awnser/awnser.dart';
import 'package:flutter_nlw_05/core/core.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Column(
              children: [
                AwnserWidget(
                    title:
                        "Possibilita a criação de aplicativos compilados nativamente!"),
                AwnserWidget(
                    title:
                        "Possibilita a criação de aplicativos compilados nativamente!"),
                AwnserWidget(
                    title:
                        "Possibilita a criação de aplicativos compilados nativamente!"),
                AwnserWidget(
                    title:
                        "Possibilita a criação de aplicativos compilados nativamente!"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
