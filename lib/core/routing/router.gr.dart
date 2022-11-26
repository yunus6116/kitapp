// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i33;
import 'package:auto_route/empty_router_widgets.dart' as _i28;
import 'package:chiara/core/global_models/contract_model.dart' as _i41;
import 'package:chiara/core/global_models/public_user_model.dart' as _i38;
import 'package:chiara/ui/pages/add_product_page/add_product_page.dart' as _i23;
import 'package:chiara/ui/pages/contract_detail_page/contract_detail_page.dart'
    as _i20;
import 'package:chiara/ui/pages/filter_page/filter_page.dart' as _i13;
import 'package:chiara/ui/pages/filter_page/model/filter_model.dart' as _i35;
import 'package:chiara/ui/pages/forgot_password_page/forgot_password_page.dart'
    as _i7;
import 'package:chiara/ui/pages/get_phone_number_page/get_phone_number_page.dart'
    as _i10;
import 'package:chiara/ui/pages/home_page/home_page.dart' as _i29;
import 'package:chiara/ui/pages/home_page/model/product_model.dart' as _i39;
import 'package:chiara/ui/pages/introduction_page/introduction_main_page.dart'
    as _i12;
import 'package:chiara/ui/pages/introduction_page/introduction_page.dart'
    as _i4;
import 'package:chiara/ui/pages/location_picker_page/location_picker_page.dart'
    as _i24;
import 'package:chiara/ui/pages/location_picker_page/model/location_picker_result_model.dart'
    as _i36;
import 'package:chiara/ui/pages/main_page/main_page.dart' as _i2;
import 'package:chiara/ui/pages/message_detail_page/message_detail_page.dart'
    as _i16;
import 'package:chiara/ui/pages/messages_page/messages_page.dart' as _i30;
import 'package:chiara/ui/pages/messages_page/model/messages_thread.dart'
    as _i40;
import 'package:chiara/ui/pages/my_contracts_page/my_contracts_page.dart'
    as _i19;
import 'package:chiara/ui/pages/my_favorites_page/my_favorites_page.dart'
    as _i18;
import 'package:chiara/ui/pages/my_profile_page/my_profile_page.dart' as _i32;
import 'package:chiara/ui/pages/notifications/notifications.dart' as _i31;
import 'package:chiara/ui/pages/product_detail_page/product_detail_page.dart'
    as _i14;
import 'package:chiara/ui/pages/profile_page/profile_page.dart' as _i3;
import 'package:chiara/ui/pages/profile_settings_page/model/name_model.dart'
    as _i37;
import 'package:chiara/ui/pages/profile_settings_page/profile_settings_page.dart'
    as _i17;
import 'package:chiara/ui/pages/profile_settings_page/sub_pages/change_bio_page.dart'
    as _i27;
import 'package:chiara/ui/pages/profile_settings_page/sub_pages/change_mail_page.dart'
    as _i26;
import 'package:chiara/ui/pages/profile_settings_page/sub_pages/change_name_page.dart'
    as _i25;
import 'package:chiara/ui/pages/report_product_page/report_product_page.dart'
    as _i22;
import 'package:chiara/ui/pages/settings_page/setttings_page.dart' as _i15;
import 'package:chiara/ui/pages/sign_in_page/sign_in_page.dart' as _i5;
import 'package:chiara/ui/pages/sign_up_page/sign_up_page.dart' as _i6;
import 'package:chiara/ui/pages/splash_page/splash_page.dart' as _i1;
import 'package:chiara/ui/pages/verify_code_page/verify_code_page.dart' as _i9;
import 'package:chiara/ui/pages/verify_code_with_email_page/verify_code_with_email_page.dart'
    as _i8;
import 'package:chiara/ui/pages/verify_completed_page/verify_completed_page.dart'
    as _i11;
import 'package:chiara/ui/shared/widgets/photo_view.dart' as _i21;
import 'package:flutter/material.dart' as _i34;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i42;

