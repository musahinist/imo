import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../util/show_overlay.dart';

class DateFormField extends StatefulWidget {
  const DateFormField(
      {Key? key, this.labelText = 'Date', required this.onChanged})
      : super(key: key);

  final String labelText;
  final ValueSetter<String?> onChanged;

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.clear();
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [DateTextFormatter()],
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: "MM/dd/yyyy",
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_month),
          onPressed: () async {
            DateTime? date = await Show.cupertinoDatePickerModal(context);
            if (date != null) {
              controller.text = DateFormat("MM/dd/yyyy").format(date);
              widget.onChanged.call(controller.text);
            }
          },
        ),
      ),
      onChanged: (String value) {
        widget.onChanged.call(controller.text);
        // if (value.isEmpty) {
        //   widget.onChanged?.call(null);
        // } else {
        //   widget.onChanged?.call(DateTime.tryParse(value)!);
        // }
      },
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  static const _maxChars = 8;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = _format(newValue.text, '/');
    return newValue.copyWith(text: text, selection: updateCursorPosition(text));
  }

  String _format(String value, String seperator) {
    value = value.replaceAll(seperator, '');
    var newString = '';

    for (int i = 0; i < min(value.length, _maxChars); i++) {
      newString += value[i];
      if ((i == 1 || i == 3) && i != value.length - 1) {
        newString += seperator;
      }
    }

    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
