import 'package:flutter/material.dart';

class editPerfilformprovider extends ChangeNotifier {
  GlobalKey<FormState> formkeyedit = new GlobalKey<FormState>();

  String name = '';
  String email = '';
  String ci = '';
  String direccion = '';
  String telefono = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkeyedit.currentState?.validate());
    print('$email - $name - $ci - $direccion - $telefono');
    return formkeyedit.currentState?.validate() ?? false;
  }
}
