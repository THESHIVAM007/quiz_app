import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/startscreen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}



class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var _activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }
  
  void choseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'result-screen';
      });
    }
  }
  void restartQuiz(){
 setState(() {
   _selectedAnswers=[];
   _activeScreen = 'questions-screen';
 });
  }



  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: choseAnswer,
      );
    }
    if(_activeScreen=='result-screen'){
      screenWidget = ResultScreen(chosenAnswers: _selectedAnswers,onRestart: restartQuiz,);
    }
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
