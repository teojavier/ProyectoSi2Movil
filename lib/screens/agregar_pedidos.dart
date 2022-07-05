import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AgregarPedidos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Agregar Nuevo Pedido'),
      ),
      body: ListView(
        children: [
          
        ],
      ),
    );
  }
}