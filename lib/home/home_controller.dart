import 'package:flutter/cupertino.dart';
import 'package:flutter_nlw_05/home/home_repository.dart';
import 'package:flutter_nlw_05/home/home_state.dart';
import 'package:flutter_nlw_05/shared/models/quizz_model.dart';
import 'package:flutter_nlw_05/shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizzModel>? quizzes;
  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 1));
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    //   await Future.delayed(Duration(seconds: 1));
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
