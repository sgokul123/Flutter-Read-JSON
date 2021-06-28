import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/overall_controller.dart';
import 'package:quiz_app/models/options.dart';
import 'package:get/get.dart';

class OverAllResultScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.deepPurpleAccent,
      body: GetX<OverAllResultController>(
          initState: (state) =>
              Get.find<OverAllResultController>().getTotalScore(),
          builder: (_controller) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Score !',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontSize: 25)),
                  SizedBox(height: 50.0),
                  Align(
                    alignment: Alignment.center,
                    child: Text('${_controller.totalScore}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 140)),
                  ),
                ],
              ),
            );
          }),
    );
  }
}