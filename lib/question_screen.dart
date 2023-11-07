import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<QuestionScreen> {
  int currentQuestionIndex = 0; // O an kaçıncı soruda olduğumu

  void changeQuestion() {
    setState(() {
      if (questions.length - 1 > currentQuestionIndex) currentQuestionIndex++;
    }); // değişikliklerin ekrana da yansıtılması için gerekli..
    // setState => build fonkisyonunu yeniden çalıştırır.
  }

  // Spread Operator
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[
        currentQuestionIndex]; // Liste içerisinden o an kaçıncı soruda isek
    // o indexdeki veriyi al.

    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              Text(currentQuestion.question),
              ...currentQuestion.answers.map((answer) {
                return ElevatedButton(
                    child: Text(answer),
                    onPressed: () {
                      changeQuestion();
                    });
              })
            ],
          )
        ]),
      ),
    );
  }
}
