import 'package:flutter/material.dart';
import 'package:flutter_nlw_05/core/core.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButton extends StatelessWidget {
  final String _name;

  LevelButton(
    this._name, {
    Key? key,
  }) : super(key: key);

  final config = {
    "Fácil": {
      "color": AppColors.levelButtonFacil,
      "borderColor": AppColors.levelButtonBorderFacil,
      "fontColor": AppColors.levelButtonTextFacil
    },
    "Médio": {
      "color": AppColors.levelButtonMedio,
      "borderColor": AppColors.levelButtonBorderMedio,
      "fontColor": AppColors.levelButtonTextMedio
    },
    "Difícil": {
      "color": AppColors.levelButtonDificil,
      "borderColor": AppColors.levelButtonBorderDificil,
      "fontColor": AppColors.levelButtonTextDificil
    },
    "Perito": {
      "color": AppColors.levelButtonPerito,
      "borderColor": AppColors.levelButtonBorderPerito,
      "fontColor": AppColors.levelButtonTextPerito
    },
  };

  Color get color => config[_name]!['color']!;
  Color get borderColor => config[_name]!['borderColor']!;
  Color get fontColor => config[_name]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.fromBorderSide(BorderSide(color: borderColor)),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Text(
          _name,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontWeight: FontWeight.w400,
            backgroundColor: color,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
