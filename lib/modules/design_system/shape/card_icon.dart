import 'package:flutter/material.dart';
import 'package:subping/const/const.dart';

class CardIcon extends StatelessWidget {
  final CardVendor vendor;
  final double size;

  const CardIcon({Key key, this.vendor, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetLink = cardVendorAsset[vendor];

    return ClipOval(
      child: Image.asset(
        assetLink,
        width: size,
        height: size,
      ),
    );
  }
}
