import 'package:meta/meta.dart';
import 'dart:convert';

List<TipoEnvio> tipoEnvioFromMap(String str) => List<TipoEnvio>.from(json.decode(str).map((x) => TipoEnvio.fromMap(x)));

String tipoEnvioToMap(List<TipoEnvio> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class TipoEnvio {
    TipoEnvio({
        required this.id,
        required this.nombre,
    });

    int id;
    String nombre;

    factory TipoEnvio.fromMap(Map<String, dynamic> json) => TipoEnvio(
        id: json["id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombre": nombre,
    };
}
