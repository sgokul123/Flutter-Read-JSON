import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/launcher_controller.dart';
import 'package:quiz_app/models/options.dart';
import 'package:quiz_app/ui_utils/common_ui.dart';

class LauncherScreen extends StatelessWidget {
  Options option;

  LauncherScreen({this.option});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<LauncherController>(() => LauncherController());
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: GetX<LauncherController>(
          initState: (state) =>
              Get.find<LauncherController>().startSwitcherTimer(),
          builder: (_controller) {
            return _controller.switcherCount > 0
                ? Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 200,
                      height: 200,
                      child: AnimatedSwitcher(
                        duration: Duration(seconds: 1),
                        child: _controller.switcherCount < 2
                            ? _buildRear()
                            : _buildFront(context),
                      ),
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Get Ready!',
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 50.0),
                        Visibility(
                            visible: _controller.countDownTimer > 0,
                            child: Text('${_controller.countDownTimer}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(fontSize: 80.0))),
                      ],
                    ),
                  );
          }),
    );
  }

  Widget _buildFront(BuildContext context) {
    return CommonUI().cardWithColumn(context, option.value, option.label);
  }

  Widget _buildRear() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: __buildLayout(
          key: ValueKey(false),
          faceIcon: Icons.verified,
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
        child: Icon(faceIcon),
      ),
    );
  }
}
