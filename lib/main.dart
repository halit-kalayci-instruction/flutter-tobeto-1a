import 'dart:math';

import 'package:flutter/material.dart';
import 'package:introapp/data/questions.dart';
import 'package:introapp/models/quiz_question.dart';

void main() {
  runApp(const MaterialApp(home: QuestionScreen()));
}

// Stateless => Ekranda değişime uğramayacak, UI widget
// CTRL + .
class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/quiz-logo.png", width: 250),
            const Text(
              "Quiz App",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_right_alt),
              label: const Text("Start"),
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.fromLTRB(40, 20, 40, 20)),
            ),
          ],
        ),
      ),
    );
  }
}

// Boilerplate

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
