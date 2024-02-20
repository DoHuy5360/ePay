import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Response;

class Request {
  static Future<Response> get(String uri) async {
    return await http.get(Uri.parse(uri));
  }

  static Future<Response> post(String uri, Object? body) async {
    return await http.post(Uri.parse(uri), body: body);
  }
}
