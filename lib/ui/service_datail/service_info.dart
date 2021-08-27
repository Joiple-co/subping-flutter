import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:subping/modules/design_system/webview/expandable_webview.dart';

class ServiceInfo extends StatelessWidget {
  ServiceInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space(size: SubpingSize.large20,),
          HorizontalPadding(
              child: SubpingText(
            "제품 상세",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.bold,
          )), 
          Space(size: SubpingSize.large20,),
          ExpandableWebView("https://www.google.com/search?q=flutter+pie+chart&rlz=1C5CHFA_enKR959KR959&sxsrf=ALeKk00mBvikXU5_4wkLbSZNXwtTo-qeRQ%3A1629708993254&ei=wWIjYeCAD43l0ATwnozoCg&oq=flutter+pie+chart&gs_lcp=Cgdnd3Mtd2l6EAMyBQgAEIAEMgUIABCABDIFCAAQgAQyBQgAEMsBMgUIABDLATIGCAAQBRAeMgYIABAFEB4yBggAEAgQHjIGCAAQCBAeMgYIABAIEB46BwgjELADECc6BwgAEEcQsAM6CggAEEcQsAMQiwM6BAgjECc6BAgAEEM6CAgAEIAEELEDOgoIABCxAxCDARBDOgsIABCABBCxAxCDAToKCAAQgAQQhwIQFDoHCAAQgAQQCjoGCAAQChAeOgQIABAeSgUIPBIBNUoECEEYAVD0CVjrKWDhKmgFcAB4AIABhQGIAa8NkgEEMC4xNJgBAKABAcgBCrgBAsABAQ&sclient=gws-wiz&ved=0ahUKEwig5YSN48byAhWNMpQKHXAPA60Q4dUDCA4&uact=5",)
        ],
      ),
    );
  }
}
