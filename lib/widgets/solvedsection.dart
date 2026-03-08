import 'package:flutter/material.dart';
import 'package:quizzr/models/question.dart';
import 'package:quizzr/widgets/texts.dart';

class SolvedSection extends StatelessWidget {
  final Question _question;
  final int _quesIndex;
  final List<String> _solved;

  const SolvedSection({
    required Question question,
    required int quesIndex,
    required List<String> solved,
    super.key,
  }) : _question = question,
       _quesIndex = quesIndex,
       _solved = solved;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TitleSmall(data: _question.question),
        Container(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: _question.options
              .asMap()
              .entries
              .map(
                (e) => Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),

                  child: Card(
                    elevation: 0,
                    color: e.key == _question.ans
                        ? Colors.green
                        : int.parse(_solved[_quesIndex]) == e.key
                        ? Theme.of(context).colorScheme.errorContainer
                        : null,

                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      padding: EdgeInsets.all(12),
                      child: BodyText(data: e.value),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
