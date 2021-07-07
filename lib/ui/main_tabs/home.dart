import 'package:flutter/material.dart';
import 'package:subping/ui/design_system/page/header_safe.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/homeWidget/recommand.dart';
import 'homeWidget/tool_bar.dart';
import 'homeWidget/expected.dart';
import 'homeWidget/recommand.dart';
import 'homeWidget/chart.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HeaderSafe(
        child: HorizontalPadding(
          child: ListView(
            children: [
              ToolBar(),
              Space(size: SubpingSize.tiny10),
              Expected(),
              Space(size: SubpingSize.large80),
              Recommand(),
              Space(size: SubpingSize.large80),
              Chart(limitItem: 3)
            ],
          ),
        ),
      ),
    );
  }
}
