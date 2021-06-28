import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/result_controller.dart';
import 'package:quiz_app/models/options.dart';
import 'package:quiz_app/ui_utils/common_ui.dart';

class ResultScreen extends StatelessWidget {
  Options option;

  ResultScreen({this.option});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<ResultController>(() => ResultController());
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: GetX<ResultController>(
          initState: (state) =>
              Get.find<ResultController>().startSwitcherTimer(option),
          builder: (_controller) {
            return _controller.switcherCount > 0
                ? Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 200,
                      child: FlipCard(
                        key: _controller.cardKey,
                        direction: FlipDirection.HORIZONTAL,
                        front: _buildFront(context),
                        back: _buildRear(option.score),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Ready!',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(fontSize: 25)),
                        SizedBox(height: 50.0),
                        Visibility(
                            visible: _controller.countDownTimer > 0,
                            child: Text('${_controller.countDownTimer}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 140))),
                      ],
                    ),
                  );
          }),
    );
  }

  Widget _buildFront(BuildContext context) {
    return CommonUI().cardWithColumn(context, option.value, option.label);
  }

  Widget _buildRear(int score) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: __buildLayout(
          key: ValueKey(false),
          faceIcon: score == 0 ? Icons.close : Icons.verified,
        ),
      ),
    );
  }

  Widget __buildLayout({Key key, IconData faceIcon}) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Icon(
          faceIcon,
          size: 200,
        ),
      ),
    );
  }
}
