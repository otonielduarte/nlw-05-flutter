import 'package:flutter/cupertino.dart';
import 'package:flutter_nlw_05/home/home_repository.dart';
import 'package:flutter_nlw_05/home/home_state.dart';
import 'package:flutter_nlw_05/shared/models/quizz_model.dart';
import 'package:flutter_nlw_05/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final progressNotifier = ValueNotifier<double>(0.0);
  set progress(double points) => progressNotifier.value = points;
  double get progress => progressNotifier.value;

  UserModel? user;
  List<QuizzModel>? quizzes;
  final repository = HomeRepository();

  initController() async {
    state = HomeState.loading;
    await Future.wait([_getUser(), _getQuizzes()]);
    updateScore(0);
    state = HomeState.success;
  }

  Future _getUser() async {
    // await Future.delayed(Duration(seconds: 1));
    user = await repository.getUser();
    return user;
  }

  Future _getQuizzes() async {
    quizzes = await repository.getQuizzes();
    return quizzes;
  }

  void _updateProgress() {
    double countQuestions = 0;
    for (int i = 0; i < quizzes!.length; i++) {
      countQuestions += quizzes![i].questions.length;
    }
    progress = (user?.score ?? 0 * 100) / countQuestions;
  }

  void updateScore(int points) {
    user!.score += points;
    _updateProgress();
  }
}
