import 'dart:async';

/// 1 - Create a debounce instance
/// final Debounce _debounce = Debounce(Duration(milliseconds: 400));
/// 2 - Use it
/// _debounce((){ print('First'); });
/// _debounce((){ print('Second'); });
/// _debounce((){ print('Third'); });
/// ...after 400ms you'll see "Third"
class Debounce {
  Duration delay;
  Timer? _timer;

  Debounce(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}
