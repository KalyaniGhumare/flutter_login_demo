import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/services.dart';

class PasswordFilled extends StatefulWidget {
  const PasswordFilled({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.labelStyle,
    this.textStyle,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.controller, this.focusNode,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final TextStyle textStyle;
  final TextStyle labelStyle;
  final List<TextInputFormatter> inputFormatters;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;
  final TextEditingController controller;
  final FocusNode focusNode;

  @override
  PasswordFiledState createState() => PasswordFiledState();
}

class PasswordFiledState extends State<PasswordFilled> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      validator: widget.validator,
      style: widget.textStyle,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: widget.labelStyle,
          helperText: widget.helperText,
          suffixIcon: GestureDetector(
            dragStartBehavior: DragStartBehavior.down,
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility,
                semanticLabel:
                _obscureText ? 'show password' : 'hide_password'),
          )),
    );
  }
}
