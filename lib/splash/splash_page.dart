import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/home_page.dart';
import 'package:flutter_nlw_05/shared/util/nav.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    _teste();
  }

  _teste() async {
    await Future.delayed(Duration(milliseconds: 750));
    setState(() {
      _visible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
          ),
          child: Center(
            child: AnimatedOpacity(
              // If the widget is visible, animate to 0.0 (invisible).
              // If the widget is hidden, animate to 1.0 (fully visible).
              opacity: _visible ? 1.0 : 0.0,
              onEnd: () => push(context, HomePage(), replace: true),
              duration: Duration(milliseconds: 1500),
              // The green box must be a child of the AnimatedOpacity widget.
              child: Image.asset(AppImages.logo),
            ),
          ),
        ),
      ),
    );
  }
}
