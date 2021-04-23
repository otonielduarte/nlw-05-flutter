import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/challenge/challenge_controller.dart';
import 'package:flutter_nlw_05/challenge/widgets/next_button/next_button_widget.dart';
import 'package:flutter_nlw_05/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:flutter_nlw_05/challenge/widgets/quiz/quizz_widget.dart';
import 'package:flutter_nlw_05/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  const ChallengePage(this.questions, {Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      controller.currentPage = pageViewController.page!.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  current: value,
                  max: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageViewController,
        children: widget.questions
            .map((question) => QuizWidget(
                  question: question,
                  onRight: () => controller.rightCount++,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NextButtonWidget.white(
                "Pular",
                onPressed: () => pageViewController.nextPage(
                  duration: Duration(microseconds: 350),
                  curve: Curves.linear,
                ),
              ),
              NextButtonWidget.green(
                "Confirmar",
                onPressed: () =>
                    Navigator.pop(context, 5 /*  controller.rightCount */),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
