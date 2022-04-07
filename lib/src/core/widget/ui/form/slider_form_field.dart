import 'package:flutter/material.dart';
//import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SliderFormField extends StatefulWidget {
  const SliderFormField({
    Key? key,
    required this.labelText,
    required this.onDelete,
    this.isCircularSlider = false,
  }) : super(key: key);
  final VoidCallback onDelete;
  final bool isCircularSlider;
  final String labelText;

  @override
  State<SliderFormField> createState() => _SliderFormFieldState();
}

class _SliderFormFieldState extends State<SliderFormField> {
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: widget.labelText,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // if (widget.isCircularSlider)
                      //   SleekCircularSlider(
                      //     onChange: (value) {
                      //       setState(() => this.value = value);
                      //     },
                      //     appearance: CircularSliderAppearance(
                      //       customColors: CustomSliderColors(
                      //         progressBarColor: Colors.purple,
                      //         trackColor: Colors.grey,
                      //         shadowColor: Colors.blue,
                      //       ),
                      //       size: 50,
                      //       customWidths: CustomSliderWidths(
                      //         //  trackWidth: 4,
                      //         progressBarWidth: 8,
                      //         shadowWidth: 10,
                      //       ),
                      //     ),
                      //     min: 0,
                      //     max: 100,
                      //     initialValue: 50,
                      //   ),
                      if (!widget.isCircularSlider) Text('${value.ceil()}%'),
                      const SizedBox(
                        height: 16,
                        width: 8,
                        child: VerticalDivider(
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: widget.onDelete,
                      ),
                      IconButton(
                        icon: const Icon(Icons.visibility),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (!widget.isCircularSlider)
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackShape: CustomTrackShape(),
                  trackHeight: .5,
                  activeTrackColor: Colors.purple,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: Colors.purple,
                  overlayColor: Colors.purple.withAlpha(32),
                  valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 8),
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
                  label: '${value.ceil()}',
                  value: value,
                  min: 0,
                  max: 103,
                  divisions: 103,
                  onChanged: (value) {
                    if (value >= 20 && value <= 100) {
                      setState(() => this.value = value);
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
