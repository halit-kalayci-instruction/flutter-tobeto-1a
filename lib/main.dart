import 'dart:math';

import 'package:flutter/material.dart';

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
  String question = "Soru 1";
  List<String> answers = [
    "Liste Elemanı 1",
    "Cevap 2",
    "Cevap 3",
    "Cevap 4",
    "Cevap 5"
  ];

  void changeQuestion() {
    setState(() {
      question = "Soru 2";
    }); // değişikliklerin ekrana da yansıtılması için gerekli..
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(question),
          ...answers.map((answer) {
            return ElevatedButton(
                onPressed: () {},
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ));
          })
        ]),
      ),
    );
  }
}
