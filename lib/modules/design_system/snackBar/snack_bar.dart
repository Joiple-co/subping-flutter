import 'package:flutter/material.dart';

class SubpingSnackBar {
  static void showSnackBar(context, Widget child) {
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 500),
        content: SizedBox(
          height: 30,
          width: double.infinity,
          child: child,
        )));
  }
}
