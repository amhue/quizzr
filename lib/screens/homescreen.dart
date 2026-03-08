import 'package:flutter/material.dart';
import 'package:quizzr/models/quizzes.dart';
import 'package:quizzr/widgets/headercard.dart';
import 'package:quizzr/widgets/texts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quizzr"), elevation: 1),

      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleLarge(data: "Welcome"),
            DescText(data: "Choose a quiz to test your knowledge"),

            Container(
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: sampleQuizzes
                    .map(
                      (e) => Padding(
                        padding: EdgeInsetsGeometry.fromLTRB(0, 10, 0, 10),
                        child: Headercard(
                          cardTitle: e.quizTitle,
                          desc: e.quizDesc,
                          questionLen: e.questions.length,
                          index: e.quizId,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
