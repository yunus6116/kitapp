import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/splash_page/viewmodel/splash_viewmodel.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashPage extends StatefulHookConsumerWidget {
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/png/splash.png'), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
