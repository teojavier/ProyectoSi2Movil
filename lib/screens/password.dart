import 'package:appmovil/providers/updatePass_form_provider.dart';
import 'package:appmovil/services/editPerfil_service.dart';
import 'package:appmovil/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final perfilService = Provider.of<EditarPerfilService>(context);
    return Scaffold(
        drawer: Navbar(),
        appBar: AppBar(
          title: Text('Editar Contraseña'),
        ),
        body: Container(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 130),
              CardContainer(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Contraseña',
                        style: Theme.of(context).textTheme.headline4),
                    SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => updatePassformprovider(),
                      child: _PasswordForm(),
                    )
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

class _PasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final updatePassForm = Provider.of<updatePassformprovider>(context);
    return Container(
      child: Form(
          key: updatePassForm.formkeyPass,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Escriba su nueva Contraseña',
                    labelText: 'Nueva Contraseña',
                    prefixIcon: Icons.lock_outline),
                onChanged: (value) => updatePassForm.newpass = value,
              ),
              SizedBox(height: 10),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'Repita su Contraseña',
                    labelText: 'Repita la Contraseña',
                    prefixIcon: Icons.lock_open),
                onChanged: (value) => updatePassForm.newnewpass = value,
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
                        updatePassForm.isLoading ? 'Espere' : 'Guardar',
                        style: TextStyle(color: Colors.white),
                      )),
                  onPressed: updatePassForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          if (!updatePassForm.isValidForm()) return;
                          updatePassForm.isLoading = true;
                          await Future.delayed(Duration(seconds: 2));
                          print(updatePassForm.newpass);
                          print(updatePassForm.newnewpass);
                          updatePassForm.isLoading = false;
                          final editPerfilService =
                              Provider.of<EditarPerfilService>(context,
                                  listen: false);
                          final String respuesta =
                              await editPerfilService.updatePassword(
                                  updatePassForm.newpass,
                                  updatePassForm.newnewpass);

                          if (respuesta.contains('email')) {
                            updatePassForm.isLoading = false;
                            Navigator.pushReplacementNamed(context, 'password');
                            return showDialog(
                              context: context,
                              builder: (_) => _DialogoAlerta(
                                mensaje: "Cambio de Contraseña Realizado",
                              ),
                            );
                          } else {
                            updatePassForm.isLoading = false;
                            return showDialog(
                              context: context,
                              builder: (_) => _DialogoAlerta(
                                mensaje: "Contraseña incorrecta",
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
      title: Text('Informacion'),
      content: Text(this.mensaje),
    );
  }
}
