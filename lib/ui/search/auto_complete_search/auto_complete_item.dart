import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subping/model/search_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class AutoCompleteItem extends StatelessWidget {
  final ServiceResult serviceResult;

  const AutoCompleteItem({Key key, this.serviceResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed("/serviceDetail/${serviceResult.id}"),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(serviceResult.serviceLogoUrl)),
              ),
            ),
          ),
          Space(
            size: SubpingSize.medium14,
          ),
          Text.rich(SubpingTextSpan(children: [
            SubpingTextSpan(
                fontSize: SubpingFontSize.title5,
                 fontWeight: FontWeight.bold,
                text: serviceResult.name
                    .substring(0, serviceResult.search.matchedIndex)),
            SubpingTextSpan(
                color: SubpingColor.subping100,
                fontSize: SubpingFontSize.title5,
              fontWeight: FontWeight.bold,
                text: serviceResult.name.substring(
                    serviceResult.search.matchedIndex,
                    serviceResult.search.matchedIndex +
                        serviceResult.search.length)),
            SubpingTextSpan(
                fontSize: SubpingFontSize.title5,
                 fontWeight: FontWeight.bold,
                text: serviceResult.name.substring(
                    serviceResult.search.matchedIndex +
                        serviceResult.search.length)),
          ]))
        ],
      ),
    );
  }
}