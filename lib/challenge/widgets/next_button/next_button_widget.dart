import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color bgColor;
  final Color color;
  final Color borderColor;
  final Color overlayColor;

  const NextButtonWidget(
    this.label, {
    Key? key,
    required this.onPressed,
    required this.bgColor,
    required this.color,
    required this.borderColor,
    required this.overlayColor,
  }) : super(key: key);

  NextButtonWidget.green(this.label, {required this.onPressed})
      : this.bgColor = AppColors.darkGreen,
        this.color = AppColors.white,
        this.overlayColor = AppColors.green,
        this.borderColor = AppColors.green;

  NextButtonWidget.white(this.label, {required this.onPressed})
      : this.bgColor = AppColors.white,
        this.borderColor = AppColors.border,
        this.overlayColor = AppColors.lightGreen,
        this.color = AppColors.grey;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.5),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            overlayColor: MaterialStateProperty.all(overlayColor),
            side: MaterialStateProperty.all(BorderSide(color: borderColor)),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
