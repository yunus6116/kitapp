import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/routing/router.gr.dart';

class MainVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;
  MainVM(this.ref);
}

final mainVMProvider = ChangeNotifierProvider((ref) => MainVM(ref));
