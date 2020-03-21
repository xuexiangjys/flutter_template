import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      withLocalStorage: true,
      withJavascript: true,
      hidden: true,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(fontSize: 15)),
        titleSpacing: 0,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(widget.url);
              }),
        ],
      ),
    );
  }
}
