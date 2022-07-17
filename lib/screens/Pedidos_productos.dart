import 'package:appmovil/services/productos_service.dart';
import 'package:appmovil/src/search_productos_delegate.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProductos extends StatelessWidget {
  final int idpedido;
  const AddProductos({Key? key, required this.idpedido}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchProductoDelegate(productoService.productos, idpedido),
            );
          },
          title: const Text(
            'Buscar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: productoService.productos.length,
        itemBuilder: (BuildContext context, int index) => ProductCardP(
          producto: productoService.productos[index],
          idpedido: idpedido,
        ),
      ),
    );
  }
}
