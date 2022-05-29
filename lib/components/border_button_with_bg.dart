import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:togg/common/common.dart';

class BorderButtonWithBackgroundColor extends StatelessWidget {

  BorderButtonWithBackgroundColor({
    required this.text,
    required this.color,
    required this.textColor,
    required this.borderColor,
    required this.onClickAction,
    required this.style,
    this.textSize = 18,
    this.height = 48,
    this.borderRadius = 4,
    this.canChangeableRadius = false,
    this.topLeft = 4,
    this.topRight = 4,
    this.bottomLeft = 4,
    this.bottomRight = 4,
  });
  double textSize;
  double height;
  bool canChangeableRadius;
  final Color color;
  final String text;
  final Color borderColor;
  final Color textColor;
  final TextStyle style;
  double borderRadius;
  double topLeft;
  double topRight;
  double bottomLeft;
  double bottomRight;
  Function onClickAction;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async => onClickAction,
      child: Text(text.tr,
          textAlign: TextAlign.center,
          style: style),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: borderColor,
        ),
        minimumSize: Size(double.infinity, height),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: canChangeableRadius ? BorderRadius.only(topLeft: Radius.circular(topLeft), topRight: Radius.circular(topRight), bottomLeft:  Radius.circular(bottomLeft), bottomRight: Radius.circular(bottomRight),) : BorderRadius.circular(4),
        ),
      ),
    );
  }
}