import 'package:flutter/material.dart';
class TextFormFieldGeneric extends StatelessWidget {
  const TextFormFieldGeneric({
    Key key,
    this.focusNode,
    this.textInputType,
    this.textCapitalization,
    this.hint,
    this.labelText,
    this.keyboardType,
    this.counterText,
    this.errorText,
    this.error,
    this.icon,
    this.onChanged,
  }) : super(key: key);
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String hint;
  final String labelText;

  final TextInputType keyboardType;
  final String counterText;
  final String errorText;
  final Object error;
  final ValueChanged<String> onChanged;
  final Widget icon;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 25.0, right: 26.0, bottom: 20.0),
      child: TextFormField(
        // obscureText: true,
        focusNode: focusNode,
        keyboardType: textInputType,
        textCapitalization: textCapitalization,
        
        
        
        autocorrect: false,
        style: const TextStyle(
          fontFamily: 'WorkSansSemiBold',
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hint,
          hintStyle:
              const TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
        ),

        onFieldSubmitted: (_) {
          focusNode.requestFocus();
        },
        onChanged:
            (value) {}, //cada vez que cambia la variable se va a registrar
      ),
    );
  }
}