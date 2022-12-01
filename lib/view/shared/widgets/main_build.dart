import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/extensions/context_extensions.dart';

import '../../../core/init/connectivity_manager/network_status_service.dart';

class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Column(
      children: [
        Expanded(
          child: child ?? const SizedBox(),
        ),
        const NoNetworkWidget()
      ],
    );
  }
}

class NoNetworkWidget extends ConsumerWidget {
  const NoNetworkWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<NetWorkStatus>(
      initialData: NetWorkStatus.offline,
      stream: NetworkStatusServices().networkStatusController.stream,
      builder: (context, snapshot) {
        return AnimatedCrossFade(
          duration: const Duration(milliseconds: 500),
          crossFadeState: snapshot.data == NetWorkStatus.offline
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Container(
              height: context.dynamicHeight(0.06),
              color: context.theme.toggleableActiveColor,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: context.horizontalNormalPadding,
                      child: Text(
                        "No connection",
                        style: context.textTheme.headline6
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 0,
                      child: Padding(
                        padding: context.rightHorizontalLowPadding,
                        child: const Icon(
                            Icons.signal_wifi_connected_no_internet_4,
                            color: Colors.white),
                      ))
                ],
              )),
          secondChild: const SizedBox(),
        );
      },
    );
  }
}
