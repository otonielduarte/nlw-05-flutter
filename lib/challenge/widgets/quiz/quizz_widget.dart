import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/challenge/widgets/awnser/awnser.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/shared/models/awnser_model.dart';
import 'package:flutter_nlw_05/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onRight;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onRight,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  @override
  Widget build(BuildContext context) {
    final List<AwnserModel> awnsers = widget.question.awnsers;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          for (int i = 0; i < awnsers.length; i++)
            AwnserWidget(
              awnser: awnsers[i],
              isSelected: indexSelected == i,
              onTap: () {
                if (awnsers[i].isRight) {
                  widget.onRight();
                }
                setState(() => indexSelected = i);
              },
            )
        ],
      ),
    );
  }
}
