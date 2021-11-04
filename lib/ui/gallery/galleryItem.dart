import 'dart:io';

import 'package:flutter/material.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class GalleryItem extends StatelessWidget {
  Function onTogglePick;
  GalleryModel source;
  int selectedIndex;

  GalleryItem({this.source, this.onTogglePick, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    var isPicked = selectedIndex != -1;

    return GestureDetector(
      onTap: () {
        onTogglePick(source, isPicked);
      },
      child: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.memory(
            source.imagesource,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
            child: Container(
          color: isPicked
              ? Color.fromRGBO(0, 0, 0, 0.5)
              : Color.fromRGBO(0, 0, 0, 0),
        )),
        Positioned(
          right: 7,
          top: 7,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color:
                  isPicked ? SubpingColor.subping50 : SubpingColor.blackAlpha,
            ),
            alignment: Alignment.center,
            width: 28,
            height: 28,
            child: SubpingText(
              isPicked ? "${selectedIndex + 1}" : "",
              size: 18,
              color: SubpingColor.white100,
              fontWeight: SubpingFontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }
}
