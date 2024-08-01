import 'package:shared_preferences/shared_preferences.dart';

class CacheHandler {
// For Set and Get Access Token
  Future<void> setToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isResult = await prefs.setString("accesstoken", value);
    print("Successfully Stroed Token in cache: $isResult");
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? result = prefs.getString("accesstoken");
    return result ?? "";
  }

// For Logout User
  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.clear();
    prefs.remove("accesstoken");
  }
}
