import 'package:flutter/foundation.dart';

class Api {
  final String serverUrl;
  Api({required this.serverUrl});
  String login() {
    return "$serverUrl/login";
  }

  String updateTransaction() {
    return "$serverUrl/transaction";
  }
}

class Config {
  final Api _api = detectApi();

  Api getApi() {
    return _api;
  }
}

Api detectApi() {
  if (kReleaseMode) {
    // Môi trường sản xuất
    return Api(serverUrl: "https://epay-be-express.vercel.app");
  } else {
    // Môi trường phát triển
    return Api(serverUrl: "http://192.168.1.9:5000");
  }
}
