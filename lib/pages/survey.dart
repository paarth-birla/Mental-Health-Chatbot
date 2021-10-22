// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mental_fitness_solution/backend/apis.dart';
import 'package:mental_fitness_solution/models/quiz.dart';
import 'package:mental_fitness_solution/pages/welcome.dart';

class Survey extends StatefulWidget {
  const Survey({Key? key}) : super(key: key);

  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _questions = [
    {
      'questionText': [
        {
          'text': 'Q1. How often are you stressed?',
          'id': 0,
        }
      ],
      'answers': [
        {'text': 'All the time', 'score': 5},
        {'text': 'Sometimes', 'score': 1},
        {'text': 'Rarely', 'score': 0},
        {'text': 'Often', 'score': 3},
      ],
    },
    {
      'questionText': [
        {
          'text': 'Q2. Average Sleep hours in a day',
          'id': 1,
        }
      ],
      'answers': [
        {'text': '7-10 hrs', 'score': 0},
        {'text': '5-6 hrs', 'score': 2},
        {'text': '<5 hrs', 'score': 4},
      ],
    },
    {
      'questionText': [
        {
          'text': 'Q3. Do you consume any intoxicant to overcome your problem?',
          'id': 2,
        }
      ],
      'answers': [
        {'text': 'Yes, Often', 'score': 4},
        {'text': 'Yes, Rarely', 'score': 2},
        {'text': 'No', 'score': 0},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q4. During past 4 weeks, how often have/has your emotional problems interferred with your social activities?',
          'id': 3,
        }
      ],
      'answers': [
        {'text': 'All the time', 'score': 5},
        {'text': 'Sometimes', 'score': 1},
        {'text': 'Rarely', 'score': 0},
        {'text': 'Often', 'score': 3},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q5. During past 4 weeks, have you had any problems with your work or daily life due to physicial health?',
          'id': 4,
        }
      ],
      'answers': [
        {'text': 'Yes', 'score': 4},
        {'text': 'No', 'score': 0},
        {'text': 'Maybe', 'score': 2},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q6. Have you ever experienced an "attack" of fear, anxiety or panic?',
          'id': 5,
        }
      ],
      'answers': [
        {'text': 'Yes, recently', 'score': 5},
        {'text': 'Long time ago', 'score': 2},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q7. Have you ever considered consulting about mental health?',
          'id': 6,
        }
      ],
      'answers': [
        {'text': '1 month ago', 'score': 4},
        {'text': '6 months ago', 'score': 2},
        {'text': '1 year ago', 'score': 1},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText': [
        {
          'text': 'Q8. How did your appetite changed over past few weeks?',
          'id': 7,
        }
      ],
      'answers': [
        {'text': 'Reduced', 'score': 3},
        {'text': 'Increased', 'score': 3},
        {'text': 'Unaffected', 'score': 0},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q9. How often you express your feelings with your closed ones?',
          'id': 8,
        }
      ],
      'answers': [
        {'text': 'Always', 'score': 1},
        {'text': 'Sometimes', 'score': 2},
        {'text': 'Not at all', 'score': 4},
      ],
    },
    {
      'questionText': [
        {
          'text':
              'Q10. Over the past month, how frequently did you feel lonely?',
          'id': 9,
        }
      ],
      'answers': [
        {'text': 'Often', 'score': 4},
        {'text': 'Rarely', 'score': 1},
        {'text': 'Never', 'score': 0},
      ],
    },
    {
      'questionText': [
        {
          'text': 'Q11. Did you get any suicidal thoughts lately?',
          'id': 10,
        }
      ],
      'answers': [
        {'text': 'Yes', 'score': 5},
        {'text': 'No', 'score': 0},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = {};

  void _resetSurvey() {
    setState(() {
      _questionIndex = 0;
      _totalScore = {};
    });
  }

  void _answer(int score, String answer, int questionCode) {
    var result = {};
    // _totalScore[questionCode] = answer;
    result[answer] = score;
    _totalScore[questionCode]= result;
    // _totalScore.addEntries(result);
    // print(_totalScore);
    setState(() {
      _questionIndex += 1;
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  Future<void> passResult(var totalScore) async
  {
    String url = '1234567890';
    var response = await APIS.getResponse(url);

    if (response != 'Failed') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Survey(),
        ),
      );
    }
    else
    {
      print('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   top: 0,
            //   child: Container(
            //     height: MediaQuery.of(context).size.height / 3,
            //     color: Colors.tealAccent,
            //   ),
            // ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(25),
                  //   topRight: Radius.circular(25),
                  // ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: _questionIndex < _questions.length
                              ? Quiz(
                                  questions: _questions,
                                  questionIndex: _questionIndex,
                                  answer: _answer,
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.all(20),
                                        child: SizedBox(
                                          width: 400,
                                          height: 60,
                                          child: GestureDetector(
                                            onTap: () {
                                              print(_totalScore);
                                              _resetSurvey();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      WelcomePage(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Submit',
                                                  style: GoogleFonts
                                                      .portLligatSans(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .headline1,
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