class AppRouter extends _i33.RootStackRouter {
  AppRouter([_i34.GlobalKey<_i34.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.SplashPage());
    },
    MainRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.MainPage());
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.ProfilePage(user: args.user));
    },
    IntroductionRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.IntroductionPage());
    },
    SignInRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.SignInPage());
    },
    SignUpRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.SignUpPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.ForgotPasswordPage());
    },
    VerifyCodeWithEmailRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.VerifyCodeWithEmailPage());
    },
    VerifyCodeRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyCodeRouteArgs>(
          orElse: () => const VerifyCodeRouteArgs());
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i9.VerifyCodePage(isSocialAccount: args.isSocialAccount));
    },
    GetPhoneNumberRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i10.GetPhoneNumberPage());
    },
    VerifyCompletedRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i11.VerifyCompletedPage());
    },
    IntroductionMainRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i12.IntroductionMainPage());
    },
    FilterRoute.name: (routeData) {
      return _i33.AdaptivePage<_i35.FilterModel?>(
          routeData: routeData, child: const _i13.FilterPage());
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>(
          orElse: () => const ProductDetailRouteArgs());
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i14.ProductDetailPage(
              index: args.index,
              productModel: args.productModel,
              isAddOrUpdate: args.isAddOrUpdate));
    },
    SettingsRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i15.SettingsPage());
    },
    MessageDetailRoute.name: (routeData) {
      final args = routeData.argsAs<MessageDetailRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.MessageDetailPage(
              messageThread: args.messageThread,
              isNewThread: args.isNewThread,
              messageThreadId: args.messageThreadId));
    },
    ProfileSettingsRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.ProfileSettingsPage());
    },
    MyFavoritesRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i18.MyFavoritesPage());
    },
    MyContractsRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i19.MyContractsPage());
    },
    ContractDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ContractDetailRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.ContractDetailPage(contract: args.contract));
    },
    PhotoViewRoute.name: (routeData) {
      final args = routeData.argsAs<PhotoViewRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i21.PhotoView(imagePath: args.imagePath));
    },
    ReportProductRoute.name: (routeData) {
      final args = routeData.argsAs<ReportProductRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i22.ReportProductPage(productModel: args.productModel));
    },
    AddProductRoute.name: (routeData) {
      final args = routeData.argsAs<AddProductRouteArgs>(
          orElse: () => const AddProductRouteArgs());
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i23.AddProductPage(
              isEdit: args.isEdit, productModel: args.productModel));
    },
    LocationPickerRoute.name: (routeData) {
      final args = routeData.argsAs<LocationPickerRouteArgs>(
          orElse: () => const LocationPickerRouteArgs());
      return _i33.AdaptivePage<_i36.LocationPickerResultModel>(
          routeData: routeData,
          child: _i24.LocationPickerPage(
              initialPosition: args.initialPosition,
              showRange: args.showRange));
    },
    ChangeNameRoute.name: (routeData) {
      return _i33.AdaptivePage<_i37.NameModel>(
          routeData: routeData, child: _i25.ChangeNamePage());
    },
    ChangeMailRoute.name: (routeData) {
      return _i33.AdaptivePage<String>(
          routeData: routeData, child: _i26.ChangeMailPage());
    },
    ChangeBioRoute.name: (routeData) {
      final args = routeData.argsAs<ChangeBioRouteArgs>(
          orElse: () => const ChangeBioRouteArgs());
      return _i33.AdaptivePage<String>(
          routeData: routeData,
          child: _i27.ChangeBioPage(fromProfile: args.fromProfile));
    },
    HomeTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.EmptyRouterPage());
    },
    MessagesTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.EmptyRouterPage());
    },
    NotificationsTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.EmptyRouterPage());
    },
    MyProfileTabRouter.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i28.EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i29.HomePage());
    },
    MessagesRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i30.MessagesPage());
    },
    NotificationsRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i31.NotificationsPage());
    },
    MyProfileRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
          routeData: routeData, child: _i32.MyProfilePage());
    }
  };

  @override
  List<_i33.RouteConfig> get routes => [
        _i33.RouteConfig(SplashRoute.name, path: '/'),
        _i33.RouteConfig(MainRoute.name, path: '/main-page', children: [
          _i33.RouteConfig(HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              children: [
                _i33.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeTabRouter.name)
              ]),
          _i33.RouteConfig(MessagesTabRouter.name,
              path: 'messages-tab',
              parent: MainRoute.name,
              children: [
                _i33.RouteConfig(MessagesRoute.name,
                    path: '', parent: MessagesTabRouter.name)
              ]),
          _i33.RouteConfig(NotificationsTabRouter.name,
              path: 'notifications-tab',
              parent: MainRoute.name,
              children: [
                _i33.RouteConfig(NotificationsRoute.name,
                    path: '', parent: NotificationsTabRouter.name)
              ]),
          _i33.RouteConfig(MyProfileTabRouter.name,
              path: 'my-profile-tab',
              parent: MainRoute.name,
              children: [
                _i33.RouteConfig(MyProfileRoute.name,
                    path: '', parent: MyProfileTabRouter.name)
              ])
        ]),
        _i33.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i33.RouteConfig(IntroductionRoute.name, path: '/introduction-page'),
        _i33.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i33.RouteConfig(SignUpRoute.name, path: '/sign-up-page'),
        _i33.RouteConfig(ForgotPasswordRoute.name,
            path: '/forgot-password-page'),
        _i33.RouteConfig(VerifyCodeWithEmailRoute.name,
            path: '/verify-code-with-email-page'),
        _i33.RouteConfig(VerifyCodeRoute.name, path: '/verify-code-page'),
        _i33.RouteConfig(GetPhoneNumberRoute.name,
            path: '/get-phone-number-page'),
        _i33.RouteConfig(VerifyCompletedRoute.name,
            path: '/verify-completed-page'),
        _i33.RouteConfig(IntroductionMainRoute.name,
            path: '/introduction-main-page'),
        _i33.RouteConfig(FilterRoute.name, path: '/filter-page'),
        _i33.RouteConfig(ProductDetailRoute.name, path: '/product-detail-page'),
        _i33.RouteConfig(SettingsRoute.name, path: '/settings-page'),
        _i33.RouteConfig(MessageDetailRoute.name, path: '/message-detail-page'),
        _i33.RouteConfig(ProfileSettingsRoute.name,
            path: '/profile-settings-page'),
        _i33.RouteConfig(MyFavoritesRoute.name, path: '/my-favorites-page'),
        _i33.RouteConfig(MyContractsRoute.name, path: '/my-contracts-page'),
        _i33.RouteConfig(ContractDetailRoute.name,
            path: '/contract-detail-page'),
        _i33.RouteConfig(PhotoViewRoute.name, path: '/photo-view'),
        _i33.RouteConfig(ReportProductRoute.name, path: '/report-product-page'),
        _i33.RouteConfig(AddProductRoute.name, path: '/add-product-page'),
        _i33.RouteConfig(LocationPickerRoute.name,
            path: '/location-picker-page'),
        _i33.RouteConfig(ChangeNameRoute.name, path: '/change-name-page'),
        _i33.RouteConfig(ChangeMailRoute.name, path: '/change-mail-page'),
        _i33.RouteConfig(ChangeBioRoute.name, path: '/change-bio-page')
      ];
}

