import 'package:flutter/material.dart';

import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/shared/models/awnser_model.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool isSelected;
  final VoidCallback onTap;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  bool get isRight => awnser.isRight;
  String get title => awnser.title;

  Color get _selectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 4),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
            BorderSide(
                color:
                    isSelected ? _selectedBorderCardRight : AppColors.border),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    isSelected ? _selectedTextStyleRight : AppTextStyles.body,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRight : AppColors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.fromBorderSide(
                  BorderSide(
                    color: isSelected ? _selectedBorderRight : AppColors.border,
                  ),
                ),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIconRight,
                      size: 16,
                      color: AppColors.white,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
