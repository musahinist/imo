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

  static void bottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      elevation: 16,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      builder: (context) => Container(
        //   height: 200,
        decoration: BoxDecoration(
          color: Colors.blueGrey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.more_horiz, size: 36, color: Colors.grey),
            widget
          ],
        ),
      ),
    );
  }
}
