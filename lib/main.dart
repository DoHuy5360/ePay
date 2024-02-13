import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'views/loading.dart';
import 'views/login.dart';
import 'views/layouts/main.dart';
import 'views/layouts/head.dart';

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
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/login',
    routes: {
      '/loading': (context) => const LoadingView(),
      '/login': (context) => const LoginView(),
      '/home': (context) => const MainLayout(),
    },
  ));
}
