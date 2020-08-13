import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String buttonText;
  final buttonClicked;
  final color;
  final textColor;

  Buttons({this.buttonText, this.color, this.textColor, this.buttonClicked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonClicked,
      child: Padding(
        padding: const EdgeInsets.all(8.5),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: textColor, fontSize: 21),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
