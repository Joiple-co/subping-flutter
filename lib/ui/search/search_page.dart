import 'package:flutter/material.dart';
import 'package:subping/modules/design_system/page/header_safe.dart';
import 'package:subping/modules/design_system/subping_ui.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/ui/search/search_bar.dart';

import 'package:subping/ui/search_results/search_results_page.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar : SearchBar(),
        body: Container(
            color: SubpingColor.white100,
            child: Center(
              child: RaisedButton(
                child: Text('Page로 이동'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchResults()),
                  );
                },
              ),
            )));
  }
}
