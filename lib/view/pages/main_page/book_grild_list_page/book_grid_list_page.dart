import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/context_extensions.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';

import '../../../../core/global_models/book_model/book_model.dart';
import 'viewmodel/book_grid_list_viewmodel.dart';
import 'widgets/books_grid_widget.dart';

class BookGridListPage extends StatefulHookConsumerWidget {
  final List<BookModel>? bookList;
  final String title;
  const BookGridListPage({
    required this.title,
    this.bookList,
  });
  @override
  ConsumerState<BookGridListPage> createState() => _BookGridListPageState();
}

class _BookGridListPageState extends ConsumerState<BookGridListPage> {
  @override
  void initState() {
    super.initState();
    if (widget.bookList == null) {
      ref.read(bookGridListVMProvider).getMyFavouriteBooksList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final myFavouriteBooksList =
        ref.watch(bookGridListVMProvider).myFavouriteBooksList;

    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        primaryColor: AppColors.primary,
        titleStyle: context.textTheme.headline6!.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: AppColors.primary),
      ),
      body: BooksGridWidget(
          bookList: widget.bookList ?? myFavouriteBooksList,
          isBookCategoryPage: widget.bookList != null ? true : false),
    );
  }
}
