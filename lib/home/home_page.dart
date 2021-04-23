import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/challenge/challenge_page.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/final/final_page.dart';
import 'package:flutter_nlw_05/home/home_controller.dart';
import 'package:flutter_nlw_05/home/home_state.dart';
import 'package:flutter_nlw_05/home/widgets/appbar/app_bar_widget.dart';
import 'package:flutter_nlw_05/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter_nlw_05/home/widgets/quizCard/quiz_card_widget.dart';
import 'package:flutter_nlw_05/shared/models/quizz_model.dart';
import 'package:flutter_nlw_05/shared/util/nav.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    print('init state <<<<<<<<<<<<<<<<<<<<<<<');
    controller = HomeController();
    controller.initController();
    controller.stateNotifier.addListener(() => setState(() {}));
    controller.progressNotifier.addListener(() => setState(() {}));
    super.initState();
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
    print("controller >>>>>>>>>>>${controller.progress}");
    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
        progress: controller.progress,
      ),
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
                        .map(
                          (quizz) => QuizCard(
                            quizz.title,
                            iconAsset: 'assets/images/${quizz.image}.png',
                            current: quizz.questionAwnsered,
                            max: quizz.questions.length,
                            onTap: () => _onTap(quizz),
                          ),
                        )
                        .toList()),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onTap(QuizzModel quizz) async {
    final quizzResult = await push(context, ChallengePage(quizz.questions));

    push(
        context,
        FinalPage(
          quizzName: quizz.title,
          length: quizz.questions.length,
          right: quizzResult,
        )).then((_) => controller.updateScore(5));
  }
}
