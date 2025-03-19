import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';


class InternetConnectivityStatus extends GetxController {
  RxBool isConnected = true.obs;
  StreamController<bool> connectivityController = StreamController<bool>();
  bool? previousConnectionStatus;
  Timer? _timer;

  Future<void> checkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected.value = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      if (isConnected.value) {
      } else {
        isConnected.value = false;
      }
      if (isConnected.value != previousConnectionStatus) {
        connectivityController.add(isConnected.value);
        previousConnectionStatus = isConnected.value;
      }
    } on SocketException catch (_) {
      isConnected.value = false;
      if (previousConnectionStatus != false) {
        connectivityController.add(false);
        previousConnectionStatus = false;
      }
    }
  }

  void checkInternetConnectivity() {
    checkConnection();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      await checkConnection();
    });
  }

  void timerClose() {
    _timer?.cancel();
  }
}

bool _previousStatus = true;

class ConnectivityChecker {
  Stream<bool> timerStream =
      Stream.periodic(const Duration(milliseconds: 500), (_) {})
          .asyncMap((_) => _checkInternetAccess());

  static Future<bool> _checkInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  // void startChecking() {
  //   timerStream.listen((hasInternet) {
  //     if (!hasInternet && _previousStatus) {
  //       _previousStatus = false;
  //       Get.toNamed(RouteList.noInternet);
  //     } else if (hasInternet && !_previousStatus) {
  //       _previousStatus = true;
  //       if (Get.currentRoute == "/noInternet") {
  //         Get.back();
  //       }
  //     }
  //   });
  // }
}
