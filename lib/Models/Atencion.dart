// To parse this JSON data, do
//
//     final atencion = atencionFromMap(jsonString);

import 'dart:convert';

class Atencion {
    Atencion({
        required this.id,
         this.fecha,
        required this.hora,
        required this.costo,
        required this.estado,
        required this.nombrePaciente,
        required this.nombreMedico,
        required this.servicio,
        required this.costofijo,
        required this.personaId,
        required this.usuarioId,
        required this.empleadoId,
        required this.servicioId,

    });

    int id;
    DateTime? fecha;
    String hora;
    int costo;
    String estado;
    String nombrePaciente;
    String nombreMedico;
    String servicio;
    String costofijo;
    int personaId;
    int usuarioId;
    int empleadoId;
    int servicioId;


    factory Atencion.fromJson(String str) => Atencion.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Atencion.fromMap(Map<String, dynamic> json) => Atencion(
        id: json["id"],
        fecha: DateTime.parse(json["fecha"]),
        hora: json["hora"],
        costo: json["costo"],
        estado: json["estado"],
        nombrePaciente: json["nombrePaciente"],
        nombreMedico: json["nombreMedico"],
        servicio: json["servicio"],
        costofijo: json["costofijo"],
        personaId: json["persona_id"],
        usuarioId: json["usuario_id"],
        empleadoId: json["empleado_id"],
        servicioId: json["servicio_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "fecha": "${fecha!.year.toString().padLeft(4, '0')}-${fecha!.month.toString().padLeft(2, '0')}-${fecha!.day.toString().padLeft(2, '0')}",
        "hora": hora,
        "costo": costo,
        "estado": estado,
        "nombrePaciente": nombrePaciente,
        "nombreMedico": nombreMedico,
        "servicio": servicio,
        "costofijo": costofijo,
        "persona_id": personaId,
        "usuario_id": usuarioId,
        "empleado_id": empleadoId,
        "servicio_id": servicioId,
    };
}
