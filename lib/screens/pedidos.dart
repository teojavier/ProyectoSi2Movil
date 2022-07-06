import 'package:appmovil/services/pedidos_service.dart';
import 'package:appmovil/widgets/PedidoCard.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PedidosLista extends StatelessWidget {

  @override
    Widget build(BuildContext context) {
    final pedidoService = Provider.of<PedidosService>(context);
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Pedidos'),
      ),

      body: ListView.builder(
        itemCount: pedidoService.pedidos.length,
        itemBuilder: (BuildContext context, int index) => PedidoCard(
          pedido: pedidoService.pedidos[index],
        ),
      ),
    );
  }

}