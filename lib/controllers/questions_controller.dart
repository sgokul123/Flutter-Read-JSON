import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question.dart';

class QuestionsController extends GetxController
    with SingleGetTickerProviderMixin {
  final _pendingCount = 3.obs;
  int _index = 0;
  final _waitingCount = 5.obs;
  AnimationController controller;
  Question selected;
  List<Question> questions = List<Question>.empty(growable: true);

  get countDownTimer => this._pendingCount.value;

  set countDownTimer(value) => this._pendingCount.value = value;

  get waitingCount => this._waitingCount.value;

  set waitingCount(value) => this._waitingCount.value = value;

  startCountDownTimer() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    controller.addListener(() {});
    controller.forward();
  }

  @override
  void onInit() {
    super.onInit();
  }

  startWaitingTime() {
    try {
      const oneSec = const Duration(seconds: 1);
      new Timer.periodic(
        oneSec,
        (Timer timer) {
          if (waitingCount == 0) {
            // Cancel the timer
            timer.cancel();
            // Redirect to Questions screen
            // Get.to(QuestionsScreen());
          } else {
            waitingCount--;
          }
        },
      );
    } on Exception catch (e) {}
  }

  void addQuestions(List<Question> questions) {
    this.questions = questions;
    selected = questions[_index];
  }

  void resetData() {
    ///check index of selected from list
    _index = _index > 0 ? 0 : 1;
    selected = questions[_index];
  }
}
