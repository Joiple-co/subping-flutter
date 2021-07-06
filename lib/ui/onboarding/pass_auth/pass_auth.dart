import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_padding.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/onboarding/pass_auth/pass_auth_viewmodel.dart';

class PassAuth extends StatelessWidget {
  const PassAuth() : super();

  @override
  Widget build(BuildContext context) {
    Get.put(PassAuthViewModel());

    return GetX<PassAuthViewModel>(
      builder: (viewModel) => Scaffold(
        body: HeaderSafe(
          child: HorizontalPadding(
            child: HeaderPadding(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(SubpingTextSpan(children: [
                  SubpingTextSpan(
                      text: viewModel.currentTitle['preTitle'],
                      fontSize: SubpingFontSize.title4,
                      fontWeight: SubpingFontWeight.bold),
                  SubpingTextSpan(
                      text: viewModel.currentTitle['accent'],
                      fontSize: SubpingFontSize.title4,
                      fontWeight: SubpingFontWeight.bold,
                      color: SubpingColor.subping100),
                  SubpingTextSpan(
                      text: viewModel.currentTitle['postTitle'],
                      fontSize: SubpingFontSize.title4,
                      fontWeight: SubpingFontWeight.bold),
                ])),
                Expanded(child: Container()),
                SqaureButton(
                  text: "확인", 
                  onPressed: viewModel.onPressNext,
                  loading: viewModel.loading.value),
                Space(size: SubpingSize.large40)
              ],
            )),
          ),
        ),
      ),
    );
  }
}
