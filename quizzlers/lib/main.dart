import 'package:flutter/material.dart';
import 'controllers/QuizController.dart';

QuizController quiz = new QuizController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Quizzler(title: 'Quizzler'),
    );
  }
}

class Quizzler extends StatefulWidget {
  Quizzler({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Icon> result = [];

  int questionNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                flex: 1,
                child: Row(
                  children: result,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CircleAvatar(
                      child: Text(questionNumber.toString()),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      quiz.questionList[questionNumber - 1].questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.green,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: Text('True'),
                      onPressed: () {
                        setState(() {
                          if (questionNumber <= quiz.questionList.length) {
                            if (quiz.questionList[questionNumber - 1]
                                    .answerText ==
                                true) {
                              result.add(
                                Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              );
                            } else {
                              result.add(
                                Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              );
                            }

                            questionNumber++;
                          }
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red,
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero),
                      ),
                      child: Text('False'),
                      onPressed: () {
                        setState(() {
                          if (questionNumber <= quiz.questionList.length) {
                            if (quiz.questionList[questionNumber - 1]
                                    .answerText ==
                                false) {
                              result.add(
                                Icon(
                                  Icons.done,
                                  color: Colors.green,
                                  size: 30,
                                ),
                              );
                            } else {
                              result.add(
                                Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                  size: 30,
                                ),
                              );
                            }

                            questionNumber++;
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
