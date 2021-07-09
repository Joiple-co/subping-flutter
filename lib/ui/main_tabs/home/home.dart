import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/repository/service_repository.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
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

    return GetX<HomeViewModel>(
      builder: (viewModel) => Scaffold(
        body: HeaderSafe(
          hasBottomSafe: false,
          child: HorizontalPadding(
            child: ListView(
              children: [
                Space(size: SubpingSize.large30),
                ToolBar(),
                Space(size: SubpingSize.medium20),
                Expected(),
                Space(size: SubpingSize.large80),
                Recommand(),
                Space(size: SubpingSize.large80),
                Chart(limitItem: 3, hotChartData: viewModel.charts.value),
                Space(size: SubpingSize.large80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
