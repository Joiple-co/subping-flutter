import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/design_system/textfield/widthfit_textfield.dart';
import 'package:subping/ui/onboarding/user_address/user_address_viewmodel.dart';

class UserAddress extends StatelessWidget {
  final viewModelInstance = UserAddressViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModelInstance,
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<UserAddressViewModel>(context);

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
                        TextSpan(text: "쉬운 섭핑 이용을 위해\n", children: [
                          TextSpan(
                              text: "주소",
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 224, 197, 1))),
                          TextSpan(text: "를 입력해 주세요.")
                        ]),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            height: 1.3),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Expanded(
                          child: Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            Center(
                              child: Row(
                                children: [
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                                40) *
                                            0.5 -
                                        10,
                                    child: FocusScope(
                                      node: FocusScopeNode(),
                                      child: WidthFitTextField(
                                        readOnly: true,
                                        labelText: "우편번호",
                                        controller:
                                            viewModel.postCodeController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SqaureButton(
                                    text: "우편번호 찾기",
                                    onPressed: () =>
                                        viewModel.onPressFindPostCode(context),
                                    width: (MediaQuery.of(context).size.width -
                                            40) *
                                        0.5,
                                    height: 60,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 80 * 0.2),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                child: WidthFitTextField(
                                  readOnly: true,
                                  labelText: "주소",
                                  controller: viewModel.addressController,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            SizedBox(height: 80 * 0.2),
                            Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width - 40,
                                child: WidthFitTextField(
                                  labelText: "상세주소",
                                  focusNode: viewModel.detailedAddressFocusNode,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SqaureButton(
                          text: "다음",
                          onPressed: () {},
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
