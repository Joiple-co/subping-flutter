import 'package:flutter/material.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:subping/modules/design_system/setting_table.dart';

class KeyboardDoneContainer extends StatelessWidget {
  final FocusNode focusItems;
  final Widget child;

  KeyboardDoneContainer({this.focusItems, this.child});

  @override
  Widget build(BuildContext context) {
    return KeyboardActions(
      config: KeyboardActionsConfig(
        actions: [KeyboardActionsItem(focusNode: focusItems)],
        keyboardBarColor: SubpingColor.black30,
      ),
      child: child,
    );
  }
}
