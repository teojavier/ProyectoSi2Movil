import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webvieww extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Webview'),
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}