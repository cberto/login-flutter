import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panificadora_mimago/pages/login/login_page.dart';
import 'package:panificadora_mimago/pages/order/order.dart';
import 'package:panificadora_mimago/pages/ticket/ticket.dart';

import 'pages/catalog/catalog.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Panaderia',
    home: LoginPage(),
    routes: {
      //'/':(BuildContext context)=> LoginPage(),
      'login':(BuildContext context)=> LoginPage(),
      'catalog':(BuildContext context)=> Catalog(),
      'order':(BuildContext context)=> Order(),
      'ticket':(BuildContext context)=> Ticket(),
    },
    );
  }
}
