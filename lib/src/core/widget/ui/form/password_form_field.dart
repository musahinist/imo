import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);
  final ValueSetter<String> onChanged;

  @override
  Widget build(BuildContext context) {
    bool obsecureText = true;
    return StatefulBuilder(builder: (context, setState) {
      return TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon:
                  Icon(obsecureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                obsecureText = !obsecureText;
                setState(() {});
              }),
        ),
        obscureText: obsecureText,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
      );
    });
  }
}
