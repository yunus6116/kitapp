import 'package:flutter/material.dart';

import '../../../../../core/global_models/book_model/book_model.dart';
import '../../../../shared/widgets/book_card_widget.dart';

class BooksGridWidget extends StatelessWidget {
  const BooksGridWidget({
    Key? key,
    required this.bookList,
  }) : super(key: key);

  final List<BookModel> bookList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: bookList.length,
          itemBuilder: ((context, index) {
            return BookCardWidget(bookModel: bookList[index]);
          }),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
