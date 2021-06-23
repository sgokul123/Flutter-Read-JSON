import 'dart:async';

import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_controller.dart';
import 'package:quiz_app/ui/questions_screen.dart';

class LauncherController extends GetxController {
  final _pendingCount = 3.obs;
  final _switcherCount = 2.obs;

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
          Get.off(() => QuestionsScreen());
          Get.find<QuestionsController>().resetData();
          switcherCount = 2;
        } else {
          countDownTimer--;
        }
      },
    );
  }

  startSwitcherTimer() {
    const oneSec = const Duration(seconds: 1);
    new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (switcherCount == 0) {
          // Cancel the timer
          timer.cancel();
          startCountDownTimer(); // Redirect to Questions screen
          //switcherCount = 3;
          // Get.to(QuestionsScreen());
        } else {
          switcherCount--;
        }
      },
    );
  }
}
