import 'package:flutter/material.dart';
import 'package:quizzr/models/question.dart';
import 'package:quizzr/widgets/texts.dart';

class QuestionSection extends StatefulWidget {
  final Question _question;
  final Function(int) onTap;
  final int quesIndex;
  final List<int> selected;
  const QuestionSection(
    this._question,
    this.onTap,
    this.quesIndex,
    this.selected, {
    super.key,
  });

  @override
  State<QuestionSection> createState() => _QuestionSectionState();
}

class _QuestionSectionState extends State<QuestionSection> {
  late int selectedNow;

  @override
  Widget build(BuildContext context) {
    selectedNow = widget.selected[widget.quesIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        TitleSmall(data: widget._question.question),
        Container(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: widget._question.options
              .asMap()
              .entries
              .map(
                (e) => Container(
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 5),

                  child: Card(
                    elevation: 0,

                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedNow = e.key;
                        });
                        widget.onTap(e.key);
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: e.key == selectedNow
                              ? Theme.of(context).colorScheme.primaryContainer
                              : Theme.of(context).colorScheme.surfaceContainer,
                        ),
                        padding: EdgeInsets.all(12),
                        child: BodyText(data: e.value),
                      ),
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
