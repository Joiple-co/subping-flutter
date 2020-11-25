import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:subping/enum/enum.dart';
import 'package:subping/ui/design_system/button/sqaure_button.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';
import 'package:subping/ui/onboarding/user_detailed_information/user_detailed_information_viewmodel.dart';

class UserDetailedInformation extends StatefulWidget {
  @override
  _UserDetailedInformationState createState() =>
      _UserDetailedInformationState();
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class _UserDetailedInformationState extends State<UserDetailedInformation>
    with TickerProviderStateMixin {
  Animation<Offset> emailMoveAnimation;
  AnimationController emailMoveAnimationController;
  Animation<double> addressFadeAnimation;
  AnimationController addressFadeAnimationController;

  TextEditingController postCodeController;
  TextEditingController addressController;
  FocusNode detailedAddressNode;

  @override
  void initState() {
    super.initState();

    emailMoveAnimationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    emailMoveAnimation =
        Tween(begin: Offset.zero, end: Offset(0, 3.8)).animate(CurvedAnimation(
      parent: emailMoveAnimationController,
      curve: Curves.fastOutSlowIn,
    ));

    addressFadeAnimationController = AnimationController(
        duration: Duration(seconds: 1),
        vsync: this,
        value: 0,
        lowerBound: 0,
        upperBound: 1);
    addressFadeAnimation = CurvedAnimation(
        parent: addressFadeAnimationController, curve: Curves.fastOutSlowIn);

    postCodeController = TextEditingController();
    addressController = TextEditingController();
    detailedAddressNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    emailMoveAnimationController.dispose();
    addressFadeAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: UserDetailedInformationViewModel(),
      child: Builder(builder: (BuildContext context) {
        final viewModel =
            Provider.of<UserDetailedInformationViewModel>(context);
        postCodeController.text = viewModel.postCode;
        addressController.text = viewModel.address;

        return HeaderSafe(
          child: Scaffold(
            // resizeToAvoidBottomInset: false,
            body: Builder(
              builder: (context) => HorizontalPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Text.rich(
                      TextSpan(text: "섭핑 이용을 위해\n", children: [
                        TextSpan(
                            text: viewModel.stepWords[viewModel.step],
                            style: TextStyle(
                                color: Color.fromRGBO(0, 224, 197, 1))),
                        TextSpan(text: "를 입력해 주세요.")
                      ]),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          height: 1.3),
                    ),
                    SizedBox(height: 30),
                    Expanded(
                        child: ListView(children: [
                      Stack(
                        children: [
                          viewModel.step == OnboardingStep.ONBOARDING_ADDRESS
                              ? FadeTransition(
                                  opacity: addressFadeAnimation,
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          40) *
                                                      0.5 -
                                                  10,
                                              child: FocusScope(
                                                node: FocusScopeNode(),
                                                child: TextField(
                                                  controller:
                                                      postCodeController,
                                                  focusNode:
                                                      AlwaysDisabledFocusNode(),
                                                  onChanged:
                                                      viewModel.onChangeEmail,
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  decoration: InputDecoration(
                                                      labelText: "우편번호",
                                                      border:
                                                          OutlineInputBorder()),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            SqaureButton(
                                              text: "우편번호 찾기",
                                              onPressed: () => viewModel
                                                  .onPressFindPostCode(context),
                                              width: (MediaQuery.of(context)
                                                              .size
                                                              .width -
                                                          40) *
                                                      0.5 -
                                                  10,
                                              height: 60,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 80 * 0.2),
                                      Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          child: TextField(
                                            controller: addressController,
                                            focusNode:
                                                AlwaysDisabledFocusNode(),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                                labelText: "주소",
                                                border: OutlineInputBorder()),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 80 * 0.2),
                                      Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              40,
                                          child: TextField(
                                            focusNode: detailedAddressNode,
                                            onChanged: viewModel
                                                .onChangeDetailedAddress,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            decoration: InputDecoration(
                                              labelText: "상세주소",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                          SlideTransition(
                            position: emailMoveAnimation,
                            child: Container(
                              width: MediaQuery.of(context).size.width - 40,
                              child: TextField(
                                autofocus: true,
                                onChanged: viewModel.onChangeEmail,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: "이메일",
                                    border: OutlineInputBorder(),
                                    errorText: viewModel.emailErrorMessage),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])),
                    SizedBox(height: 30),
                    SqaureButton(
                      text: "다음",
                      onPressed:
                          viewModel.step == OnboardingStep.ONBOARDING_EMAIL
                              ? () => viewModel.onPressEndEmail(
                                  emailMoveAnimationController,
                                  addressFadeAnimationController)
                              : viewModel.onPressEndAddress,
                      disabled: viewModel.buttonDisabled(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
