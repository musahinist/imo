import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final List<Color> colors = [
    Colors.purple,
    Colors.blue,
    Colors.green,
    Colors.grey
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(colors.length, (index) {
        return GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: colors[index],
            ),
            child: selectedIndex == index
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : null,
          ),
        );
      }),
    );
  }
}