/// generated route for
/// [_i1.SplashPage]
class SplashRoute extends _i33.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.MainPage]
class MainRoute extends _i33.PageRouteInfo<void> {
  const MainRoute({List<_i33.PageRouteInfo>? children})
      : super(MainRoute.name, path: '/main-page', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [_i3.ProfilePage]
class ProfileRoute extends _i33.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({required _i38.PublicUser? user})
      : super(ProfileRoute.name,
            path: '/profile-page', args: ProfileRouteArgs(user: user));

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({required this.user});

  final _i38.PublicUser? user;

  @override
  String toString() {
    return 'ProfileRouteArgs{user: $user}';
  }
}

/// generated route for
/// [_i4.IntroductionPage]
class IntroductionRoute extends _i33.PageRouteInfo<void> {
  const IntroductionRoute()
      : super(IntroductionRoute.name, path: '/introduction-page');

  static const String name = 'IntroductionRoute';
}

/// generated route for
/// [_i5.SignInPage]
class SignInRoute extends _i33.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpRoute extends _i33.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '/sign-up-page');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i7.ForgotPasswordPage]
class ForgotPasswordRoute extends _i33.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i8.VerifyCodeWithEmailPage]
class VerifyCodeWithEmailRoute extends _i33.PageRouteInfo<void> {
  const VerifyCodeWithEmailRoute()
      : super(VerifyCodeWithEmailRoute.name,
            path: '/verify-code-with-email-page');

