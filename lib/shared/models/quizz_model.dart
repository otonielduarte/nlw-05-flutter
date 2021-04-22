import 'dart:convert';

import 'package:flutter_nlw_05/shared/models/question_model.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizzModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  QuizzModel({
    required this.title,
    required this.questions,
    this.questionAwnsered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAwnsered': questionAwnsered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizzModel.fromMap(Map<String, dynamic> map) {
    return QuizzModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAwnsered: map['questionAwnsered'],
      image: map['image'],
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizzModel.fromJson(String source) =>
      QuizzModel.fromMap(json.decode(source));
}
