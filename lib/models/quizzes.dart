import 'package:quizzr/models/question.dart';
import 'package:quizzr/models/quiz.dart';

final List<Quiz> sampleQuizzes = [
  Quiz(
    quizTitle: "Flutter Basics",
    quizId: 1,
    quizDesc: "Test your knowledge about Flutter",
    questions: [
      Question(
        question: "What is Flutter?",
        options: [
          "A programming language",
          "A UI toolkit",
          "A database",
          "An operating system",
        ],
        ans: 1,
      ),
      Question(
        question: "Which language is used by Flutter?",
        options: ["Java", "Kotlin", "Dart", "Swift"],
        ans: 2,
      ),
      Question(
        question: "Which widget is used for immutable layouts?",
        options: [
          "StatefulWidget",
          "StatelessWidget",
          "InheritedWidget",
          "ContainerWidget",
        ],
        ans: 1,
      ),
      Question(
        question: "Which company developed Flutter?",
        options: ["Apple", "Microsoft", "Google", "Meta"],
        ans: 2,
      ),
    ],
  ),

  Quiz(
    quizTitle: "General Knowledge",
    quizId: 2,
    quizDesc:
        "Test your awareness of the world around you - history, geography, science, and more!",
    questions: [
      Question(
        question: "What is the capital of France?",
        options: ["Berlin", "Madrid", "Paris", "Rome"],
        ans: 2,
      ),
      Question(
        question: "Which planet is known as the Red Planet?",
        options: ["Earth", "Mars", "Jupiter", "Venus"],
        ans: 1,
      ),
      Question(
        question: "Who wrote 'Romeo and Juliet'?",
        options: [
          "Charles Dickens",
          "William Shakespeare",
          "Mark Twain",
          "Jane Austen",
        ],
        ans: 1,
      ),
      Question(
        question: "What is the largest ocean on Earth?",
        options: [
          "Indian Ocean",
          "Atlantic Ocean",
          "Pacific Ocean",
          "Arctic Ocean",
        ],
        ans: 2,
      ),
    ],
  ),

  Quiz(
    quizTitle: "Programming",
    quizId: 3,
    quizDesc:
        "Assess your coding knowledge and strengthen your fundamentals across core concepts.",
    questions: [
      Question(
        question: "Which data structure uses FIFO?",
        options: ["Stack", "Queue", "Tree", "Graph"],
        ans: 1,
      ),
      Question(
        question: "Which keyword creates a constant in Dart?",
        options: ["final", "var", "const", "static"],
        ans: 2,
      ),
      Question(
        question: "What does OOP stand for?",
        options: [
          "Object Oriented Programming",
          "Open Output Protocol",
          "Object Operation Process",
          "Optimized Order Processing",
        ],
        ans: 0,
      ),
      Question(
        question: "Which symbol is used for null safety in Dart?",
        options: ["?", "!", "??", "All of the above"],
        ans: 3,
      ),
    ],
  ),
];
