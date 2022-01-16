import 'package:flutter/material.dart';
import 'package:panificadora_mimago/widgets/button_generic.dart';
import 'package:panificadora_mimago/pages/login/widgets/sign_in.dart';
import 'package:panificadora_mimago/pages/login/widgets/sign_up.dart';
import 'package:panificadora_mimago/theme.dart';
import 'package:panificadora_mimago/utils/bubble_indicator_painter.dart';

class LoginPage extends StatefulWidget {
   LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  //controla el orden del degradee
  bool isLogin = true;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: isLogin? Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 250, 255, 100),
            gradient: CustomTheme.primaryGradient,
          ),
          child: _crearContenido(screenSize, context),
        )
        :Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(236, 250, 255, 100),
            gradient:CustomTheme.secodaryGradient,
          ),
          child: _crearContenido(screenSize, context),
        ),
      ),
    ));
  }


  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x4400BAFF),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
             
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existente',
                  style: TextStyle(
                      color: CustomTheme.white,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'Nuevo',
                  style: TextStyle(
                      color: CustomTheme.white,
                      fontSize: 16.0,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
  Widget _crearContenido(Size screenSize,BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Image(
                    height:
                        screenSize.height > 800 ? 191.0 : 150,
                    fit: BoxFit.fill,
                    image: const AssetImage('assets/img/login_logo.png')),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                child: _buildMenuBar(context),
              ),
              Expanded(
                flex: 2,
                child: PageView(
                  controller: _pageController,
                  physics: const ClampingScrollPhysics(),
                  onPageChanged: (int i) {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (i == 0) {
                      setState(() {
                        isLogin = true;
                      });
                    } else if (i == 1) {
                      setState(() {
                        isLogin = false;
                      });
                    }
                  },
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child:  SignIn(),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints.expand(),
                      child:  SignUp(),
                    ),
                  ],
                ),
              ),
              Container(
                height: 45,
                margin: const EdgeInsets.only(
                  left: 30,
                  right: 20,
                  top:30,
                ),
                child: ButtonGeneric(
                    primary:false,
                    text: 'Ver Catalogo de invitado',
                    function:_irACatalogoInvitado
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿No podes ingresar a la app?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: 'WorkSansMedium'),
                    )),
              ),
            ],
          );
  }


  //TODO(Camila): ir a pantalla de catalogo
  void _irACatalogoInvitado() {
    Navigator.pushReplacementNamed(context, 'catalog');
  }
}