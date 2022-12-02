import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetWorkStatus { online, offline }

class NetworkStatusServices {
  StreamController<NetWorkStatus> networkStatusController =
      StreamController<NetWorkStatus>();
  NetworkStatusServices() {
    Connectivity().onConnectivityChanged.listen((event) {
      networkStatusController.add(getNetworkStatus(event));
    });
  }
  NetWorkStatus getNetworkStatus(ConnectivityResult connectivityResult) =>
      connectivityResult == ConnectivityResult.mobile ||
              connectivityResult == ConnectivityResult.wifi
          ? NetWorkStatus.online
          : NetWorkStatus.offline;
}
