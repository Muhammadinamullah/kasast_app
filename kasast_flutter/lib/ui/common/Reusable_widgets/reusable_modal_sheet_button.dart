import 'package:flutter/material.dart';

class ModelSheetButton extends StatelessWidget {
  final title;
  final buttonColor;
  final textColor;

  const ModelSheetButton({Key key, this.title, this.buttonColor, this.textColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 140,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(2, 2), // changes position of shadow
          ),
        ],
      ),
    );
  }
}
