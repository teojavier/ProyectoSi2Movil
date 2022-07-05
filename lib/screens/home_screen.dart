import 'package:appmovil/services/productos_service.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productoService = Provider.of<ProductoService>(context);
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text('Productos'),
      ),

      body: ListView.builder(
        itemCount: productoService.productos.length,
        itemBuilder: (BuildContext context, int index) => ProductCard(
          producto: productoService.productos[index],
        ),
      ),
    );
  }

  
}