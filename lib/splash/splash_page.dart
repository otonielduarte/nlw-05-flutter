import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
          child: Center(
            child: Image.asset(AppImages.logo),
          ),
        ),
      ),
    );
  }
}
