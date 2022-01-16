import 'package:panificadora_mimago/logic/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

export 'package:panificadora_mimago/logic/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  factory Provider({Key key, Widget child}){
    
      _instacia ??= Provider._internal(key:key, child:child);

    return _instacia;
  }

  Provider._internal({Key key, Widget child})
    : super(key: key, child: child);

  static Provider _instacia;

  final LoginBloc loginBloc = LoginBloc();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget)=> true;

  static LoginBloc of (BuildContext context){
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBloc;
  }

}