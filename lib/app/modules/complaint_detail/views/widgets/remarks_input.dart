import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class RemarksInput extends StatelessWidget {
  final String label;

  final TextInputType inputType;
  final String errorMessage;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final int? maxlines;

  const RemarksInput(this.label,
      {this.inputType = TextInputType.text,
      this.textInputAction = TextInputAction.next,
      this.errorMessage = "",
      this.controller,
      this.maxlines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      textInputAction: textInputAction,
      controller: controller,
      maxLines: maxlines,
      // style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor, width: 1),
        ),
        errorText: errorMessage.isEmpty ? null : errorMessage,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor, width: 1),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      ),
    );
  }
}
