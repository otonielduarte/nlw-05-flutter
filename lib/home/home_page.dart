import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/home_controller.dart';
import 'package:flutter_nlw_05/home/home_state.dart';
import 'package:flutter_nlw_05/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_nlw_05/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_nlw_05/home/widgets/quizCard/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    controller.getQuizzes();
    controller.getUser();
    controller.stateNotifier.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.loading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.green),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBarWidget(user: controller.user!),
      backgroundColor: AppColors.chartSecondary,
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
                    children: controller.quizzes!
                        .map((quiz) => QuizCard(
                              quiz.title,
                              iconAsset: 'assets/images/${quiz.image}.png',
                              current: quiz.questionAwnsered,
                              max: quiz.questions.length,
                            ))
                        .toList()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
