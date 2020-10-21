import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferencesLoggedInKey = 'ISLOGGEDIN';
  static String sharedPreferencesUserNameKey = 'USERNAMEKEY';
  static String sharedPreferencesUserEmailKey = 'USEREMAILKEY';

  //saving data to sharedpreferences

  static Future<bool> saveUserLoggedInSharedPreference(
      bool isUserLOggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setBool(sharedPreferencesLoggedInKey, isUserLOggedIn);
  }

  static Future<bool> saveUserNameSharedPreference(
      String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserNameKey, userName);
  }

  static Future<bool> saveUserEmailSharedPreference(
      String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(sharedPreferencesUserEmailKey, email);
  }

  //getting data from sharedpreferences


  static Future<bool> getUserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getBool(sharedPreferencesLoggedInKey);
  }

  static Future<String> getUserNameSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getString(sharedPreferencesUserNameKey);
  }

  static Future<String> getUserEmailSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.getString(sharedPreferencesUserEmailKey);
  }

}
