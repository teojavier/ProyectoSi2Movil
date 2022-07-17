import 'package:appmovil/Models/promocion.dart';
import 'package:appmovil/Models/tipo_envio.dart';
import 'package:appmovil/Models/tipo_pago.dart';
import 'package:appmovil/providers/nuevoPedido_provider.dart';
import 'package:appmovil/services/addPedido_service.dart';
import 'package:appmovil/services/editPerfil_service.dart';
import 'package:appmovil/services/pedidos_service.dart';
import 'package:appmovil/services/promocion_service.dart';
import 'package:appmovil/services/tipoEnvio_service.dart';
import 'package:appmovil/services/tipoPago_service.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AgregarPedidos extends StatefulWidget {
  @override
  State<AgregarPedidos> createState() => _AgregarPedidosState();
}

class _AgregarPedidosState extends State<AgregarPedidos> {
  late final List<TipoPago> listaTipoPago = [];
  late final List<TipoEnvio> listaTipoEnvio = [];
  late final List<Promocion> listapromocion = [];

  @override
  void initState() {
    super.initState();
    loadTipoPago();
    loadTipoEnvio();
    loadPromocion();
  }

  void loadTipoPago() async {
    final response = await http
        .get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoPagos'));
    final List<dynamic> tipoPagoMap = json.decode(response.body);

    tipoPagoMap.forEach((element) {
      final tipoPagoMap = TipoPago.fromMap(element);
      this.listaTipoPago.add(tipoPagoMap);
    });
    print(this.listaTipoPago);
  }

  void loadTipoEnvio() async {
    final respuesta = await http
        .get(Uri.parse('https://proyectosi2360.herokuapp.com/api/tipoEnvios'));
    final List<dynamic> tipoEnvioMap = json.decode(respuesta.body);

    tipoEnvioMap.forEach((element) {
      final tipoEnvioMap = TipoEnvio.fromMap(element);
      this.listaTipoEnvio.add(tipoEnvioMap);
    });
    print(this.listaTipoEnvio);
  }

  void loadPromocion() async {
    final respuesta = await http
        .get(Uri.parse('https://proyectosi2360.herokuapp.com/api/promociones'));
    final List<dynamic> promocionMap = json.decode(respuesta.body);

    promocionMap.forEach((element) {
      final promocionMap = Promocion.fromMap(element);
      this.listapromocion.add(promocionMap);
    });
  }

  String? _vista0 = 'Seleccione una Opcion';
  String? _vista1 = 'Seleccione una Opcion';
  String? _vista2 = 'Seleccione una Opcion';

  @override
  Widget build(BuildContext context) {
    final tipoPagoService = Provider.of<TipoPagoService>(context);
    final tipoEnvioService = Provider.of<TipoEnvioService>(context);
    final promocionService = Provider.of<PromocionService>(context);
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Agregar Nuevo Pedido'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              Text('Tipo de Pago',
                  style: Theme.of(context).textTheme.headline4),
              Center(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: DropdownButton(
                    items: this
                        .listaTipoPago
                        .map(
                          (map) => DropdownMenuItem(
                            child: Text(map.nombre),
                            value: map.nombre,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    onChanged: (_value) => {
                      setState(() {
                        _vista0 = _value.toString();
                        print(_vista0);
                      }),
                    },
                    hint: Text(_vista0!),
                  ),
                ),
              ),
              Text('Tipo de Envio',
                  style: Theme.of(context).textTheme.headline4),
              Center(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: DropdownButton(
                    items: this
                        .listaTipoEnvio
                        .map(
                          (map) => DropdownMenuItem(
                            child: Text(map.nombre),
                            value: map.nombre,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    onChanged: (_value) => {
                      setState(() {
                        _vista1 = _value.toString();
                        print(_vista1);
                      }),
                    },
                    hint: Text(_vista1!),
                  ),
                ),
              ),
              Text('Promocion', style: Theme.of(context).textTheme.headline4),
              Center(
                child: Container(
                  width: 300,
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                  child: DropdownButton(
                    items: this
                        .listapromocion
                        .map(
                          (map) => DropdownMenuItem(
                            child: Text(map.nombre),
                            value: map.nombre,
                          ),
                        )
                        .toList(),
                    isExpanded: true,
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                    ),
                    onChanged: (_value) => {
                      setState(() {
                        _vista2 = _value.toString();
                        print(_vista2);
                      }),
                    },
                    hint: Text(_vista2!),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ChangeNotifierProvider(
                create: (_) => nuevoPedidoformprovider(),
                child: _BotonGuardar(_vista0, _vista1, _vista2),
              )
            ],
          ),
        )));
  }
}

class _BotonGuardar extends StatelessWidget {
  final String? tipoPago1;
  final String? tipoEnvio1;
  final String? promocion1;

  const _BotonGuardar(this.tipoPago1, this.tipoEnvio1, this.promocion1);
  @override
  Widget build(BuildContext context) {
    final newPedidoForm = Provider.of<nuevoPedidoformprovider>(context);
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.grey,
        elevation: 0,
        color: Colors.red,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
            child: Text(
              newPedidoForm.isLoading ? 'Espere' : 'Guardar',
              style: TextStyle(color: Colors.white),
            )),
        onPressed: () async {
          SharedPreferences pref = await SharedPreferences.getInstance();
          //String? user_id = pref.getString('user_id');
          String? user_id = '3';
          newPedidoForm.tipoPago = tipoPago1!;
          newPedidoForm.tipoEnvio = tipoEnvio1!;
          newPedidoForm.promocion = promocion1!;
          newPedidoForm.user_id = user_id;
          final addPedidoService =
              Provider.of<AddPedidoService>(context, listen: false);
          final String respuesta = await addPedidoService.agregarPedidos(
            newPedidoForm.tipoPago,
            newPedidoForm.tipoEnvio,
            newPedidoForm.promocion,
            newPedidoForm.user_id,
          );
          if (respuesta.contains('id')) {
            final pedidoService =
                Provider.of<PedidosService>(context, listen: false);
            pedidoService.actualiazarPedidos();
            Navigator.pushReplacementNamed(context, 'pedidos');
            return showDialog(
              context: context,
              builder: (_) => _DialogoAlerta(
                mensaje: "Pedido Creado Exitosamente",
              ),
            );
          } else {
            return showDialog(
              context: context,
              builder: (_) => _DialogoAlerta(
                mensaje: "faltan Datos",
              ),
            );
          }
        }

        //TUDO: LOGINFORM
        );
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
