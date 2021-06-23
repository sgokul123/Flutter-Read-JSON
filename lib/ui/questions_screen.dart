import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_controller.dart';
import 'package:quiz_app/ui/launcher_screen.dart';
import 'package:quiz_app/ui_utils/common_ui.dart';
import 'package:simple_html_css/simple_html_css.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsController _controller;

  @override
  Widget build(BuildContext context) {
    _controller = Get.find<QuestionsController>();
    _controller.startCountDownTimer();
    _controller.startWaitingTime();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.ac_unit_sharp,
                      color: Colors.white,
                    ),
                    Text('Oh My Quiz!',
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 25.0)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                      'In a democracy, why do we choose our leaders through elections?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 30.0)),
                ),
              ),
              Container(
                width: 150,
                height: 110,
                padding: EdgeInsets.only(left: 20.5, right: 20.5),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: AnimatedBuilder(
                        animation: _controller?.controller,
                        builder: (BuildContext context, Widget child) {
                          return CustomPaint(
                              painter: CustomTimerPainter(
                            animation: _controller.controller,
                            backgroundColor: Colors.grey,
                            color: Colors.redAccent,
                          ));
                        },
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.center,
                      child: AnimatedBuilder(
                          animation: _controller.controller,
                          builder: (BuildContext context, Widget child) {
                            return FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Obx(() => Text(
                                    '0:0${_controller.waitingCount}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(fontSize: 40.0))),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: _controller?.selected != null &&
                      _controller.selected.data.options.length > 0,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _controller.selected.data.options.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape
                            ? 3
                            : 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (
                        context,
                        index,
                      ) {
                        return GestureDetector(
                            onTap: () {
                              Get.off(() => LauncherScreen(
                                  option: _controller
                                      .selected.data.options[index]));
                            },
                            child: CommonUI().cardWithColumn(
                                context,
                                _controller.selected.data.options[index].value,
                                _controller
                                    .selected.data.options[index].label));
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
