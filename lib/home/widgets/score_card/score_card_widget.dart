import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/widgets/chart/chart_widget.dart';

class ScoreCardWidget extends StatefulWidget {
  @override
  _ScoreCardWidgetState createState() => _ScoreCardWidgetState();
}

class _ScoreCardWidgetState extends State<ScoreCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 136,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(flex: 1, child: ChartWidget()),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vamos começar", style: AppTextStyles.heading),
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
