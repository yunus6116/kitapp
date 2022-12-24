import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/core/extensions/date_extensions.dart';
import 'package:kitapp/core/global_models/book_model/book_model.dart';
import 'package:kitapp/core/routing/router.gr.dart';
import 'package:kitapp/view/pages/book_detail_page/viewmodel/book_detail_viewmodel.dart';
import 'package:kitapp/view/shared/styles/colors.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import 'package:kitapp/view/shared/widgets/base_async_provider.dart';
import 'package:kitapp/view/shared/widgets/custom_button.dart';

import '../../shared/widgets/shimmers/shimmer_effect.dart';

class BookDetailPage extends HookConsumerWidget {
  final BookModel book;
  const BookDetailPage({required this.book, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var releaseDate = book.releaseDate != null
        ? book.releaseDate!.toDate().formatDateUSA
        : DateTime.now();
    final favouriteStatusProvider =
        ref.watch(bookFavouritesStatusProvider(book.id!));

    Future<void> onFavouriteIconClick(bool isFavourite) async {
      if (isFavourite) {
        await ref
            .read(bookDetailVMProvider)
            .removeBookFromFavourites(bookModel: book);
      } else {
        await ref
            .read(bookDetailVMProvider)
            .addBookToFavourites(bookModel: book);
      }
    }

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: ((context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * .2,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                collapseMode: CollapseMode.pin,
                title: Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Text(
                      '${book.nameOfBook}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.whiteButtonColor,
                      ),
                    ),
                  ),
                ),
                background: CachedNetworkImage(
                  imageUrl: book.coverImageUrl ?? '',
                  placeholder: (_, __) => ShimmerEffect(
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
              actions: [
                BaseAsyncProvider(
                    value: favouriteStatusProvider,
                    builder: (bool isFavourite) {
                      return IconButton(
                        onPressed: () => onFavouriteIconClick(isFavourite),
                        icon: Icon(
                          isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: isFavourite ? AppColors.primary : Colors.white,
                        ),
                      );
                    }),
              ],
            ),
          ];
        }),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              // About Book
              Text(
                'About Book',
                style:
                    AppTextStyles.body6.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                book.aboutBook ?? '',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 16),
              // Book Propertys
              Text(
                'Book Propertys',
                style:
                    AppTextStyles.body6.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(
                'Page: ${book.pages}',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 4),
              Text(
                'Language: ${book.language}',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 4),
              Text(
                'Category: ${book.category}',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 4),
              Text(
                'Release Date: $releaseDate',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 4),
              Text(
                'Star: ${book.star}',
                style: AppTextStyles.body9,
              ),
              const SizedBox(height: 32),
              // Read the Book
              CustomButton(
                backgroundColor: AppColors.primary,
                width: MediaQuery.of(context).size.width - 40,
                buttonText: 'Read',
                onPressed: () {
                  context.router.navigate(WebViewRoute(
                    url: book.bookUrl ?? '',
                    heading: book.nameOfBook ?? '',
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
