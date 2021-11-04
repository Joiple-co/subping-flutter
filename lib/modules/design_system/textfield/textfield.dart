import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class SubpingTextField extends StatelessWidget {
  final FocusNode focusNode;
  final Function onChanged;
  final bool readOnly;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String helperText;
  final Function onTab;
  final bool enableSuggestions;
  final bool autocorrect;
  final bool obscureText;
  final String obscuringCharacter;
  final String errorText;
  final Function onSubmitted;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final String hintText;
  final int maxLength;

  const SubpingTextField(
      {this.focusNode,
      this.onChanged,
      this.readOnly = false,
      this.controller,
      this.keyboardType,
      this.labelText,
      this.helperText,
      this.onTab,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.obscureText = false,
      this.obscuringCharacter = "●",
      this.errorText,
      this.onSubmitted,
      this.inputFormatters,
      this.maxLines,
      this.maxLength,
      this.hintText,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: readOnly ? SubpingColor.back20 : null,
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
        enableInteractiveSelection: readOnly ? false : true,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        maxLength: maxLength,
        style: const TextStyle(
          fontSize: 15,
        ),
        decoration: InputDecoration(
            labelText: labelText,
            helperText: helperText,
            errorText: errorText,
            hintText: hintText,
            isDense: true,
            border: const OutlineInputBorder()),
      ),
    );
  }
}
