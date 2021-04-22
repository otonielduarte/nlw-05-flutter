import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/shared/widgets/progress_indicator_widget.dart';

class QuizCard extends StatelessWidget {
  final String iconAsset;
  final String _title;
  final int current;
  final int max;
  const QuizCard(
    this._title, {
    Key? key,
    required this.iconAsset,
    required this.current,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            child: Image.asset(iconAsset),
          ),
          Text(
            _title,
            style: AppTextStyles.heading15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '$current de $max',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                child: ProgressIndicatorWidget(
                  value: current / max,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
