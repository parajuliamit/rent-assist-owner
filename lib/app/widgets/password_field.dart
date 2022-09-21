import 'package:flutter/material.dart';

import '../utils/constants.dart';

class PasswordField extends StatefulWidget {
  const PasswordField(this.label,
      {required this.controller, this.errorMessage = ''});

  final String label;
  final TextEditingController controller;
  final String errorMessage;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: !_isVisible,
      // style: const TextStyle(fontWeight: FontWeight.bold),
      cursorColor: Colors.black,

      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.key_outlined,
        ),
        suffixIcon: InkWell(
          onTap: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
        labelText: widget.label,
        labelStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
        ),
        errorText: widget.errorMessage.isEmpty ? null : widget.errorMessage,
      ),
    );
  }
}
