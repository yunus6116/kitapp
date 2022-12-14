import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/main_page/home_page/viewmodel/home_page_viewmodel.dart';
import 'package:kitapp/view/pages/main_page/home_page/widgets/banner_slider_widget.dart';
import 'package:kitapp/view/pages/main_page/home_page/widgets/books_list_widget.dart';
import 'package:kitapp/view/shared/styles/text_styles.dart';
import '../../../shared/widgets/custom_appbar.dart';

class HomePage extends StatefulHookConsumerWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(homePageVMProvider).getEditorsChoiceList();
    ref.read(homePageVMProvider).getTopSellersList();
  }

  @override
  Widget build(BuildContext context) {
    final sliderList = ref.read(homePageVMProvider).sliderList;
    final editorsChoiceList = ref.watch(homePageVMProvider).editorsChoiceList;
    final topSellersList = ref.watch(homePageVMProvider).topSellersList;

    return Scaffold(
      appBar: _buildAppbar(),
      body: Column(
        children: [
          // Banner
          BannerSliderWidget(sliderList: sliderList),
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Editor's Choice
                    BooksListWidget(
                      editorsChoiceList: editorsChoiceList,
                      title: 'Editor\'s Choice',
                    ),
                    // Top Sellers
                    BooksListWidget(
                      editorsChoiceList: topSellersList,
                      title: 'Top Sellers',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      titleWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/app_logo.svg'),
          const SizedBox(width: 8),
          Text(
            'KITAPP',
            style: AppTextStyles.heading7,
          )
        ],
      ),
    );
  }
}
