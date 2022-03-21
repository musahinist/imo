import 'package:flutter/material.dart';
import 'package:imo/src/app.dart';

showSnackBarCtx(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}

showSnackBar(String text) {
  return scaffoldMessengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}