  static const String name = 'VerifyCodeWithEmailRoute';
}

/// generated route for
/// [_i9.VerifyCodePage]
class VerifyCodeRoute extends _i33.PageRouteInfo<VerifyCodeRouteArgs> {
  VerifyCodeRoute({bool isSocialAccount = false})
      : super(VerifyCodeRoute.name,
            path: '/verify-code-page',
            args: VerifyCodeRouteArgs(isSocialAccount: isSocialAccount));

  static const String name = 'VerifyCodeRoute';
}

class VerifyCodeRouteArgs {
  const VerifyCodeRouteArgs({this.isSocialAccount = false});

  final bool isSocialAccount;

  @override
  String toString() {
    return 'VerifyCodeRouteArgs{isSocialAccount: $isSocialAccount}';
  }
}

/// generated route for
/// [_i10.GetPhoneNumberPage]
class GetPhoneNumberRoute extends _i33.PageRouteInfo<void> {
  const GetPhoneNumberRoute()
      : super(GetPhoneNumberRoute.name, path: '/get-phone-number-page');

  static const String name = 'GetPhoneNumberRoute';
}

/// generated route for
/// [_i11.VerifyCompletedPage]
class VerifyCompletedRoute extends _i33.PageRouteInfo<void> {
  const VerifyCompletedRoute()
      : super(VerifyCompletedRoute.name, path: '/verify-completed-page');

  static const String name = 'VerifyCompletedRoute';
}

/// generated route for
/// [_i12.IntroductionMainPage]
class IntroductionMainRoute extends _i33.PageRouteInfo<void> {
  const IntroductionMainRoute()
      : super(IntroductionMainRoute.name, path: '/introduction-main-page');

  static const String name = 'IntroductionMainRoute';
}

/// generated route for
/// [_i13.FilterPage]
class FilterRoute extends _i33.PageRouteInfo<void> {
  const FilterRoute() : super(FilterRoute.name, path: '/filter-page');

  static const String name = 'FilterRoute';
}

/// generated route for
/// [_i14.ProductDetailPage]
class ProductDetailRoute extends _i33.PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute(
      {int? index, _i39.ProductModel? productModel, bool? isAddOrUpdate})
      : super(ProductDetailRoute.name,
            path: '/product-detail-page',
            args: ProductDetailRouteArgs(
                index: index,
                productModel: productModel,
                isAddOrUpdate: isAddOrUpdate));

  static const String name = 'ProductDetailRoute';
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs(
      {this.index, this.productModel, this.isAddOrUpdate});

  final int? index;

  final _i39.ProductModel? productModel;

  final bool? isAddOrUpdate;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{index: $index, productModel: $productModel, isAddOrUpdate: $isAddOrUpdate}';
  }
}

/// generated route for
/// [_i15.SettingsPage]
class SettingsRoute extends _i33.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i16.MessageDetailPage]
class MessageDetailRoute extends _i33.PageRouteInfo<MessageDetailRouteArgs> {
  MessageDetailRoute(
      {required _i40.MessageThread messageThread,
      bool isNewThread = false,
      String? messageThreadId})
      : super(MessageDetailRoute.name,
            path: '/message-detail-page',
            args: MessageDetailRouteArgs(
                messageThread: messageThread,
                isNewThread: isNewThread,
                messageThreadId: messageThreadId));

