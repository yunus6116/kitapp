import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/bootstrap.dart';
import 'package:kitapp/view/pages/main_page/home_page/utils/utils.dart';
import 'package:kitapp/view/shared/styles/theme.dart';
import 'package:kitapp/view/shared/widgets/focus_escape.dart';
import 'package:kitapp/view/shared/widgets/main_build.dart';

import 'core/global_constants/global_constants.dart';
import 'core/init/auth_manager/auth_manager.dart';
import 'core/routing/router_provider.dart';
import 'env.dart';

void main() async {
  bootstrap(() => const MyApp());
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateChangesStreamProvider = ref.watch(authStateChangesProvider);
    return authStateChangesStreamProvider.when(
      data: (_) => FocusEscape(
        child: MaterialApp.router(
          scaffoldMessengerKey: snackBarKey,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          color: Colors.green,
          routeInformationParser: ref.read(routerProvider).defaultRouteParser(),
          routerDelegate: ref.read(routerProvider).delegate(),
          debugShowCheckedModeBanner: false,
          scrollBehavior: NoGlowScrollBehavior(),
          theme: ThemeStyle.customThemeData(),
          title: Environment.appTitle,
          builder: MainBuild.build,
        ),
      ),
      error: (e, __) {
        debugPrint(e.toString());
        return const SizedBox();
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
