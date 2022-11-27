import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'viewmodel/splash_viewmodel.dart';

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

    return const Scaffold();
  }
}
