import 'package:udemy_flutter/Data/count_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class CountDataChangedNotifier {
  void valueChanged(CountData oldValue, CountData newValue);
}