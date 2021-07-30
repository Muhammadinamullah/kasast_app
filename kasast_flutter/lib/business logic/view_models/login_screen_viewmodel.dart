import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenViewModel {
  final prefixBaseUrl = 'http://app.kasast.com/api/v1/sessions/?';

  Future<bool> logInUser(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String url = prefixBaseUrl + 'email=' + email;
    url += '&password=' + password;
    print(url);

    var parsedUrl = Uri.parse(url);
    var response = await http.post(parsedUrl);
    var data = jsonDecode(response.body);

    print(response.statusCode);
    if (response.statusCode == 201) {
      prefs.setInt("UserId", data['id']);
      prefs.setString("token", data['api_token']);
      print(data['id']);
      print(data['api_token']);
      return true;
    } else {
      print(data['error']);
      return false;
    }
  }
}
