import 'dart:io';

import 'question_model.dart';

class QuestionGenerator {
  final String name;

  QuestionGenerator(this.name,
      {List<Question>? externalQuestionList}) {
    questionList = externalQuestionList ?? [];
  }

  List<Question> questionList = [];

  factory QuestionGenerator.fromJson(
      Map<String, dynamic> json) {
    List<Question> questionList =
        (json['questionList'] as List)
            .map((e) => Question.fromJson(e))
            .toList();

    return QuestionGenerator(json['name'],
        externalQuestionList: questionList);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> questionRawList =
        questionList
            .map((e) => e.toJson())
            .toList();
    return {
      'name': name,
      'questionList': questionRawList
    };
  }

  // run
  P? run<T extends P, E extends P, P>(
      T genreOne, E genreTwo) {
    if (questionList.isEmpty) {
      throw Exception(
          "There is no question to ask.");
    }

    int genreOnePosibility = 0;
    int genreTwoPosibility = 0;

    print('\n');

    for (var question in questionList) {
      final _answer = _ask(question);
      if (_answer == null) {
      } else {
        _answer == 1
            ? genreOnePosibility++
            : genreTwoPosibility++;
      }
    }

    if (genreOnePosibility > genreTwoPosibility) {
      return genreOne;
    } else if (genreOnePosibility <
        genreTwoPosibility) {
      return genreTwo;
    } else {
      print('Posibilities are uncomparable.');
      return null;
    }
  }

  void add(Question q) {
    questionList.add(q);
  }

  int? _ask(Question q) {
    print(q.question);

    int decide = 0;

    try {
      decide =
          int.parse(stdin.readLineSync() ?? '0');
    } catch (e) {
      print("Error : $e");
      _ask(q);
    }

    if (decide == 1) {
      return 1;
    } else if (decide == 2) {
      return 2;
    } else {
      // Invalid State
      print(
          "Invalid value but it is taken. Please make sure correct answer");
      return null;
    }
  }
}
