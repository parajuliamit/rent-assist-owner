import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onpress;
  final String text;
  final Color fillColor;
  final Color textColor;

  const CustomButton(this.text, this.onpress,
      {this.fillColor = kPrimaryColor, this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kPrimaryColor)),
      onPressed: onpress,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.75,
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 17),
          ),
        ),
      ),
      color: fillColor,
      elevation: 0,
    );
  }
}
