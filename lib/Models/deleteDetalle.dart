// To parse this JSON data, do
//
//     final deleteDetalle = deleteDetalleFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

DeleteDetalle deleteDetalleFromMap(String str) => DeleteDetalle.fromMap(json.decode(str));

String deleteDetalleToMap(DeleteDetalle data) => json.encode(data.toMap());

class DeleteDetalle {
    DeleteDetalle({
        required this.id,
        required this.precio,
        required this.cantidad,
        required this.productoId,
        required this.pedidoId,
    });

    int id;
    int precio;
    int cantidad;
    int productoId;
    int pedidoId;


    factory DeleteDetalle.fromMap(Map<String, dynamic> json) => DeleteDetalle(
        id: json["id"],
        precio: json["precio"],
        cantidad: json["cantidad"],
        productoId: json["producto_id"],
        pedidoId: json["pedido_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "precio": precio,
        "cantidad": cantidad,
        "producto_id": productoId,
        "pedido_id": pedidoId,

    };
}
