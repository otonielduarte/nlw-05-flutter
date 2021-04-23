import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  set currentPage(int value) => currentPageNotifier.value = value;
  int get currentPage => currentPageNotifier.value;

  int rightCount = 0;
}
