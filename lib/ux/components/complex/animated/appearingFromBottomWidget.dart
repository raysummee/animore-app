import 'package:flutter/material.dart';

class AppearingFromBottomWidget extends StatelessWidget {
  final bool showOverViewButton;
  final Widget widget;
  AppearingFromBottomWidget(this.showOverViewButton, this.widget);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: showOverViewButton? Matrix4.translationValues(0, 0, 0) :Matrix4.translationValues(0, 80, 0),
          child: Container(
            margin: EdgeInsets.fromLTRB(80, 0, 80, 8),
            child: widget
          ),
        ),
      ),
    );
  }
}