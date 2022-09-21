import 'package:flutter/material.dart';

import '../utils/constants.dart';

class InputField extends StatelessWidget {
  final String label;
  final Icon? icon;
  final TextInputType inputType;
  final String errorMessage;
  final TextInputAction textInputAction;
  final TextEditingController? controller;

  const InputField(this.label,
      {this.inputType = TextInputType.text,
      this.icon,
      this.textInputAction = TextInputAction.next,
      this.errorMessage = "",
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      textInputAction: textInputAction,
      controller: controller,
      // style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: icon,
        errorText: errorMessage.isEmpty ? null : errorMessage,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        labelText: label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
      ),
    );
  }
}
