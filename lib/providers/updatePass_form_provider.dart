import 'package:flutter/material.dart';

class updatePassformprovider extends ChangeNotifier {
  GlobalKey<FormState> formkeyPass = new GlobalKey<FormState>();

  String newpass = '';
  String newnewpass = '';

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print(formkeyPass.currentState?.validate());
    print('$newpass - $newnewpass');
    return formkeyPass.currentState?.validate() ?? false;
  }
}