  static const String name = 'MessageDetailRoute';
}

class MessageDetailRouteArgs {
  const MessageDetailRouteArgs(
      {required this.messageThread,
      this.isNewThread = false,
      this.messageThreadId});

  final _i40.MessageThread messageThread;

  final bool isNewThread;

  final String? messageThreadId;

  @override
  String toString() {
    return 'MessageDetailRouteArgs{messageThread: $messageThread, isNewThread: $isNewThread, messageThreadId: $messageThreadId}';
  }
}

/// generated route for
/// [_i17.ProfileSettingsPage]
class ProfileSettingsRoute extends _i33.PageRouteInfo<void> {
  const ProfileSettingsRoute()
      : super(ProfileSettingsRoute.name, path: '/profile-settings-page');

  static const String name = 'ProfileSettingsRoute';
}

/// generated route for
/// [_i18.MyFavoritesPage]
class MyFavoritesRoute extends _i33.PageRouteInfo<void> {
  const MyFavoritesRoute()
      : super(MyFavoritesRoute.name, path: '/my-favorites-page');

  static const String name = 'MyFavoritesRoute';
}

/// generated route for
/// [_i19.MyContractsPage]
class MyContractsRoute extends _i33.PageRouteInfo<void> {
  const MyContractsRoute()
      : super(MyContractsRoute.name, path: '/my-contracts-page');

  static const String name = 'MyContractsRoute';
}

/// generated route for
/// [_i20.ContractDetailPage]
class ContractDetailRoute extends _i33.PageRouteInfo<ContractDetailRouteArgs> {
  ContractDetailRoute({required _i41.Contract contract})
      : super(ContractDetailRoute.name,
            path: '/contract-detail-page',
            args: ContractDetailRouteArgs(contract: contract));

  static const String name = 'ContractDetailRoute';
}

class ContractDetailRouteArgs {
  const ContractDetailRouteArgs({required this.contract});

  final _i41.Contract contract;

  @override
  String toString() {
    return 'ContractDetailRouteArgs{contract: $contract}';
  }
}

/// generated route for
/// [_i21.PhotoView]
class PhotoViewRoute extends _i33.PageRouteInfo<PhotoViewRouteArgs> {
  PhotoViewRoute({required String imagePath})
      : super(PhotoViewRoute.name,
            path: '/photo-view',
            args: PhotoViewRouteArgs(imagePath: imagePath));

  static const String name = 'PhotoViewRoute';
}

class PhotoViewRouteArgs {
  const PhotoViewRouteArgs({required this.imagePath});

  final String imagePath;

  @override
  String toString() {
    return 'PhotoViewRouteArgs{imagePath: $imagePath}';
  }
}

/// generated route for
/// [_i22.ReportProductPage]
class ReportProductRoute extends _i33.PageRouteInfo<ReportProductRouteArgs> {
  ReportProductRoute({required _i39.ProductModel productModel})
      : super(ReportProductRoute.name,
            path: '/report-product-page',
            args: ReportProductRouteArgs(productModel: productModel));

  static const String name = 'ReportProductRoute';
}

class ReportProductRouteArgs {
  const ReportProductRouteArgs({required this.productModel});

  final _i39.ProductModel productModel;

  @override
  String toString() {
    return 'ReportProductRouteArgs{productModel: $productModel}';
  }
}

/// generated route for
/// [_i23.AddProductPage]
class AddProductRoute extends _i33.PageRouteInfo<AddProductRouteArgs> {
  AddProductRoute({bool isEdit = false, _i39.ProductModel? productModel})
      : super(AddProductRoute.name,
            path: '/add-product-page',
            args: AddProductRouteArgs(
                isEdit: isEdit, productModel: productModel));

  static const String name = 'AddProductRoute';
}

class AddProductRouteArgs {
  const AddProductRouteArgs({this.isEdit = false, this.productModel});

  final bool isEdit;

  final _i39.ProductModel? productModel;

  @override
  String toString() {
    return 'AddProductRouteArgs{isEdit: $isEdit, productModel: $productModel}';
  }
}

