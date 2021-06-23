import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_controller.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/ui/questions_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    //load Strings from json file
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Get.to(() => QuestionsScreen());
  }

  Future<void> getData() async {
    try {
      List<Question> questions = List<Question>.empty(growable: true);
      String string1 =
          await rootBundle.loadString('assets/data/question1.json');
      Question question1 = Question.fromJson(json.decode(string1)[0]);
      questions.add(question1);
      String string2 =
          await rootBundle.loadString('assets/data/question2.json');
      Question question2 = Question.fromJson(json.decode(string2)[0]);
      questions.add(question2);
      Get.find<QuestionsController>().addQuestions(questions);
      print(question2.toJson());
      print(question1.toJson());
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Text('Quiz Starting',
                  style: Theme.of(context).textTheme.headline6),
            ),
          ),
        ],
      ),
    );
  }
}
