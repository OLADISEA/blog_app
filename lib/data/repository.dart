import 'dart:convert';
import 'package:blog_app/data/save_user.dart';
import 'package:http/http.dart';

import 'model/user_model.dart';

class BlogRepository {
  String baseUrl = 'https://schoolinka-test-production.up.railway.app/auth';
  String baseurl = 'https://schoolinka-test-production.up.railway.app';


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
        final successJson = json.decode(response.body);
        final successMessage = successJson['message'] as String;
        final accessToken = successJson['data']['accessToken'];
        final refreshToken = successJson['data']['refreshToken'];

        print('access Token is $accessToken');
        print('the success message is $successMessage');

        // Fetch user data
        final userData = await fetchUserData(accessToken);

        // Save user data to SharedPreferences
        //await generateAccessToken(refreshToken);
        await SharedPreferencesManager.saveUserData(userData!);

        // Save user data to SharedPreferences
        await SharedPreferencesManager.saveRefreshToken(refreshToken);


        return true;
      } else if (response.statusCode == 400) {
        // Unauthorized: This will handle invalid credentials.
        print('account already exists');
        final errorJson = json.decode(response.body);
        final errorMessage = errorJson['message'] as String;
        print('The error message is: $errorMessage');

        throw Exception(errorMessage);
      }else {
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


  Future<bool> logout() async {
    try {
      print('Trying to log out');
      // Retrieve the user ID from shared preferences and Generate the access token
      final userData = await SharedPreferencesManager.getUserData();
      final userId = userData?.id;
      final refreshToken = await SharedPreferencesManager.getRefreshToken();
      print(refreshToken);
      var accessToken = '';
      if (refreshToken != null) {
        try {
          accessToken = await generateAccessToken(refreshToken,userId!);
          print(accessToken);
          print('seen access token');
        }catch(e){
          print('ERROR FROM GENERATING ACCESS TOKEN');
        }

        // Use accessToken as needed
      } else {
        // Handle the case when refreshToken is null
      }

      final response = await post(
        Uri.parse('$baseurl/users/$userId/logout'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },

      );

      if (response.statusCode == 200) {
        print('LOGGED OUT');
        // Successful logout; clear user data from SharedPreferences
        await SharedPreferencesManager.clearUserData();
        return true;

        // successful logout such as clearing user data and navigating to login screen, etc.).
      } else if(response.statusCode == 400){
        print('Unable to log out');
        //logout failure
      }else if(response.statusCode == 403){
        print('FORBIDDEN');
      }
      else{
        print('ERROR');
      }
    } catch (e) {
      print('An error has occurred');
    }
    return false;
  }


  Future<User?> fetchUserData(String accessToken) async {
    try {
      final response = await get(
        Uri.parse('$baseurl/users/me'),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },

      );

      if (response.statusCode == 200) {
        final userData = json.decode(response.body);
        //final userId = userData['data']['id'];
        return User(
          id: userData['data']['id'],
          name: userData['data']['firstName'],
          email: userData['data']['email'],
        );
        //print(userId);
        //return userData['id'];
      } else {
        throw Exception('Failed to fetch user data');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching user data: $e');
    }
  }


  Future<String> generateAccessToken(String refreshToken, String userId) async {
    try {
      final response = await post(
        Uri.parse('$baseurl/users/$userId/token'),
        body: {
          "refreshToken": refreshToken
        },
      );
      print('almost');

      if (response.statusCode == 201) {
        final successJson = json.decode(response.body);
        final successMessage = successJson['message'] as String;
        final accessToken = successJson['data']['accessToken'];
        print(successMessage);
        return accessToken;

      }else if(response.statusCode == 400){
        print('Bad request');

      }else if(response.statusCode == 404){
          print('user not found');
    }
      else {
        throw Exception('Failed to fetch user datas');
      }
    } catch (e) {
      throw Exception('Error occurred while fetching user data: $e');
    }
    return '';
  }




}
