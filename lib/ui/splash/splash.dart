import 'package:flutter/material.dart';
import 'package:subping/viewmodel/local/splash/splash_viewmodel.dart';

class Splash extends StatelessWidget {
  final viewModel = SplashViewModel();

  Splash({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () => viewModel.goNextScene());

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(
            child: Image(
          image: AssetImage("assets/logoWithName.png"),
          width: 80,
        )));
  }
}
