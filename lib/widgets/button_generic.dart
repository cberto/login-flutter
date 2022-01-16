import 'package:flutter/material.dart';

import '../theme.dart';

class ButtonGeneric extends StatelessWidget {
  const ButtonGeneric({Key key, this.primary, @required this.text, @required this.function}) : super(key: key);
  final VoidCallback function; 
  final bool primary;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size; 
    return ElevatedButton(
              child: Container(
                padding: sizeScreen.width > 800? EdgeInsets.symmetric(horizontal:70,vertical:10): EdgeInsets.symmetric(horizontal:40,vertical:10),
                child: primary? Text(
                  text,
                  style: const TextStyle(
                      color: CustomTheme.white,
                      fontSize: 18.0,
                      fontFamily: 'WorkSansBold'
                  ),
                )
                :
                Text(
                  text,
                  style: const TextStyle(
                      color: CustomTheme.blue,
                      fontSize: 18.0,
                      fontFamily: 'WorkSansBold'
                  ),
                ),
              ),
              style:ElevatedButton.styleFrom(
                onPrimary: Colors.black87,
                primary: primary? CustomTheme.blue:CustomTheme.white,
                minimumSize: Size(88, 36),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              onPressed: function,
            );
  }
}
