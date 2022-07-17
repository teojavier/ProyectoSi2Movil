import 'dart:convert';

import 'package:appmovil/Models/Detalle_pedido.dart';
import 'package:appmovil/screens/screens.dart';
import 'package:appmovil/services/detalle_pedido_services.dart';
import 'package:appmovil/services/eliminar_detalle_service.dart';
import 'package:appmovil/src/search_productos_delegate.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Pedido_detalle extends StatelessWidget {
  final int idpedido;
  const Pedido_detalle({Key? key, required this.idpedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final detalleService = Provider.of<DetalleService>(context);
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Detalles del Pedido  ' + idpedido.toString()),
        ),
        body: Container(
          child: _myList(detalles: detalleService.detalle_pedido),
        ));
  }
}

class _myList extends StatelessWidget {
  final List<DetallePedido> detalles;

  const _myList({Key? key, required this.detalles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: detalles.length,
      itemBuilder: (_, index) => Dismissible(
        key: Key(index.toString()),
        direction: DismissDirection.startToEnd,
        background: Container(
          color: Color.fromARGB(255, 218, 15, 0),
          padding: EdgeInsets.only(left: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              )),
        ),
        onDismissed: (direction) async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString('id_detalle', detalles[index].id.toString());
          String? id_detalle = pref.getString('id_detalle');
          print(direction);
          print(id_detalle);
          eliminarDetalles();
          return showDialog(
            context: context,
            builder: (_) => _DialogoAlerta(
              mensaje: "Detalle Eliminado",
            ),
          );
        },
        child: ListTile(
          title: Text('_______________________________________'+'\n'+
          'Producto: '+
                detalles[index].nombreProducto + '\n' +
                'Precio: ' +
                detalles[index].precioProducto +
                '   Cantidad: ' +
                detalles[index].cantidad.toString() + '\n' +
                'Total: ' +
                detalles[index].precio+ '\n' +
                '_______________________________________',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        
      ),
    );
  }

  Future<void> eliminarDetalles() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? id_detalle = pref.getString('id_detalle');
    final response = await http.get(Uri.parse(
        'https://proyectosi2360.herokuapp.com/api/deleteDetalle/' +
            id_detalle!));
  }
}

class _DialogoAlerta extends StatelessWidget {
  final String mensaje;

  const _DialogoAlerta({required this.mensaje});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Informacion'),
      content: Text(this.mensaje),
    );
  }
}
