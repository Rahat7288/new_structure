
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preference_key.dart';

class SessionManager {

  static Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.authToken.toString()) ?? "";
  }
  static Future<String> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.refreshToken.toString()) ?? "";
  }

  static setToken(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefKeys.authToken.toString(), accessToken);
    prefs.setString(SharedPrefKeys.refreshToken.toString(), refreshToken);
  }

  static setUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefKeys.userId.toString(), userId);
  }
  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefKeys.userId.toString());
  }

  static Future<bool> getIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.isLogin.toString()) ?? false;
  }

  static setIsLogin(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.isLogin.toString(), isLogin);
  }

  static setNewMessageNotification(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(SharedPrefKeys.newMessageNotificationEnabled.toString(), value);
  }

  static Future<bool> getNewMessageNotification() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(SharedPrefKeys.newMessageNotificationEnabled.toString()) ?? true;
  }


  static Future<void> removeAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<void> setApiData(String key,dynamic value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static Future<T?> getApiData<T>(String key, T Function(Map<String, dynamic>) fromJson) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final jsonMap = json.decode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }



}