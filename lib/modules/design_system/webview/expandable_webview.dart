import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:subping/modules/design_system/loading/subping_loading,.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ExpandableWebView extends StatefulWidget {
  final String url;
  final EdgeInsets padding;

  ExpandableWebView(
    this.url, {
    Key key,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  _ExpandableWebViewState createState() => _ExpandableWebViewState();
}

class _ExpandableWebViewState extends State<ExpandableWebView> {
  double contentHeight = 100;
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.padding,
        width: double.infinity,
        height: contentHeight,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [_buildWebView(context), if (!loaded) SubpingLoading()],
        ));
  }

  Widget _buildWebView(BuildContext context) {
    return InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            supportZoom: false,
            javaScriptEnabled: true,
            disableHorizontalScroll: true,
            disableVerticalScroll: true,
            disableContextMenu: true
          ),
        ),
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
        onLoadStop: (InAppWebViewController controller, Uri url) async {
          controller.injectCSSCode(source: 
          """
            html {
              -ms-user-select: none; 
              -moz-user-select: -moz-none;
              -khtml-user-select: none;
              -webkit-user-select: none;
              user-select: none;
            }
          """); 
          
          print("load stop");
          final height = (await controller.getContentHeight()).toDouble();

          setState(() {
            contentHeight = height;
            loaded = true;
          });
        });
  }
}
