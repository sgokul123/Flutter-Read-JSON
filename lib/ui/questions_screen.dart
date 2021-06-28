import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/questions_controller.dart';
import 'package:quiz_app/ui/result_screen.dart';
import 'package:quiz_app/ui_utils/common_ui.dart';
import 'package:simple_html_css/simple_html_css.dart';

class QuestionsScreen extends StatelessWidget {
  QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    controller = Get.find<QuestionsController>();
    controller.startCountDownTimer();
    controller.startWaitingTime();
    return GetX<QuestionsController>(
        initState: (state) => Get.find<QuestionsController>(),
        builder: (_controller) {
          return Scaffold(
            floatingActionButton:_controller.waitingCount > 0? FloatingActionButton.extended(
              onPressed: () {
                _controller.changeLayout();
              },
              label: Text(''),
              icon: Icon(_controller.actionType != 0
                  ? _controller.actionType == 1
                      ? Icons.list_outlined
                      : Icons.grid_on_sharp
                  : Icons.more_horiz_rounded),
              backgroundColor: Colors.pink,
            ):null,
            backgroundColor: Colors.deepPurpleAccent,
            body: _controller.waitingCount > 0
                ? Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                              Text('My Quiz!',
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
                            child: RichText(
                              text: HTML.toTextSpan(
                                context,
                                '${_controller.selected.data.stimulus ?? ""}',
                                defaultTextStyle: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 20.0),
                              ),
                              textAlign: TextAlign.center,
                              textScaleFactor: 1.1,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: 200,
                              height: 200,
                              padding: EdgeInsets.all(10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 150,
                                    height: 150,
                                    child: Positioned.fill(
                                      child: AnimatedBuilder(
                                        animation: _controller?.controller,
                                        builder: (BuildContext context,
                                            Widget child) {
                                          return CustomPaint(
                                              painter: CustomTimerPainter(
                                            animation: _controller.controller,
                                            backgroundColor: Colors.grey,
                                            color: Colors.redAccent,
                                          ));
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 150,
                                    child: Align(
                                      alignment: FractionalOffset.center,
                                      child: AnimatedBuilder(
                                          animation: _controller.controller,
                                          builder: (BuildContext context,
                                              Widget child) {
                                            return FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Obx(() => Text(
                                                    '0:0${_controller.waitingCount}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6
                                                        .copyWith(
                                                            fontSize: 40.0))),
                                              ),
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                            visible: _controller.actionType == 0 &&
                                _controller?.selected != null &&
                                _controller.selected.data.options.length > 0,
                            child: Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    _controller.selected.data.options.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).orientation ==
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
                                  return getListItem(context, index);
                                },
                              ),
                            )),
                        Visibility(
                          visible: _controller.actionType == 1 &&
                              _controller?.selected != null &&
                              _controller.selected.data.options.length > 0,
                          child: Expanded(
                            child: Container(
                              height: 100,
                              child: ListView.builder(
                                shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      _controller.selected.data.options.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Container(
                                        width: 200,
                                        height: 200,
                                        child: getListItem(context, index));
                                  }),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _controller.actionType == 2 &&
                              _controller?.selected != null &&
                              _controller.selected.data.options.length > 0,
                          child: Expanded(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _controller.selected.data.options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      height: 200,
                                      child: getListItem(context, index));
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        child: Text("Retry"),
                        onPressed: () {
                          _controller.restartTest();
                        },
                      ),
                    ),
                  ),
          );
        });
  }

  Widget getListItem(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          Get.off(() =>
              ResultScreen(option: controller.selected.data.options[index]));
        },
        child: CommonUI().cardWithColumn(
            context,
            controller.selected.data.options[index].value,
            controller.selected.data.options[index].label));
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
