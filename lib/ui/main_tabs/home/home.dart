import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/main_tabs/home/header.dart';
import 'package:subping/ui/main_tabs/home/home_viewmodel.dart';
import 'package:subping/ui/main_tabs/home/real_time_chart.dart';
import 'package:subping/ui/main_tabs/home/recommand_services.dart';
import 'package:subping/ui/main_tabs/home/subscribe_reminder.dart';

class Home extends StatelessWidget {
  final viewModelInstance = HomeViewModel();

  Home() {
    viewModelInstance.fetchCurrentHotList();
    viewModelInstance.fetchUserRecommendServices();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModelInstance,
      child: Builder(
        builder: (BuildContext context) {
          final viewModel = Provider.of<HomeViewModel>(context);

          return Scaffold(
            body: HeaderSafe(
              hasBottomSafe: false,
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
                    Header(),
                    SizedBox(height: 16.h),
                    RealTimeChart(
                      currentHotServices: viewModel.currentHotServices,
                    ),
                    SizedBox(height: 16.h),
                    RecommendServices(
                      userRecommendServices: viewModel.userRecommendServices,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
