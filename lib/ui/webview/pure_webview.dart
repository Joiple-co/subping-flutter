import "package:flutter/material.dart";
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PureWebView extends StatefulWidget {
  @override
  _PureWebViewState createState() => _PureWebViewState();
}

class _PureWebViewState extends State<PureWebView> {
  WebViewController _webViewController;

  void _goBack() {
    _webViewController.goBack();
  }

  void _goFront() {
    _webViewController.goForward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Expanded(
          child: WebView(
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;
            },
            initialUrl: "https://watcha.com/start",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
        Container(
            color: Colors.white,
            height: 83.h,
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: TextButton(
                    child: Text("뒤로"),
                    onPressed: _goBack,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: TextButton(
                    child: Text("앞으로"),
                    onPressed: _goFront,
                  ),
                )
              ],
            ))
      ]),
    );
  }
}
