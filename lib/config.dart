import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

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
    return Api(serverUrl: "https://epay-be-express.vercel.app");
  } else {
    return Api(serverUrl: "http://192.168.1.9:5000");
  }
}

String detectSocketServer() {
  if (kReleaseMode) {
    return "https://epay-be-express.vercel.app";
  } else {
    return "http://192.168.1.9:5000";
  }
}

String detectCurrency(String money) {
  NumberFormat currencyFormat = NumberFormat.currency(
    symbol: '\$', // Ký hiệu tiền tệ
    decimalDigits: 2, // Số chữ số thập phân
    locale: 'en_US', // Ngôn ngữ và định dạng quốc gia
  );

  return currencyFormat.format(double.parse(money));
}
