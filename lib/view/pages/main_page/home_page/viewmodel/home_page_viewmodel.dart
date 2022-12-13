import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/global_models/book_model/book_model.dart';
import '../../../../../core/routing/router.gr.dart';
import '../../../../../core/routing/router_provider.dart';
import '../../../../../core/services/book_services.dart';

class HomePageVM extends ChangeNotifier {
  final Ref ref;
  late AppRouter router;

  HomePageVM(this.ref) {
    router = ref.read(routerProvider);
  }
  List<String> sliderList = [
    'assets/png/slider.png',
    'assets/png/slider.png',
    'assets/png/slider.png',
    'assets/png/slider.png',
  ];

  List<BookModel> editorsChoiceList = [];
  List<BookModel> topSellersList = [];

  Future<void> getEditorsChoiceList() async {
    try {
      editorsChoiceList =
          await ref.read(bookServicesProvider).getEditorsChoice();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}

final homePageVMProvider =
    ChangeNotifierProvider.autoDispose((ref) => HomePageVM(ref));

final editorsChoiceFutureProvider = FutureProvider<List<BookModel>>((ref) async {
  List<BookModel> editorsChoiceList = [];
  editorsChoiceList = await ref.read(bookServicesProvider).getEditorsChoice();
  return editorsChoiceList;
});
