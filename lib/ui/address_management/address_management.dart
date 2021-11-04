import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/viewmodel/global/user_viewmodel.dart';

class AddressManagement extends StatelessWidget {
  const AddressManagement({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userViewModel = Get.find<UserViewModel>();
    userViewModel.updateUserAddresses();
    final addresses = userViewModel.userAddreses;

    return Obx(
      () => Scaffold(
        appBar: TitleAppBar("등록 주소 관리", hasBackButton: true),
        backgroundColor: SubpingColor.white100,
        body: RefreshIndicator(
          backgroundColor: SubpingColor.white100,
          onRefresh: () async {
            await userViewModel.updateUserAddresses();
          },
          child: ListView(children: [
            ...List.generate(addresses.length, (index) {
              final addressId = addresses.keys.elementAt(index);

              return HorizontalPadding(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          color: SubpingColor.white100,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    SubpingText(
                                      addresses[addressId].userName,
                                      size: SubpingFontSize.title6,
                                    ),
                                    Space(
                                      size: SubpingSize.tiny5,
                                    ),
                                    addresses[addressId].isDefault
                                        ? Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5, vertical: 2),
                                            decoration: BoxDecoration(
                                                color: SubpingColor.subping30,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: SubpingText("기본배송지",
                                                color: SubpingColor.white100,
                                                size: SubpingFontSize.tiny1),
                                          )
                                        : Container()
                                  ]),
                                  Space(
                                    size: SubpingSize.tiny5,
                                  ),
                                  SubpingText(
                                      addresses[addressId].userPhoneNumber,
                                      color: SubpingColor.black60,
                                      size: SubpingFontSize.body2),
                                  SubpingText(
                                    addresses[addressId].address +
                                        " " +
                                        addresses[addressId].detailedAddress,
                                    size: SubpingFontSize.body2,
                                  ),
                                  Space(
                                    size: SubpingSize.medium10,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                        "/editAddress/${addresses[addressId].id}",
                                        preventDuplicates: false),
                                    child: Container(
                                        child: Align(
                                      alignment: Alignment.topLeft,
                                      child: SubpingText("수정하기",
                                          color: SubpingColor.subping100),
                                    )),
                                  ),
                                  Space(size: SubpingSize.medium10),
                                  !addresses[addressId].isDefault
                                      ? GestureDetector(
                                          onTap: () => Get.toNamed(
                                              "/editAddress/${addresses[addressId].id}",
                                              preventDuplicates: false),
                                          child: Container(
                                              child: Align(
                                            alignment: Alignment.topLeft,
                                            child: SubpingText("삭제하기",
                                                color: SubpingColor.black60),
                                          )),
                                        )
                                      : Container()
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider()
                    ]),
              );
            }),
            Space(
              size: SubpingSize.medium10,
            ),
            HorizontalPadding(
              child: SquareButton(
                  text: "+ 주소 추가하기",
                  onPressed: () =>
                      Get.toNamed("/addAddress", preventDuplicates: false),
                  type: "outline"),
            )
          ]),
        ),
      ),
    );
  }
}
