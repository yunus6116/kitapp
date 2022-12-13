import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/enums/collection_name.dart';
import 'package:kitapp/core/global_providers/global_providers.dart';

import '../global_models/book_model/book_model.dart';

abstract class IBookServices {
  Future<List<BookModel>> getEditorsChoice();

  Future<List<BookModel>> getTopSellers();
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
}

final bookServicesProvider = Provider((ref) => BookServices(ref));
