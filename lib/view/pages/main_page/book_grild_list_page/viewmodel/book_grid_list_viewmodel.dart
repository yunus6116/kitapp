import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/global_models/book_model/book_model.dart';

import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';
import '../../../../../core/services/book_services.dart';

class BookGridListVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  BookGridListVM(this.ref) {
    router = ref.read(routerProvider);
  }

  List<BookModel> myFavouriteBooksList = [];

  Future<void> getMyFavouriteBooksList() async {
    try {
      myFavouriteBooksList =
          await ref.read(bookServicesProvider).getMyFavouriteBooks();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

final bookGridListVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => BookGridListVM(ref));
