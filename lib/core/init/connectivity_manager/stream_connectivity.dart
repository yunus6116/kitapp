import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

final connectivityFutureProvider =
    FutureProvider.autoDispose<ConnectivityResult>((ref) => Connectivity().checkConnectivity());
final onConnectionSateChanegeStreamProvider = StreamProvider((ref) => Connectivity().onConnectivityChanged);
