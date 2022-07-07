import 'package:flutter/material.dart';

class addproductoformprovider extends ChangeNotifier {
  GlobalKey<FormState> formkeyAdd = new GlobalKey<FormState>();

  int? cantidad;
  int? idpedido;
  int? idproducto;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkeyAdd.currentState?.validate());
    print('$cantidad' + '  Id Pedido:  ' +'$idpedido' + '  Id Producto: ' + '$idproducto');
    return formkeyAdd.currentState?.validate() ?? false;
  }
}
