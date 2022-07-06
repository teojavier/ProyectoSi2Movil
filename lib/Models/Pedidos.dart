import 'package:meta/meta.dart';
import 'dart:convert';

List<Pedidos> pedidosFromMap(String str) => List<Pedidos>.from(json.decode(str).map((x) => Pedidos.fromMap(x)));
String pedidosToMap(List<Pedidos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Pedidos {
    Pedidos({
        required this.id,
        required this.direccion,
        required this.estado,
        required this.estadoPago,
        required this.fechaEntrega,
        required this.fechaPedido,
        required this.total,
        required this.clienteId,
        required this.tipoEnvioId,
        required this.tipoPagoId,
        required this.promocionId,
    });

    int id;
    String direccion;
    String estado;
    String estadoPago;
    dynamic fechaEntrega;
    DateTime? fechaPedido;
    String total;
    int clienteId;
    int tipoEnvioId;
    int tipoPagoId;
    dynamic promocionId;

    factory Pedidos.fromMap(Map<String, dynamic> json) => Pedidos(
        id: json["id"],
        direccion: json["direccion"],
        estado: json["estado"],
        estadoPago: json["estado_pago"],
        fechaEntrega: json["fecha_entrega"],
        fechaPedido: DateTime.parse(json["fecha_pedido"]),
        total: json["total"] ,
        clienteId: json["cliente_id"],
        tipoEnvioId: json["tipoEnvio_id"],
        tipoPagoId: json["tipoPago_id"],
        promocionId: json["promocion_id"],

    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "direccion": direccion,
        "estado": estado,
        "estado_pago": estadoPago,
        "fecha_entrega": fechaEntrega,
        "fecha_pedido": "${fechaPedido!.year.toString().padLeft(4, '0')}-${fechaPedido!.month.toString().padLeft(2, '0')}-${fechaPedido!.day.toString().padLeft(2, '0')}",
        "total": total,
        "cliente_id": clienteId,
        "tipoEnvio_id": tipoEnvioId,
        "tipoPago_id": tipoPagoId,
        "promocion_id": promocionId,

    };
}
