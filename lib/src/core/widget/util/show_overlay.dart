import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

class Show {
  static ScaffoldMessengerState snackBarCtx(BuildContext context, String text) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  static ScaffoldMessengerState snackBar(String text) {
    return scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
        ),
      );
  }

  static Future<DateTime?> cupertinoDatePickerModal(
    BuildContext context,
  ) async {
    DateTime? date;
    FocusScope.of(context).unfocus();
    await showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          initialDateTime: DateTime.now(),
          mode: CupertinoDatePickerMode.date,
          use24hFormat: true,
          // This is called when the user changes the date.
          onDateTimeChanged: (DateTime newDate) {
            date = newDate;
          },
        ),
      ),
    );

    return date;
  }
}
