import 'package:appmovil/Models/Atencion.dart';
import 'package:appmovil/Models/Pedidos.dart';
import 'package:appmovil/screens/Pedidos_productos.dart';
import 'package:appmovil/screens/screens.dart';
import 'package:appmovil/services/pedidos_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PedidoCard extends StatelessWidget {
  final Pedidos pedido;
  const PedidoCard({Key? key, required this.pedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), //es en general en el view
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20), //es solo para el card
        width: double.infinity,
        height: 350,
        decoration: _carBorders(),
        child: Stack(
          children: [
            _PedidoDetail(
              pedido.id,
              pedido.direccion,
              pedido.estado,
              pedido.estadoPago,
              pedido.fechaPedido.toString(),
              pedido.total,
              pedido.clienteId,
              pedido.tipoEnvioId,
              pedido.tipoPagoId,
              pedido.promocionId,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _carBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 5), blurRadius: 10)
          ]);
}

class _PedidoDetail extends StatelessWidget {
  final int? id;
  final String? direccion;
  final String? estado;
  final String? estado_pago;
  final String? fecha_pedido;
  final String? total;
  final int? cliente_id;
  final int? tipoEnvio_id;
  final int? tipoPago_id;
  final int? promocion_id;
  const _PedidoDetail(
      this.id,
      this.direccion,
      this.estado,
      this.estado_pago,
      this.fecha_pedido,
      this.total,
      this.cliente_id,
      this.tipoEnvio_id,
      this.tipoPago_id,
      this.promocion_id);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 300,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Id:  ' + id.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Cliente:  ' + cliente_id.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Direccion:  ' + direccion!,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Fecha del Pedido:  ' + fecha_pedido.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Total:  ' + total! + ' BS',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Entrega:  ' + tipoEnvio_id.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Pago:  ' + tipoPago_id.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.red,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Productos',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductos(idpedido: id!)),
                );
              },
            ),
            SizedBox(height: 10),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.red,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    'Detalle',
                    style: TextStyle(color: Colors.white),
                  )),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}
