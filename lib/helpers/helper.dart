import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // Keys
  static String userLoggedIn = "LOGGEDIN";
  static String userFirstName = "USERFIRSTNAME";
  static String userLastName = "USERLASTNAME";
  static String userEmail = "USEREMAIL";

  // Save user data to shared preferences

  static Future<bool> saveUserLoggedIn(bool isUserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(userLoggedIn, isUserLoggedIn);
  }

  static Future<bool> saveUserFirstName(String firstName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userFirstName, firstName);
  }

  static Future<bool> saveUserLastName(String lastName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userLastName, lastName);
  }

  static Future<bool> saveUserEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(userEmail, email);
  }

  // Get user data from shared preferences
  static Future<String?> getUserFirstNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userFirstName);
  }

  static Future<String?> getUserLastNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userLastName);
  }

  static Future<String?> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userEmail);
  }

  static Future<bool?> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedIn);
  }
}
