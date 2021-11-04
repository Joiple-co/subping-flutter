import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class SubpingLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: SubpingColor.white100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
