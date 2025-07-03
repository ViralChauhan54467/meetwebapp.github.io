import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter/foundation.dart';

void printLog(String message) {
  if (kDebugMode) {
    log(message);
  }
}

class Utils {

  Future<bool> isNetworkConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}