import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_nlw_05/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_nlw_05/home/widgets/quizCard/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButton("Fácil"),
                LevelButton("Médio"),
                LevelButton("Difícil"),
                LevelButton("Perito"),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  padding: EdgeInsets.only(top: 16),
                  children: [
                    QuizCard(
                      "Gerenciamento de estado",
                      iconAsset: AppImages.blocks,
                      current: 3,
                      max: 10,
                    ),
                    QuizCard(
                      "Gerenciamento simples",
                      iconAsset: AppImages.blocks,
                      current: 0,
                      max: 10,
                    ),
                    QuizCard(
                      "Gerenciamento de tempo",
                      iconAsset: AppImages.blocks,
                      current: 5,
                      max: 10,
                    ),
                    QuizCard(
                      "Gerenciamento de fluxo",
                      iconAsset: AppImages.blocks,
                      current: 3,
                      max: 10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
