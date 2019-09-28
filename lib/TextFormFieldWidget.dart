import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget
{
  final String labelName, errorMsg;
  final FocusNode focusNode, nextFocusNode;
  final TextEditingController controller;
  final TextInputAction textInputAction;

  TextFormFieldWidget({this.labelName, this.focusNode,
    this.controller, this.errorMsg, this.textInputAction, this.nextFocusNode});

  @override
  State<StatefulWidget> createState() => TextFormFieldWidgetState();
}

class TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
          labelText: widget.labelName,
          labelStyle: TextStyle(fontSize: 18.0)
      ),
      textInputAction: widget.textInputAction,
      textCapitalization: TextCapitalization.none,
      keyboardType: TextInputType.text,
      validator: (value)
      {
        if(value.isEmpty)
        {
          return widget.errorMsg;
        }
        return null;
      },
      onFieldSubmitted: (value) {
        FocusScope.of(context)
            .requestFocus(widget.nextFocusNode);
      },
      style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.normal),
    );
  }
}
