import 'dart:convert';
import 'package:http/http.dart';

class BlogRepository {
  String baseUrl = 'https://schoolinka-test-production.up.railway.app/auth';

  Future<bool> handleLogIn(String email, String password) async {
    try {
      final response = await post(
        Uri.parse('$baseUrl/login'),
        body: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        //01H9KEM19X2NZHWQXMEP50B32V
        print('Login successful');
        final successJson = json.decode(response.body);
        final successMessage = successJson['message'] as String;
        print('the success message is $successMessage');
        return true;
      } else if (response.statusCode == 400) {
        // Unauthorized: This will handle invalid credentials.
        print('account already exists');
        final errorJson = json.decode(response.body);
        final errorMessage = errorJson['message'] as String;
        print('The error message is: $errorMessage');

        throw Exception(errorMessage);
      }else {
        // This will handle other error scenarios
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Error occurred during login: $e');
    }
  }


  Future<void> handleSignUp(String firstName, String lastName,String email, String password) async {
    try {
      final response = await post(
        Uri.parse('$baseUrl/register'),
        body: {
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 201) {
        //print('Registration successful');
        final successJson = json.decode(response.body);
        final successMessage = successJson['message'] as String;
        print('the success message is $successMessage');
      } else if (response.statusCode == 400) {
        // Unauthorized: This will handle invalid credentials.
        final errorJson = json.decode(response.body);
        final errorMessage = errorJson['message'] as String;
        print('The error message is: $errorMessage');
        throw Exception(errorMessage);
      }else {
        // This will handle other error scenarios
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('Error occurred during login: $e');
    }
  }


  Future<void> logout() async {
    try {
      final response = await post(
        Uri.parse('$baseUrl/users/:id/logout'),

      );

      if (response.statusCode == 200) {
        print('LOGGED OUT');
        // Handle a successful logout (e.g., clear user data, navigate to login screen, etc.).
      } else if(response.statusCode == 400){
        print('Unable to log out');
        // Handle logout failure (e.g., show an error message).
      }else if(response.statusCode == 403){
        print('FORBIDDEN');
      }
      else{
        print('ERROR');
      }
    } catch (e) {
      print('An error has occurred');
      // Handle exceptions (e.g., network error, timeout, etc.).
    }
  }


}
