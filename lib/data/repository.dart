import 'dart:convert';
import 'package:http/http.dart';

class BlogRepository {
  String baseUrl = 'https://schoolinka-test-production.up.railway.app/auth/login';

  Future<void> handleLogIn(String email, String password) async {
    try {
      final response = await post(
        Uri.parse(baseUrl),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('Login successful');
        final successJson = json.decode(response.body);
        final successMessage = successJson['mesage'] as String;
      } else if (response.statusCode == 400) {
        // Unauthorized: This will handle invalid credentials.
        final errorJson = json.decode(response.body);
        final errorMessage = errorJson['message'] as String;
        throw Exception(errorMessage);
      }else {
        // This will handle other error scenarios
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Error occurred during login: $e');
    }
  }

}
