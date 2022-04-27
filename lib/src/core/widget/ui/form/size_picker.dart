import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({Key? key}) : super(key: key);

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  final Map<double, String> sizes = {
    12: "S",
    14: "M",
    16: "L",
  };
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(sizes.length, (index) {
        return GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Colors.purple.withOpacity(0.2)
                  : null,
            ),
            child: Text(
              sizes.values.elementAt(index),
              style: TextStyle(
                fontSize: sizes.keys.elementAt(index),
                color: selectedIndex == index ? Colors.purple : null,
              ),
            ),
          ),
        );
      }),
    );
  }
}
