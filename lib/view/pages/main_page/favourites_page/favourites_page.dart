import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/main_page/favourites_page/widgets/books_grid_widget.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

import './viewmodel/favourites_page_viewmodel.dart';

class FavouritesPage extends StatefulHookConsumerWidget {
  @override
  ConsumerState<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends ConsumerState<FavouritesPage> {
  @override
  void initState() {
    super.initState();
    ref.read(favouritesPageVMProvider).getMyFavouriteBooksList();
  }

  @override
  Widget build(BuildContext context) {
    final myFavouriteBooksList =
        ref.watch(favouritesPageVMProvider).myFavouriteBooksList;

    return Scaffold(
      appBar: CustomAppBar(
        title: "My Favourite Books",
        primaryColor: AppColors.primary,
      ),
      body: BooksGridWidget(bookList: myFavouriteBooksList),
    );
  }
}
