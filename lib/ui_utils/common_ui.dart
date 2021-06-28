import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_html_css/simple_html_css.dart';

class CommonUI {
  Widget cardWithColumn(BuildContext context, int index, String label) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(5.5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                padding: EdgeInsets.only(bottom: 3.0, top: 2.0),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(5.5),
                    child: Text("${index + 1}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontSize: 20.0, color: Colors.black)),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Colors.amber,
                ),
              ),
              Expanded(
                child: RichText(
                  text: HTML.toTextSpan(
                    context,
                    label,
                    defaultTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.1,
                ),
              )
            ],
          ),
        ));
  }
}
