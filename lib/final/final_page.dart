import 'package:flutter/material.dart';

import 'package:flutter_nlw_05/core/core.dart';
import 'package:flutter_nlw_05/home/home_page.dart';
import 'package:flutter_nlw_05/shared/util/nav.dart';
import 'package:share_plus/share_plus.dart';

class FinalPage extends StatelessWidget {
  final String quizzName;
  final int length;
  final int right;

  const FinalPage({
    Key? key,
    required this.quizzName,
    required this.length,
    required this.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        margin: EdgeInsets.only(top: 40),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AppImages.trophy2,
              height: 250,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Parabéns!",
                    style: AppTextStyles.heading40,
                  ),
                ),
                Text(
                  'Você concluiu',
                  style: AppTextStyles.body,
                ),
                Text(
                  quizzName,
                  style: AppTextStyles.bodyBold,
                ),
                Text(
                  'com $right de $length acertos.',
                  style: AppTextStyles.body,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 68),
                  child: ElevatedButton(
                    onPressed: () => _onShare(context),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.purple)),
                    child: Text(
                      'Compartilhar',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => push(context, HomePage(), replace: true),
                  child: Text(
                    'Voltar ao início',
                    style: TextStyle(color: AppColors.grey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;
    await Share.share(
        "DevQuizz NLW 5 - Flutter $quizzName consegui $right acertos",
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }
}
