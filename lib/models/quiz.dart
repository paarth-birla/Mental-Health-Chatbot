// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mental_fitness_solution/models/answer.dart';
import 'package:mental_fitness_solution/models/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answer;
  const Quiz({
    Key? key,
    required this.questions,
    required this.questionIndex,
    required this.answer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Question(
          text: questions[questionIndex]['questionText'] as String,
        ),
        SizedBox(
          height: 30,
        ),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answerChoice) {
          return Column(
            children: [
              Answer(
                  handler: () {
                    answer(answerChoice['score'], answerChoice['text'] as String);
                    },
                  answer: answerChoice['text'] as String),
              SizedBox(
                height: 10,
              )
            ],
          );
        }).toList(),
      ],
    );
  }
}
