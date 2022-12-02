// ignore_for_file: depend_on_referenced_packages

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityFutureProvider =
    FutureProvider.autoDispose<ConnectivityResult>(
        (ref) => Connectivity().checkConnectivity());
final onConnectionSateChanegeStreamProvider =
    StreamProvider((ref) => Connectivity().onConnectivityChanged);
