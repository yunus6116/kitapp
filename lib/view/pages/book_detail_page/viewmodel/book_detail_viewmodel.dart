import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/snackbar_extension.dart';
import 'package:kitapp/core/global_constants/global_constants.dart';

import '../../../../core/global_models/book_model/book_model.dart';
import '../../../../core/routing/router.gr.dart';
import '../../../../core/services/book_services.dart';

class BookDetailVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;
  BookDetailVM(this.ref);

  Future<void> addBookToFavourites({required BookModel bookModel}) async {
    try {
      await ref
          .read(bookServicesProvider)
          .addBookToFavourites(bookModel: bookModel);
      refreshBookFavouriteStatus(bookModel.id!);
    } catch (e) {
      snackBarKey.showSnackBar(error: e);
    }
  }

  Future<void> removeBookFromFavourites({required BookModel bookModel}) async {
    try {
      await ref
          .read(bookServicesProvider)
          .removeBookFromFavourites(bookModel: bookModel);
      refreshBookFavouriteStatus(bookModel.id!);
    } catch (e) {
      snackBarKey.showSnackBar(error: e);
    }
  }

  refreshBookFavouriteStatus(String bookId) {
    ref.invalidate(bookFavouritesStatusProvider(bookId));
  }
}

final bookDetailVMProvider = ChangeNotifierProvider((ref) => BookDetailVM(ref));

final bookFavouritesStatusProvider =
    FutureProvider.family<bool, String>((ref, bookId) async {
  return await ref.read(bookServicesProvider).isBookFavourite(bookId: bookId);
});
