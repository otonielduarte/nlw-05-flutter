import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_nlw_05/shared/models/quizz_model.dart';
import 'package:flutter_nlw_05/shared/models/user_model.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString('assets/database/user.json');
    final user = UserModel.fromJson(response);
    return user;
  }

  Future<List<QuizzModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString('assets/database/quizzes.json');
    final list = jsonDecode(response) as List;
    return list.map((quizz) => QuizzModel.fromMap(quizz)).toList();
  }
}
