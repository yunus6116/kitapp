import 'package:flutter/material.dart';

import '../../../../../core/global_models/book_model/book_model.dart';
import '../../../../shared/widgets/book_card_widget.dart';

class BooksGridWidget extends StatelessWidget {
  const BooksGridWidget({
    Key? key,
    required this.bookList,
    this.isBookCategoryPage = false,
  }) : super(key: key);

  final List<BookModel> bookList;
  final bool isBookCategoryPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 12),
          GridView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: bookList.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: ((context, index) {
              return BookCardWidget(
                bookModel: bookList[index],
                isBookCategoryPage: isBookCategoryPage,
              );
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 24.0,
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
