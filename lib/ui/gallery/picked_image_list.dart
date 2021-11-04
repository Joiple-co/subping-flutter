import 'package:flutter/material.dart';
import 'package:subping/model/gallery_model.dart';
import 'package:subping/modules/design_system/setting_table.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class PickedImageList extends StatefulWidget {
  final List<GalleryModel> imagePickedList;
  final Function onTouchItem;

  const PickedImageList({Key key, this.imagePickedList, this.onTouchItem})
      : super(key: key);

  @override
  _PickedImageListState createState() => _PickedImageListState();
}

class _PickedImageListState extends State<PickedImageList> {
  double _height = 0;

  void _updateState() {
    setState(() {
      _height = 90;
    });
  }

  void _downContainer() {
    setState(() {
      _height = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imagePickedList.length != 0) {
      _updateState();
    } else {
      _downContainer();
    }
    return AnimatedContainer(
      curve: Curves.easeInOutQuart,
      duration: Duration(milliseconds: 230),
      clipBehavior: Clip.none,
      height: _height,
      child: ListView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        children: [
          ...List.generate(widget.imagePickedList.length, (index) {
            return Row(
              children: [
                Space(
                  size: SubpingSize.medium10,
                ),
                Stack(clipBehavior: Clip.none, children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.memory(
                      widget.imagePickedList[index].imagesource,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: -5,
                      right: -5,
                      child: GestureDetector(
                        onTap: () {
                          widget.onTouchItem(
                              widget.imagePickedList[index], true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: SubpingColor.warning100),
                          child: ClipOval(
                              child: Icon(
                            Icons.remove_sharp,
                            size: 20,
                            color: SubpingColor.white100,
                          )),
                        ),
                      )),
                ]),
              ],
            );
          })
        ],
      ),
    );
  }
}
