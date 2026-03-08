import 'package:quizzr/models/question.dart';

class Quiz {
  final String quizTitle;
  final int quizId;
  final String quizDesc;
  final List<Question> questions;

  const Quiz({
    required this.quizTitle,
    required this.quizId,
    required this.quizDesc,
    required this.questions,
  });
}
