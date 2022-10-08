// use AppDuration instead
enum DurationEnum {
  xs(Duration(milliseconds: 300)),
  s(Duration(milliseconds: 600)),
  m(Duration(seconds: 1)),
  l(Duration(seconds: 2));

  final Duration value;
  const DurationEnum(this.value);
}
