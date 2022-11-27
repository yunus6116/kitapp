import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kitapp/view/pages/splash_page/viewmodel/splash_viewmodel.dart';

class SplashPage extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
