import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import 'package:kitapp/view/shared/widgets/shimmers/shimmer_effect.dart';

import '../../../core/global_models/book_model/book_model.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class BookCardWidget extends StatelessWidget {
  const BookCardWidget({
    Key? key,
    required this.bookModel,
    this.isBookCategoryPage = false,
  }) : super(key: key);

  final BookModel bookModel;
  final bool isBookCategoryPage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.navigate(BookDetailRoute(book: bookModel));
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 4),
            height: MediaQuery.of(context).size.height * .15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: bookModel.coverImageUrl ?? '',
                  placeholder: (_, __) => ShimmerEffect(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  imageBuilder: (_, imageLink) {
                    return Material(
                      type: MaterialType.transparency,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width * .3,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(149, 149, 149, .25),
                                offset: Offset(0, 0),
                                blurRadius: 2,
                              )
                            ],
                            color: Colors.white,
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                bookModel.coverImageUrl ?? '',
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: isBookCategoryPage
                                ? const SizedBox.shrink()
                                : Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4.0),
                                      child: Text(
                                        bookModel.category ?? 'Category',
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.body8
                                            .copyWith(color: Colors.white),
                                      ),
                                    )),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            bookModel.nameOfBook!.length > 20
                ? '${bookModel.nameOfBook!.substring(0, 18)}..'
                : bookModel.nameOfBook!,
            style: AppTextStyles.body9,
          ),
          const SizedBox(height: 2),
          Text(
            bookModel.author!.length > 20
                ? '${bookModel.author!.substring(0, 18)}..'
                : bookModel.author!,
            style: AppTextStyles.body8.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
