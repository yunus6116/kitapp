import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class _OnBoardingVM extends ChangeNotifier {
  int currentIntroIndex = 0;

  void setCurrentIntroIndex(int newIndex){
    currentIntroIndex = newIndex;
    notifyListeners();
  }

}

final onBoardingVMProvider = ChangeNotifierProvider.autoDispose((_) => _OnBoardingVM());