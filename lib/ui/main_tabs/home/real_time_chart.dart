import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/model/service_model.dart';
import 'package:subping/ui/design_system/page/horizontal_padding.dart';

class RealTimeChart extends StatelessWidget {
  List<ServiceModel> currentHotServices;

  RealTimeChart({this.currentHotServices});

  List<Widget> generateChartColumn() {
    List<Widget> result = [];
    List<Widget> tempColumn = [];

    for (var index = 0; index < this.currentHotServices.length; index++) {
      tempColumn.add(
        Container(
          width: 300.w,
          height: 80.h,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.h),
                child: Container(
                  width: 80.h,
                  height: 80.h,
                  child: Image.network(
                      this.currentHotServices[index].serviceSqaureLogoUrl),
                ),
              ),
              SizedBox(width: 10.w),
              Container(
                width: 190.w,
                height: 70.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "${index + 1} ${this.currentHotServices[index].serviceName}",
                        style: TextStyle(
                            fontSize: 15.nsp, fontWeight: FontWeight.bold)),
                    Text(this.currentHotServices[index].servicSummary,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13.nsp)),
                    Row(
                        children: this.generateServiceTags(
                            this.currentHotServices[index].serviceTags))
                  ],
                ),
              )
            ],
          ),
        ),
      );

      tempColumn.add(SizedBox(height: 10.h));

      if (tempColumn.length == 6) {
        result.add(Column(children: tempColumn));
        result.add(SizedBox(width: 20.w));

        tempColumn = [];
      }

      if (result.length == 6) {
        return result;
      }
    }

    if (tempColumn.length != 0) {
      result.add(Column(children: tempColumn));
    }

    return result;
  }

  List<Widget> generateServiceTags(List tags) {
    List<Widget> result = [];

    for (var index = 0; index < tags.length; index++) {
      result.add(Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.h),
            border: Border.all(
                width: 1.w, color: Color.fromRGBO(191, 191, 191, 1))),
        padding: EdgeInsets.all(5.nsp),
        child: Text(
          "#${tags[index]}",
          style: TextStyle(
              fontSize: 10.nsp, color: Color.fromRGBO(191, 191, 191, 1)),
        ),
      ));

      result.add(SizedBox(width: 5.w));

      if (result.length == 3) {
        return result;
      }
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HorizontalPadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(text: "섭핑", children: [
                  TextSpan(
                      text: " 실시간 차트", style: TextStyle(color: Colors.black))
                ]),
                style: TextStyle(
                    color: Color.fromRGBO(0, 224, 197, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.nsp,
                    height: 1.3.h),
              ),
              Text("더보기", style: TextStyle(fontSize: 12.nsp))
            ],
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Row(children: this.generateChartColumn()))
      ],
    ));
  }
}
