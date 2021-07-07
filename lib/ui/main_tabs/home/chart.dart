import 'package:flutter/material.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/ui/design_system/subping_ui.dart';
import 'package:subping/ui/main_tabs/home/char_item.dart';
import 'package:subping/ui/main_tabs/home/more_chart.dart';

class Chart extends StatelessWidget {
  final int limitItem;

  Chart({this.limitItem});

  @override
  Widget build(BuildContext context) {
    ServiceModel dummy = new ServiceModel(
        serviceName: "넷플릭스",
        serviceSummary: '지금바로 시청하세요',
        serviceSquareLogoUrl:
            'http://t1.daumcdn.net/brunch/service/user/owx/image/MNLdnERLFoNSc6LD8yTvfRAsdFI.jpg',
        serviceTags: ["미디어", "음악"]);

    List<ServiceModel> test = [dummy, dummy, dummy, dummy];

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubpingText(
            "인기차트",
            size: SubpingFontSize.title6,
            fontWeight: SubpingFontWeight.medium,
            textAlign: TextAlign.start,
          ),
          Container(
            child: Column(
                children: List.generate(limitItem, (index) {
              return ChartItem(
                  rank: index + 1,
                  serviceName: test[index].serviceName,
                  serviceSummary: test[index].serviceSummary,
                  serviceSquareLogoUrl: test[index].serviceSquareLogoUrl,
                  serviceTags: test[index].serviceTags);
            })),
          ),
          Space(size: SubpingSize.large80),
          Center(child: MoreChart())
        ],
      ),
    );
  }
}
