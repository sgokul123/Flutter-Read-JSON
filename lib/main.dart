import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app_theme.dart';
import 'package:quiz_app/controllers/overall_controller.dart';
import 'package:quiz_app/controllers/result_controller.dart';
import 'package:quiz_app/ui/splash_screen.dart';

import 'controllers/questions_controller.dart';

void main() {
  // Get.lazyPut<LauncherController>(() => LauncherController());
  Get.lazyPut<QuestionsController>(() => QuestionsController());
  Get.put(OverAllResultController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme(context: context).themeData,
      home: SplashScreen(),
    );
  }
}
