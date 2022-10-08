import "package:flutter/material.dart";
import "./quiz.dart";
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  var totalScore = 0;

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore = totalScore + score;

    setState(() {
      questionIndex = questionIndex + 1;
    });
    if (questionIndex < questions.length) {
      print('We have more questions');
    } else {
      print('we have no more questions');
    }
    print(totalScore);
  }

  final questions = const [
    {
      'questiontext': 'What are you ?',
      'answers': [
        {'text': 'Human', 'score': 10},
        {'text': 'Animal', 'score': 8},
        {'text': 'Bird', 'score': 6},
        {'text': 'Ghost', 'score': 4}
      ],
    },
    {
      'questiontext': 'What\s your favourite anime ?',
      'answers': [
        {'text': 'MHA', 'score': 10},
        {'text': 'AOT', 'score': 8},
        {'text': 'Bleach', 'score': 6},
        {'text': 'Naurto', 'score': 4}
      ],
    },
    {
      'questiontext': 'What\s your favourite K drama?',
      'answers': [
        {'text': 'All of us are Dead', 'score': 10},
        {'text': 'Hellbound', 'score': 8},
        {'text': 'Squid game', 'score': 6},
        {'text': 'It\s okay to be not okay', 'score': 4}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quiz app")),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions,
              )
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
