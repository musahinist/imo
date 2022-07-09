import 'package:intl/intl.dart';
import 'dart:io';

String getCurrency() {
  var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
  return format.currencySymbol;
}
