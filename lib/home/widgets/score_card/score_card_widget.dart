import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatelessWidget {
  final double progress;

  const ScoreCardWidget({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('progress >>>>>>>>>>>>>>>>>>>>>> $progress');
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 136,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ChartWidget(progress),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vamos começar", style: AppTextStyles.heading),
                  SizedBox(height: 8),
                  Text(
                    "Complete os desafios e avance em conhecimento",
                    style: AppTextStyles.body,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
