import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizzr/models/quiz.dart';
import 'package:quizzr/models/quizzes.dart';
import 'package:quizzr/widgets/quesection.dart';
import 'package:quizzr/widgets/solvedsection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizScreen extends StatefulWidget {
  final int _id;

  const QuizScreen({required int id, super.key}) : _id = id;

  @override
  State<QuizScreen> createState() => _QuizScreen();
}

class _QuizScreen extends State<QuizScreen> {
  int currentQuestion = 0;
  late List<int> selected;
  late SharedPreferences prefs;

  Future<List<String>?> getSolved() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getStringList("selected${widget._id}");
  }

  @override
  void initState() {
    selected = List.filled(sampleQuizzes[widget._id - 1].questions.length, -1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Quiz quiz = sampleQuizzes[widget._id - 1];

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        elevation: 1,
        centerTitle: true,
        title: Text(
          style: TextStyle(fontSize: 20),
          "Question ${currentQuestion + 1} of ${sampleQuizzes[widget._id - 1].questions.length}",
        ),
      ),
      body: FutureBuilder(
        future: getSolved(),
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                snapshot.data == null
                    ? QuestionSection(
                        quiz.questions[currentQuestion],
                        (v) => setState(() {
                          selected[currentQuestion] = v;
                        }),
                        currentQuestion,
                        selected,
                      )
                    : SolvedSection(
                        question: quiz.questions[currentQuestion],
                        quesIndex: currentQuestion,
                        solved: snapshot.data ?? [],
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (currentQuestion > 0) {
                              currentQuestion -= 1;
                            }
                          });
                        },
                        icon: Icon(Icons.arrow_back, size: 24),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () async {
                          setState(() {
                            if (currentQuestion < quiz.questions.length - 1) {
                              currentQuestion += 1;
                            } else {
                              List<String> str = selected
                                  .map((e) => e.toString())
                                  .toList();
                              snapshot.data == null
                                  ? prefs.setStringList(
                                      "selected${widget._id}",
                                      str,
                                    )
                                  : "";
                              context.pop();

                              snapshot.data == null
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Quiz submitted successfully!",
                                        ),
                                      ),
                                    )
                                  : "";
                            }
                          });
                        },
                        icon: (currentQuestion < quiz.questions.length - 1)
                            ? Icon(Icons.arrow_forward, size: 24)
                            : Icon(Icons.check, size: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
