import 'package:flutter/material.dart';
import 'package:panificadora_mimago/logic/bloc/login_bloc.dart';
import 'package:panificadora_mimago/logic/bloc/provider.dart';
import 'package:panificadora_mimago/widgets/button_generic.dart';
import 'package:panificadora_mimago/pages/login/widgets/text_form_field_generic.dart';
import 'package:panificadora_mimago/pages/login/widgets/text_form_field_password_generic.dart';

import '../../../theme.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FocusNode focusNodeNumeroCliente = FocusNode();
  final FocusNode focusNodeCuit = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeNumeroTel = FocusNode();

  void deactive() {
    focusNodeNumeroCliente.dispose();
    focusNodeCuit.dispose();
    focusNodeEmail.dispose();
    focusNodeNumeroTel.dispose();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final LoginBloc bloc = Provider.of(context);

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
              left: (screenSize.width < screenSize.height) ? 10 : 100,
              right: (screenSize.width < screenSize.height) ? 10 : 100,
              bottom: 25,
              top: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 3.0,
                    offset: Offset(0, 3.0),
                    spreadRadius: 2.0),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StreamBuilder<Object>(
                  stream: bloc.telefonoStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormFieldGeneric(
                      focusNode: focusNodeNumeroTel,
                      textInputType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'Número de telefono',
                      hint: '1256898956',
                      counterText: bloc.telefono.toString(),
                    );
                  }),
              StreamBuilder<Object>(
                  stream: bloc.numStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormFieldPasswordGeneric(
                      focusNode: focusNodeNumeroCliente,
                      textInputType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'Número de cliente',
                      hint: 'Número de cliente',
                      counterText: bloc.numCliente.toString(),
                    );
                  }),
              StreamBuilder<Object>(
                  stream: bloc.cuitStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormFieldPasswordGeneric(
                      focusNode: focusNodeCuit,
                      textInputType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'CUIT',
                      hint: 'CUIT',
                      counterText: bloc.cuit.toString(),
                    );
                  }),
              StreamBuilder<Object>(
                  stream: bloc.emailStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return TextFormFieldGeneric(
                      keyboardType: TextInputType.emailAddress,
                      focusNode: focusNodeEmail,
                      textInputType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                      labelText: 'Correo',
                      hint: 'Ejemplo@gmail.com',
                      counterText: bloc.email,
                      
                    );
                  }),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child:
              ButtonGeneric(
            text: 'Registrarse',
            primary: true,
            function: () {
              _signup(bloc, context);
            },
          ),
        ),
      ],
    );
  }

  void _signup(LoginBloc bloc, BuildContext context) {
    //usuarioService.nuevoUsuario(bloc.email, bloc.password);
    Navigator.pushReplacementNamed(context, 'home');
  }
}