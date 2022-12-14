import 'package:flutter/material.dart';

import '../../../../../core/global_models/book_model/book_model.dart';
import '../../../../shared/styles/text_styles.dart';
import '../../../../shared/widgets/book_card_widget.dart';
import '../../../../shared/widgets/shimmers/shimmer_effect.dart';

class BooksListWidget extends StatelessWidget {
  const BooksListWidget({
    Key? key,
    required this.editorsChoiceList,
    this.title,
  }) : super(key: key);

  final List<BookModel> editorsChoiceList;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 12),
        if (title != null) Text(title!, style: AppTextStyles.heading6),
        if (title != null) const SizedBox(height: 12),
        editorsChoiceList.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ShimmerEffect(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4),
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.width * .3,
                            color: Colors.white,
                          );
                        }))),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * .2,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: editorsChoiceList.length,
                    itemBuilder: ((context, index) {
                      return BookCardWidget(
                          bookModel: editorsChoiceList[index]);
                    })),
              ),
        const SizedBox(height: 12),
      ],
    );
  }
}
