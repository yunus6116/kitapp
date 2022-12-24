import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/enums/collection_name.dart';
import 'package:kitapp/core/global_providers/global_providers.dart';

import '../global_models/book_model/book_model.dart';
import '../init/auth_manager/auth_manager.dart';

abstract class IBookServices {
  Future<List<BookModel>> getEditorsChoice();

  Future<List<BookModel>> getTopSellers();

  Future<List<BookModel>> getMyFavouriteBooks();

  Future<void> addBookToFavourites({required BookModel bookModel});

  Future<void> removeBookFromFavourites({required BookModel bookModel});
  Future<bool> isBookFavourite({required String bookId});
}

class BookServices extends IBookServices {
  final Ref ref;
  late FirebaseFirestore _firestore;

  BookServices(this.ref) {
    _firestore = ref.read(fireStoreProvider);
  }

  @override
  Future<List<BookModel>> getEditorsChoice() async {
    List<BookModel> editorsChoiceList = [];
    try {
      final querySnapshot =
          await _firestore.collection(CollectionName.editorsChoice.name).get();
      for (var doc in querySnapshot.docs) {
        BookModel bookModel = BookModel.fromMap(doc.data());
        editorsChoiceList.add(bookModel);
      }
      return editorsChoiceList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> getTopSellers() async {
    List<BookModel> topSellersList = [];
    try {
      final querySnapshot =
          await _firestore.collection(CollectionName.topSellers.name).get();
      for (var doc in querySnapshot.docs) {
        BookModel bookModel = BookModel.fromMap(doc.data());
        topSellersList.add(bookModel);
      }
      return topSellersList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<BookModel>> getMyFavouriteBooks() async {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));
    List<BookModel> favouriteBooksList = [];
    try {
      final querySnapshot = await _firestore
          .collection(CollectionName.users.name)
          .doc(currentUser!.uid)
          .collection(CollectionName.favouriteBooks.name)
          .get();
      for (var doc in querySnapshot.docs) {
        BookModel bookModel = BookModel.fromMap(doc.data());
        favouriteBooksList.add(bookModel);
      }
      return favouriteBooksList;
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> addBookToFavourites({required BookModel bookModel}) async {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));

    try {
      await _firestore
          .collection(CollectionName.users.name)
          .doc(currentUser!.uid)
          .collection(CollectionName.favouriteBooks.name)
          .doc(bookModel.id)
          .set(bookModel.toMap());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> removeBookFromFavourites({required BookModel bookModel}) async {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));

    try {
      await _firestore
          .collection(CollectionName.users.name)
          .doc(currentUser!.uid)
          .collection(CollectionName.favouriteBooks.name)
          .doc(bookModel.id)
          .delete();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> isBookFavourite({required String bookId}) async {
    final currentUser = ref
        .watch(authManagerProvider.select((value) => value.currentUserModel));
    CollectionReference favouritesCollection = _firestore
        .collection(CollectionName.users.name)
        .doc(currentUser!.uid)
        .collection(CollectionName.favouriteBooks.name);
    try {
      final querySnapshot =
          await favouritesCollection.where('id', isEqualTo: bookId).get();
      return querySnapshot.docs.isNotEmpty ? true : false;
    } catch (e) {
      rethrow;
    }
  }
}

final bookServicesProvider = Provider((ref) => BookServices(ref));
