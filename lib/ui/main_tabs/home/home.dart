import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/recommand.dart';
import 'tool_bar.dart';
import './expected.dart';
import './recommand.dart';
import './chart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Chart(limitItem: 3),
              Space(size: SubpingSize.large80),
            ],
          ),
        ),
      ),
    );
  }
}
