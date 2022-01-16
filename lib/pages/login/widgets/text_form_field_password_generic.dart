import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFormFieldPasswordGeneric extends StatefulWidget {
  const TextFormFieldPasswordGeneric(
      {Key key,
      this.focusNode,
      this.textInputType,
      this.textCapitalization,
      this.hint,
      this.labelText,
      this.keyboardType,
      this.counterText,
      
      })
      : super(key: key);
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String hint;
  final String labelText;

  final TextInputType keyboardType;
  final String counterText;


  @override
  _TextFormFieldPasswordGenericState createState() =>
      _TextFormFieldPasswordGenericState();
}

class _TextFormFieldPasswordGenericState
    extends State<TextFormFieldPasswordGeneric> {
  bool obscureTextPassword = true;

  void _obscureTextPassword() {
    setState(() {
      obscureTextPassword = !obscureTextPassword;
    });
  }

  IconData _iconPassword() {
    if (obscureTextPassword) return FontAwesomeIcons.eye;
    return FontAwesomeIcons.eyeSlash;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25.0,
          right: 25.0,
          bottom: 10.0,
        ),
        child: TextFormField(
          focusNode: widget.focusNode,
          obscureText: obscureTextPassword,
          autocorrect: false,
          keyboardType: widget.textInputType,
          textCapitalization: widget.textCapitalization,
          
          style: const TextStyle(
            fontFamily: 'WorkSansSemiBold',
            fontSize: 16.0,
          ),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle:
                const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
            suffixIcon: GestureDetector(
              onTap: () => _obscureTextPassword(),
              child: Icon(_iconPassword(), size: 15.0, color: Colors.grey),
            ),
          ),
          onFieldSubmitted: (_) {
            widget.focusNode.requestFocus();
          },
        ),
      ),
    );
  }
}
