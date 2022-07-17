import 'package:flutter/material.dart';

class nuevoPedidoformprovider extends ChangeNotifier {
  GlobalKey<FormState> formkeynewpedido = new GlobalKey<FormState>();

  String tipoPago = '';
  String tipoEnvio = '';
  String promocion = '';
  String user_id = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkeynewpedido.currentState?.validate());
    print('$tipoPago - $tipoEnvio - $promocion - $user_id');
    return formkeynewpedido.currentState?.validate() ?? false;
  }
}
