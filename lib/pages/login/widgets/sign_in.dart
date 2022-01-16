import 'package:flutter/material.dart';
import 'package:panificadora_mimago/logic/bloc/login_bloc.dart';
import 'package:panificadora_mimago/logic/bloc/provider.dart';
import 'package:panificadora_mimago/widgets/button_generic.dart';
import 'package:panificadora_mimago/pages/login/widgets/text_form_field_generic.dart';

import '../../../theme.dart';

class SignIn extends StatefulWidget {
   SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //TextEditingController loginEmailController = TextEditingController();

  final FocusNode focusNodeEmail = FocusNode();
  bool _rememberMe = false;

  void deactive() {
    focusNodeEmail.dispose();
  }


  @override
  void dispose() {
    focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //final LoginBloc bloc = Provider.of(context);

    return 
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                          left: (screenSize.width <
                              screenSize.height)
                          ? 10
                          : 100,
                          right: (screenSize.width <
                              screenSize.height)
                          ? 10
                          : 100,
                          bottom: 25,
                          top:5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Color(0x33000000),blurRadius: 3.0,offset: Offset(0,3.0),spreadRadius: 2.0),
                    ]
                  ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //TODO:agregar check
                    StreamBuilder<Object>(
                      stream:null, //bloc.numStream,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return TextFormFieldGeneric(
                          focusNode: focusNodeEmail,
                          textInputType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.words,
                          labelText: 'Número de telefono',
                          hint: '011 41232093',
                        );
                      }
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Theme(
                            data: ThemeData(unselectedWidgetColor: Colors.blue),
                            child: Checkbox(
                              value: _rememberMe,
                              checkColor: Colors.white,
                              activeColor: CustomTheme.blue,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value;
                                });
                              },
                            ),
                          ),
                          const Text(
                            'Mantener sesion',
                            style: TextStyle(
                                fontFamily: 'WorkSansBold',
                                fontSize: 16.0,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:
                 ButtonGeneric(
                    text: 'Ingresar',
                    primary: true,
                    function:(){
                      //_login(bloc,context);
                    }
                  ),
              )
            ],
    );
  }

  void _login(LoginBloc bloc, BuildContext context){
    
    //usuarioService.login(bloc.email, bloc.password);

    Navigator.pushReplacementNamed(context, 'home');
  }

}
