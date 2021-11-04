import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/local/splash/splash_viewmodel.dart';

class Splash extends StatelessWidget {
  final viewModel = new SplashViewModel();

  @override
  Widget build(BuildContext context) {
    new Future.delayed(
        const Duration(seconds: 1), () => viewModel.goNextScene());

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
            child: Image(
          image: AssetImage("assets/logoWithName.png"),
          width: 80,
        )));
  }
}
