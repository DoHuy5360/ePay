import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'views/loading.dart';
import 'views/login.dart';
import 'views/transaction.dart';
import 'views/order.dart';
import 'views/layouts/main.dart';
import 'views/layouts/head.dart';
import 'config.dart';

Future<String> fetchData() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Xử lý dữ liệu khi nhận được phản hồi thành công
    return response.body;
  } else {
    // Xử lý lỗi nếu có
    return 'Yêu cầu không thành công. Mã lỗi: ${response.statusCode}';
  }
}

void main() async {
  final Config config = Config();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "ePay",
    theme: ThemeData(
        colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.white,
      secondary: Color.fromARGB(255, 84, 142, 239),
      tertiary: Colors.black,
      surface: Color.fromARGB(255, 149, 13, 227),
      background: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Color.fromARGB(255, 144, 1, 58),
    )),
    initialRoute: '/login',
    routes: {
      '/loading': (context) => const LoadingView(),
      '/login': (context) => LoginView(
            config: config,
          ),
      '/home': (context) => const MainLayout(),
      '/transaction': (context) => const HeadLayout(
            title: "Transaction",
            view: Transaction(),
          ),
      '/order': (context) => const Order()
    },
  ));
}
