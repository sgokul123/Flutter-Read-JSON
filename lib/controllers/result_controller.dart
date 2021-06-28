import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/overall_controller.dart';
import 'package:quiz_app/controllers/questions_controller.dart';
import 'package:quiz_app/models/options.dart';
import 'package:quiz_app/ui/overall_result_screen.dart';
import 'package:quiz_app/ui/questions_screen.dart';

class ResultController extends GetxController {
  final _pendingCount = 3.obs;
  final _switcherCount = 5.obs;

  get countDownTimer => this._pendingCount.value;

  set countDownTimer(value) => this._pendingCount.value = value;

  get switcherCount => this._switcherCount.value;

  set switcherCount(value) => this._switcherCount.value = value;

  startCountDownTimer() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countDownTimer == 0) {
          // Cancel the timer
          timer.cancel();
          // Redirect to Questions screen
          countDownTimer = 3;
          if (Get.find<QuestionsController>().index > 0) {
            Get.off(() => OverAllResultScreen());
            Get.find<QuestionsController>().resetData();
          } else {
            Get.off(() => QuestionsScreen());
            Get.find<QuestionsController>().resetData();
          }
          switcherCount = 2;
        } else {
          countDownTimer--;
        }
      },
    );
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  startSwitcherTimer(Options option) {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (switcherCount == 1) {
          // Cancel the timer
          timer.cancel();
          if (option.score == 0) {
            if (Get.find<QuestionsController>().index > 0) {
              Get.off(() => OverAllResultScreen());
            } else {
              Get.off(() => QuestionsScreen());
              Get.find<QuestionsController>().resetData();
            }
          } else {
            if (Get.find<QuestionsController>().index > 0) {
              Get.off(() => OverAllResultScreen());
            } else {
              startCountDownTimer();
            }
          }
          // Redirect to Questions screen
          //switcherCount = 3;
          // Get.to(QuestionsScreen());
        } else {
          switcherCount--;
          if (switcherCount == 2) cardKey.currentState.toggleCard();
        }
      },
    );
    Get.find<OverAllResultController>().addSelectedOption(option);
  }
}
