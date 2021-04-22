import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão 04",
                style: AppTextStyles.body,
              ),
              Text(
                "de 10",
                style: AppTextStyles.body,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ProgressIndicatorWidget(value: 4 / 10),
          )
        ],
      ),
    );
  }
}
