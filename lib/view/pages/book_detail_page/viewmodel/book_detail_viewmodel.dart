import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/routing/router.gr.dart';

class BookDetailVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;
  BookDetailVM(this.ref);
}

final bookDetailVMProvider = ChangeNotifierProvider((ref) => BookDetailVM(ref));
