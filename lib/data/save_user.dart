import 'package:shared_preferences/shared_preferences.dart';

import 'model/user_model.dart';
class SharedPreferencesManager {
  static const String userIdKey = 'user_id';
  static const String userNameKey = 'user_name';
  static const String userEmailKey = 'user_email';
  static const String accessTokenKey = 'access_token';

  // Save user data to SharedPreferences
  static Future<void> saveUserData(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(userIdKey, user.id);
    prefs.setString(userNameKey, user.name);
    prefs.setString(userEmailKey, user.email);
  }
  // Store access token in SharedPreferences
  static Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(accessTokenKey, accessToken);
  }

  // Retrieve user data from SharedPreferences
  static Future<User?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(userIdKey);
    final userName = prefs.getString(userNameKey);
    final userEmail = prefs.getString(userEmailKey);

    if (userId != null && userName != null && userEmail != null) {
      return User(id: userId, name: userName, email: userEmail);
    } else {
      return null; // No user data found in SharedPreferences
    }
  }

  // Retrieve access token from SharedPreferences
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  // Clear user data from SharedPreferences
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(userIdKey);
    prefs.remove(userNameKey);
    prefs.remove(userEmailKey);
    prefs.remove(accessTokenKey);
  }
}

