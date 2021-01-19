import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/design_system/textfield/widthfit_textfield.dart';
import 'package:subping/ui/onboarding/pass_auth/pass_auth_viewmodel.dart';

class PassAuth extends StatelessWidget {
  final viewModelInstance = PassAuthViewModel();
  final confirmPasswordInput = WidthFitTextField();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModelInstance,
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<PassAuthViewModel>(context);

          return Scaffold(
              resizeToAvoidBottomInset: false,
              resizeToAvoidBottomPadding: false,
              body: HeaderSafe(
                child: HorizontalPadding(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Text.rich(
                        TextSpan(text: "회원가입을 위해\n", children: [
                          TextSpan(
                              text: "본인인증",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 224, 197, 1))),
                          TextSpan(text: "이 필요해요!")
                        ]),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.nsp,
                            height: 1.3),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SqaureButton(
                          text: "다음",
                          onPressed: () => viewModel.onPressComplete(context),
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
