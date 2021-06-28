import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/question.dart';

class QuestionsController extends GetxController
    with SingleGetTickerProviderMixin {
  final _pendingCount = 3.obs;
  int index = 0;
  final _actionType = 1.obs;
  final _waitingCount = 15.obs;
  AnimationController controller;
  Question selected;
  List<Question> questions = List<Question>.empty(growable: true);

  get countDownTimer => this._pendingCount.value;

  set countDownTimer(value) => this._pendingCount.value = value;

  get waitingCount => this._waitingCount.value;

  set waitingCount(value) => this._waitingCount.value = value;

  get actionType => this._actionType.value;

  set actionType(value) => this._actionType.value = value;

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
    selected = questions[index];
  }

  void resetData() {
    ///check index of selected from list
    index = index > 0 ? 0 : 1;
    selected = questions[index];
    this.waitingCount = 5;
  }

  void restartTest() {
    index = 0;
    selected = questions[index];
    this.waitingCount = 5;
    startCountDownTimer();
    startWaitingTime();
  }

  void changeLayout() {
    if (this.actionType == 2)
      this.actionType = 0;
    else
      this.actionType += this.actionType;
    print("actionType $actionType");
    update();
  }
}
