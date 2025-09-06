import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension BuildContextX on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  ThemeData get theme => Theme.of(this);
}

extension DateTimeX on DateTime {
  String toDisplayDate() {
    return DateFormat('M/d/yy').format(this);
  }
}
