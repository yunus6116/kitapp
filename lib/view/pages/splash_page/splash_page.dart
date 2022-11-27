import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/splash_page/viewmodel/splash_viewmodel.dart';
import '../../../core/init/auth_manager/auth_manager.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/routing/router.gr.dart';

class SplashPage extends StatefulHookConsumerWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      ref.read(splashVMProvider).navigateUserAfterSplashDone(context);
      return null;
    }, []);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Image.asset('assets/png/splash.png'),
      ),
    );
  }
}
