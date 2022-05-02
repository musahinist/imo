import 'package:flutter/material.dart';

class NumberPicker extends StatelessWidget {
  const NumberPicker({Key? key, required this.onChanged}) : super(key: key);
  final ValueSetter<int> onChanged;

  @override
  Widget build(BuildContext context) {
    const double _kDefaultDiameterRatio = 1.07;
    const double _kDefaultPerspective = 0.003;
    const double _kSqueeze = 1.45;
    const double _kOverAndUnderCenterOpacity = 0.447;

    return RotatedBox(
      quarterTurns: -1,
      child: Container(
        height: 36,
        width: 32,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 229, 229, 234),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListWheelScrollView(
          controller: FixedExtentScrollController(initialItem: 3),
          physics: const FixedExtentScrollPhysics(),
          diameterRatio: _kDefaultDiameterRatio,
          perspective: _kDefaultPerspective,
          squeeze: _kSqueeze,
          overAndUnderCenterOpacity: _kOverAndUnderCenterOpacity,
          itemExtent: 36,
          children: [
            for (var i = 0; i < 13; i++)
              RotatedBox(
                quarterTurns: 1,
                child: Text(
                  '$i',
                  textScaleFactor: 1.6,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              ),
          ],
          onSelectedItemChanged: onChanged,
        ),
      ),
    );
  }
}