/// generated route for
/// [_i24.LocationPickerPage]
class LocationPickerRoute extends _i33.PageRouteInfo<LocationPickerRouteArgs> {
  LocationPickerRoute({_i42.LatLng? initialPosition, bool showRange = false})
      : super(LocationPickerRoute.name,
            path: '/location-picker-page',
            args: LocationPickerRouteArgs(
                initialPosition: initialPosition, showRange: showRange));

  static const String name = 'LocationPickerRoute';
}

class LocationPickerRouteArgs {
  const LocationPickerRouteArgs({this.initialPosition, this.showRange = false});

  final _i42.LatLng? initialPosition;

  final bool showRange;

  @override
  String toString() {
    return 'LocationPickerRouteArgs{initialPosition: $initialPosition, showRange: $showRange}';
  }
}

/// generated route for
/// [_i25.ChangeNamePage]
class ChangeNameRoute extends _i33.PageRouteInfo<void> {
  const ChangeNameRoute()
      : super(ChangeNameRoute.name, path: '/change-name-page');

  static const String name = 'ChangeNameRoute';
}

/// generated route for
/// [_i26.ChangeMailPage]
class ChangeMailRoute extends _i33.PageRouteInfo<void> {
  const ChangeMailRoute()
      : super(ChangeMailRoute.name, path: '/change-mail-page');

  static const String name = 'ChangeMailRoute';
}

/// generated route for
/// [_i27.ChangeBioPage]
class ChangeBioRoute extends _i33.PageRouteInfo<ChangeBioRouteArgs> {
  ChangeBioRoute({bool fromProfile = false})
      : super(ChangeBioRoute.name,
            path: '/change-bio-page',
            args: ChangeBioRouteArgs(fromProfile: fromProfile));

  static const String name = 'ChangeBioRoute';
}

class ChangeBioRouteArgs {
  const ChangeBioRouteArgs({this.fromProfile = false});

  final bool fromProfile;

  @override
  String toString() {
    return 'ChangeBioRouteArgs{fromProfile: $fromProfile}';
  }
}

/// generated route for
/// [_i28.EmptyRouterPage]
class HomeTabRouter extends _i33.PageRouteInfo<void> {
  const HomeTabRouter({List<_i33.PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home-tab', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class MessagesTabRouter extends _i33.PageRouteInfo<void> {
  const MessagesTabRouter({List<_i33.PageRouteInfo>? children})
      : super(MessagesTabRouter.name,
            path: 'messages-tab', initialChildren: children);

  static const String name = 'MessagesTabRouter';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class NotificationsTabRouter extends _i33.PageRouteInfo<void> {
  const NotificationsTabRouter({List<_i33.PageRouteInfo>? children})
      : super(NotificationsTabRouter.name,
            path: 'notifications-tab', initialChildren: children);

  static const String name = 'NotificationsTabRouter';
}

/// generated route for
/// [_i28.EmptyRouterPage]
class MyProfileTabRouter extends _i33.PageRouteInfo<void> {
  const MyProfileTabRouter({List<_i33.PageRouteInfo>? children})
      : super(MyProfileTabRouter.name,
            path: 'my-profile-tab', initialChildren: children);

  static const String name = 'MyProfileTabRouter';
}

/// generated route for
/// [_i29.HomePage]
class HomeRoute extends _i33.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i30.MessagesPage]
class MessagesRoute extends _i33.PageRouteInfo<void> {
  const MessagesRoute() : super(MessagesRoute.name, path: '');

  static const String name = 'MessagesRoute';
}

/// generated route for
/// [_i31.NotificationsPage]
class NotificationsRoute extends _i33.PageRouteInfo<void> {
  const NotificationsRoute() : super(NotificationsRoute.name, path: '');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i32.MyProfilePage]
class MyProfileRoute extends _i33.PageRouteInfo<void> {
  const MyProfileRoute() : super(MyProfileRoute.name, path: '');

  static const String name = 'MyProfileRoute';
}
