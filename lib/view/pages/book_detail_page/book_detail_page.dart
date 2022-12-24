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

class BookDetailPage extends StatefulHookConsumerWidget {
  final BookModel book;
  const BookDetailPage({required this.book, super.key});

  @override
  ConsumerState<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends ConsumerState<BookDetailPage> {
  late ScrollController _scrollController;
  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset >
            MediaQuery.of(context).size.height * .16 - kToolbarHeight;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener((() {
        setState(() {});
      }));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var releaseDate = widget.book.releaseDate != null
        ? widget.book.releaseDate!.toDate().formatDateUSA
        : 'Not Exist';
    final favouriteStatusProvider =
        ref.watch(bookFavouritesStatusProvider(widget.book));

    Future<void> onFavouriteIconClick(bool isFavourite) async {
      if (isFavourite) {
        await ref
            .read(bookDetailVMProvider)
            .removeBookFromFavourites(bookModel: widget.book);
      } else {
        await ref
            .read(bookDetailVMProvider)
            .addBookToFavourites(bookModel: widget.book);
      }
    }

    String bookName = widget.book.nameOfBook!.length > 20
        ? '${widget.book.nameOfBook!.substring(0, 18)}..'
        : widget.book.nameOfBook!;
    String author = widget.book.author!.length > 20
        ? '${widget.book.author!.substring(0, 18)}..'
        : widget.book.author!;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: false,
                pinned: true,
                expandedHeight: MediaQuery.of(context).size.height * .2,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  collapseMode: CollapseMode.pin,
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(bottom: _isAppBarExpanded ? 0 : 35),
                    decoration: BoxDecoration(
                      color: _isAppBarExpanded
                          ? Colors.transparent
                          : Colors.black.withOpacity(0.2),
                    ),
                    alignment: _isAppBarExpanded
                        ? Alignment.center
                        : Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: _isAppBarExpanded
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.end,
                      children: [
                        Text(
                          bookName,
                          style: AppTextStyles.heading6.copyWith(
                            color:
                                _isAppBarExpanded ? Colors.black : Colors.white,
                          ),
                        ),
                        !_isAppBarExpanded
                            ? Text(
                                author,
                                style: AppTextStyles.body9.copyWith(
                                  color: _isAppBarExpanded
                                      ? Colors.black
                                      : Colors.white,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                  background: CachedNetworkImage(
                    imageUrl: widget.book.coverImageUrl ?? '',
                    placeholder: (_, __) => ShimmerEffect(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                iconTheme: IconThemeData(
                    color: _isAppBarExpanded ? Colors.black : Colors.white),
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
                            color: isFavourite
                                ? AppColors.primary
                                : _isAppBarExpanded
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        );
                      }),
                ],
              ),
            ];
          }),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  // About Book
                  Text(
                    'About Book',
                    style: AppTextStyles.body6
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.book.aboutBook ?? '',
                    style: AppTextStyles.body9,
                  ),
                  const SizedBox(height: 16),
                  // Book Propertys
                  Text(
                    'Book Propertys',
                    style: AppTextStyles.body6
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 17),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        'Page: ',
                        style: AppTextStyles.body9
                            .copyWith(color: AppColors.primary),
                      ),
                      Text(
                        widget.book.pages != null
                            ? widget.book.pages.toString()
                            : 'Not Exist',
                        style: AppTextStyles.body9
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Language: ',
                        style: AppTextStyles.body9
                            .copyWith(color: AppColors.primary),
                      ),
                      Text(
                        widget.book.language ?? 'Not Exist',
                        style: AppTextStyles.body9
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Category: ',
                        style: AppTextStyles.body9
                            .copyWith(color: AppColors.primary),
                      ),
                      Text(
                        widget.book.category ?? 'Not Exist',
                        style: AppTextStyles.body9
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Release Date: ',
                        style: AppTextStyles.body9
                            .copyWith(color: AppColors.primary),
                      ),
                      Text(
                        releaseDate.toString(),
                        style: AppTextStyles.body9
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        'Star: ',
                        style: AppTextStyles.body9
                            .copyWith(color: AppColors.primary),
                      ),
                      Text(
                        widget.book.star != null
                            ? widget.book.star.toString()
                            : 'Not Exist',
                        style: AppTextStyles.body9
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Read the Book
                  CustomButton(
                    backgroundColor: AppColors.primary,
                    width: MediaQuery.of(context).size.width - 40,
                    buttonText: 'Read',
                    onPressed: () {
                      context.router.navigate(WebViewRoute(
                        url: widget.book.bookUrl ?? '',
                        heading: widget.book.nameOfBook ?? '',
                      ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
