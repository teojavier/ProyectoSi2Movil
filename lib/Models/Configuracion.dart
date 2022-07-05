import 'package:meta/meta.dart';
import 'dart:convert';


Configuracion configuracionFromJson(String str) => Configuracion.fromJson(json.decode(str));

String configuracionToJson(Configuracion data) => json.encode(data.toJson());

class Configuracion {
    Configuracion({
        required this.id,
        required this.razonSocial,
        required this.email,
        required this.responsable,
        required this.factura,
        required this.telefono,
        required this.direccion,
    });

    int id;
    String razonSocial;
    String email;
    String responsable;
    String factura;
    String telefono;
    String direccion;

    factory Configuracion.fromJson(Map<String, dynamic> json) => Configuracion(
        id: json["id"],
        razonSocial: json["razon_social"],
        email: json["email"],
        responsable: json["responsable"],
        factura: json["factura"],
        telefono: json["telefono"],
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "razon_social": razonSocial,
        "email": email,
        "responsable": responsable,
        "factura": factura,
        "telefono": telefono,
        "direccion": direccion,
    };
}
