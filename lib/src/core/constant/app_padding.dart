import 'package:flutter/material.dart';

class AppPadding extends EdgeInsets {
  static const double _normalValue = 12;

  const AppPadding.horizontalSymmetric()
      : super.symmetric(horizontal: _normalValue);
  const AppPadding.verticalSymmetric()
      : super.symmetric(vertical: _normalValue);
  const AppPadding.general()
      : super.only(right: _normalValue, left: _normalValue, top: _normalValue);
  const AppPadding.all() : super.all(_normalValue);
  const AppPadding.onlyLeft() : super.only(left: _normalValue);
  const AppPadding.onlyBottom() : super.only(bottom: _normalValue);
  const AppPadding.onlyTop() : super.only(top: _normalValue);
  const AppPadding.onlyRight() : super.only(right: _normalValue);
}
