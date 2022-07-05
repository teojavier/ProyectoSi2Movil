import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Webvieww extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Webview'),
      ),
    );
  }
}