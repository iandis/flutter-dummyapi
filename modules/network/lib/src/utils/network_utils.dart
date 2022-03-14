import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkUtils {
  const NetworkUtils._();

  static Future<bool> get isConnected async {
    final ConnectivityResult result = await Connectivity().checkConnectivity();

    return result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi;
  }
}
