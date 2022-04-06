import 'package:flutter/material.dart';

class CheckBoxFormField extends StatefulWidget {
  const CheckBoxFormField({
    Key? key,
    required this.labelText,
  }) : super(key: key);
  final String labelText;

  @override
  State<CheckBoxFormField> createState() => _CheckBoxInputFieldState();
}

class _CheckBoxInputFieldState extends State<CheckBoxFormField> {
  bool isChecked = false;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          controller: controller,
          enabled: isChecked,
          decoration: InputDecoration(
            hintText: "Class",
            labelText: widget.labelText,
            suffixIcon: const SizedBox(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Checkbox(
            activeColor: Colors.purple,
            value: isChecked,
            onChanged: (value) {
              isChecked = value!;
              controller.text = '';
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
