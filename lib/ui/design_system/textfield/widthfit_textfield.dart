import 'package:flutter/material.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class WidthFitTextField extends StatelessWidget {
  final FocusNode focusNode;
  final Function onChanged;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String helperText;
  final GlobalKey key;
  final Function onTab;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool obscureText;
  final String obscuringCharacter;
  final String errorText;
  final Function onSubmitted;

  WidthFitTextField(
      {this.focusNode,
      this.onChanged,
      this.readOnly = false,
      this.controller,
      this.keyboardType,
      this.labelText,
      this.helperText,
      this.key,
      this.onTab,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.obscureText = false,
      this.obscuringCharacter = "●",
      this.errorText,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      width: MediaQuery.of(context).size.width - 40,
      child: TextField(
        onTap: onTab,
        controller: controller,
        focusNode: readOnly ? AlwaysDisabledFocusNode() : focusNode,
        onChanged: onChanged,
        enableSuggestions: enableSuggestions,
        autocorrect: autocorrect,
        obscureText: obscureText,
        onSubmitted: onSubmitted,
        obscuringCharacter: obscuringCharacter,
        decoration: InputDecoration(
            labelText: labelText,
            helperText: helperText,
            errorText: errorText,
            border: OutlineInputBorder()),
      ),
    );
  }
}
