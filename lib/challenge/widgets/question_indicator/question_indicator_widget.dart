import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int current;
  final int max;
  const QuestionIndicatorWidget({
    Key? key,
    required this.current,
    required this.max,
  }) : super(key: key);

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
                "Questão $current",
                style: AppTextStyles.body,
              ),
              Text(
                "de $max",
                style: AppTextStyles.body,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ProgressIndicatorWidget(value: current / max),
          )
        ],
      ),
    );
  }
}
