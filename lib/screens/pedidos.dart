import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Pedidos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Lista de Pedidos'),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}