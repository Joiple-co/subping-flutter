import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/repository/service_repository.dart';
import 'package:subping/ui/design_system/appbar/title_appbar.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/recent_review.dart';
import 'package:subping/ui/main_tabs/home/recommand.dart';
import 'home_view_model.dart';
import 'tool_bar.dart';
import './expected.dart';
import './recommand.dart';
import './chart.dart';

class Home extends StatelessWidget {
  const Home() : super();
  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(HomeViewModel());

    return Scaffold(
      appBar: TitleAppBar("홈", hasBackButton: false, hasToolBar: true),
      body: HeaderSafe(
          hasBottomSafe: false,
          child: GetX<HomeViewModel>(
              builder: (viewModel) => ListView(
                    children: [
                      Space(size: SubpingSize.large40),
                      Expected(),
                      Space(size: SubpingSize.large80),
                      Recommand(),
                      Space(size: SubpingSize.large80),
                      Chart(
                          limitItem:
                              viewModel.charts.value.serviceRank.length >= 3
                                  ? 3
                                  : viewModel.charts.value.serviceRank.length,
                          hotChartData: viewModel.charts.value),
                      Space(size: SubpingSize.large80),
                      RecentReview(),
                      Space(size: SubpingSize.large80),
                    ],
                  ))),
    );
  }
}
