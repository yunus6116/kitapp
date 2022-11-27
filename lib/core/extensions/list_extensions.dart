import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

///Creates gaps in lists with given gap value
extension WidgetListExtensions on List<Widget> {
  List<Widget> withGap(double gap, {List<int> excludeIndexes = const []}) {
    return expand((element) sync* {
      var index = indexOf(element);
      if (index != 0 && !excludeIndexes.contains(index)) {
        yield Gap(gap);
      }
      yield element;
    }).toList();
  }

  List<Widget> reverseList(bool reverse) {
    if (reverse) {
      return reversed.toList();
    }
    return this;
  }
}

extension ListExtensions on List<dynamic> {
  void replaceAt(int index, replacement) {
    this[index] = replacement;
  }

  void replaceWith(original, replacement) {
    replaceAt(indexOf(original), replacement);
  }
}
