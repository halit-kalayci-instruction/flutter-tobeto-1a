import 'package:flutter/material.dart';
import 'package:introapp/question_screen.dart';
import 'package:introapp/start_screen.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  _SwiperScreenState createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  var _activeScreenName = "start-screen";
  List<Map<String, String>> questionsAndAnswers =
      []; // key,value => {"Soru 1":"Cevap 1", "Soru 2":"Cevap 2"}
  List<String> chosenAnswers = [];

  void changeScreen() {
    setState(() {
      _activeScreenName = "quiz-screen";
    });
  }

  void chooseAnswer(String answer) {
    print("Question Screen'den Yeni bir cevap geldi: " + answer);
    chosenAnswers.add(answer);
  }

  // Callback functionlar
  // Sorular bittiğinde resultscreen açılmalıdır. Cevaplanan sorular listelenmelidir
  // (Liste widgetları)

  // ResultScreen oluşturulması
  // QuestionScreen'den soruların bittiğine dair callback alınması
  // ResultScreen'in gösterilmesi
  // EKSTRA : Verilen cevaplar hafızada tutulup şu soruya şu cevap verdiniz şeklinde ResultScreen'de listelenmesi
  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(changeScreen);

    if (_activeScreenName == "quiz-screen") {
      activeScreen =
          QuestionScreen(onChooseAnswer: (answer) => chooseAnswer(answer));
    }

    // eğer activeScreenName result-screen ise resultscreen değerini newle ve görüntüye bas..

    return Container(child: activeScreen);
  }
}
