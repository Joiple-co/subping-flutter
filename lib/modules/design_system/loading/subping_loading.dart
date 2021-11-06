import 'package:flutter/material.dart';

class SubpingLoading extends StatelessWidget {
  const SubpingLoading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
