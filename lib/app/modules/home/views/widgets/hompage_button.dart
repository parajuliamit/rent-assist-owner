import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class HomePageButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color fillColor;
  final VoidCallback onpress;
  const HomePageButton({
    Key? key,
    required this.text,
    required this.textColor,
    required this.fillColor,
    required this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: kWhiteColor)),
      onPressed: onpress,
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 17),
        ),
      ),
      color: fillColor,
      elevation: 0,
    );
  }
}
