import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';

class PostCode extends StatelessWidget {
  Function callback;

  PostCode({this.callback});

  @override
  Widget build(BuildContext context) {
    return Kopo(
      callback: callback,
    );
  }
}
