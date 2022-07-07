import 'package:appmovil/Models/Atencion.dart';
import 'package:appmovil/Models/Productos.dart';
import 'package:appmovil/providers/addProducto_form_provider.dart';
import 'package:appmovil/screens/Pedidos_productos.dart';
import 'package:appmovil/services/addproductos_service.dart';
import 'package:appmovil/ui/input_decorations_pedidos.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:appmovil/providers/editPerfil_form_provider.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:provider/provider.dart';


class ProductCardP extends StatelessWidget {
  final Productos producto;
  final int idpedido;
  const ProductCardP({Key? key, required this.producto, required this.idpedido})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20), //es en general en el view
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 20), //es solo para el card
        width: double.infinity,
        height: 550,
        decoration: _carBorders(),
        child: Column(
          children: [
            _BackgroundImage(producto.imagen),
            _ProductDetail(
                producto.nombre,
                producto.precio,
                producto.descripcion,
                producto.stock,
                'producto.categoriaId',
                idpedido,
                producto.id),
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

class _ProductDetail extends StatelessWidget {
  final String? nombre;
  final String? precio;
  final String? descripcion;
  final int? stock;
  final String? categoriaId;
  final int? idpedido;
  final int? idproducto;
  const _ProductDetail(this.nombre, this.precio, this.descripcion, this.stock,
      this.categoriaId, this.idpedido, this.idproducto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 240,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Producto:  ' + nombre!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Descripcion:  ' + descripcion!,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Precio:  ' +
                  precio! +
                  '  Bs   |------|  Stock:  ' +
                  stock.toString(),
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            ChangeNotifierProvider(
              create: (_) => addproductoformprovider(),
              child: _AddProducto(idpedido, idproducto),
            )
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromARGB(255, 237, 16, 0),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)));
}

class _BackgroundImage extends StatelessWidget {
  final String? imagen;
  const _BackgroundImage(this.imagen);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 300,
        child: WebView(
          initialUrl: imagen!,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}

class _AddProducto extends StatelessWidget {
  final int? idpedido;
  final int? idproducto;
  const _AddProducto(this.idpedido, this.idproducto);
  @override
  Widget build(BuildContext context) {
    final addProductoForm = Provider.of<addproductoformprovider>(context);
    return Container(
      child: Form(
          key: addProductoForm.formkeyAdd,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.number,
                decoration: InputDecorationsPedidos.pedidosInputDecoration(
                    hintText: 'Cantidad',
                    labelText: 'Escriba la Cantidad',
                    prefixIcon: Icons.numbers),
                onChanged: (value) =>
                    addProductoForm.cantidad = int.parse(value),
              ),
              SizedBox(height: 30),
              MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  color: Colors.red,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        addProductoForm.isLoading ? 'Espere' : 'Agregar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: addProductoForm.isLoading
                      ? null
                      : () async {
                          addProductoForm.idpedido = idpedido;
                          addProductoForm.idproducto = idproducto;
                          FocusScope.of(context).unfocus();
                          if (!addProductoForm.isValidForm()) return;
                          addProductoForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 2));
                          addProductoForm.isLoading = false;

                          final addProductoService =
                              Provider.of<AddProductoService>(context,
                                  listen: false);

                          final String respuesta =
                              await addProductoService.agregarProductos(
                                  addProductoForm.cantidad!,
                                  addProductoForm.idpedido!,
                                  addProductoForm.idproducto!);

                          print(respuesta);
                          if (respuesta.contains('id')) {
                            addProductoForm.isLoading = false;
                            Navigator.pushReplacementNamed(context, 'pedidos');
                            return showDialog(
                              context: context,
                              builder: (_) => _DialogoAlerta2(
                                mensaje: "Producto Agregado",
                              ),
                            );
                          } else {
                            addProductoForm.isLoading = false;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddProductos(idpedido: idpedido!)),
                            );
                            return showDialog(
                              context: context,
                              builder: (_) => _DialogoAlerta(
                                mensaje: "Stock No Disponible",
                              ),
                            );
                          }
                        }
                  //TUDO: LOGINFORM
                  )
            ],
          )),
    );
  }
}

class _DialogoAlerta extends StatelessWidget {
  final String mensaje;

  const _DialogoAlerta({required this.mensaje});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error'),
      content: Text(this.mensaje),
    );
  }
}

class _DialogoAlerta2 extends StatelessWidget {
  final String mensaje;

  const _DialogoAlerta2({required this.mensaje});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exito'),
      content: Text(this.mensaje),
    );
  }
}
