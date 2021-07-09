import 'package:quizzler/models/Question.dart';

class QuizController {
  List<Question> questionList = [
    Question(q1: 'Is Sun the biggest star in the universe?', a1: false),
    Question(
        q1: 'Is Earth in the habitable zone in the solar system?', a1: true),
    Question(q1: 'Is Jupiter called the Gas Giant?', a1: true)
  ];
}
