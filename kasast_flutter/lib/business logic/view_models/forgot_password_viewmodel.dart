import 'package:http/http.dart' as http;

class ForgotPasswordViewModel {
  final String prefixBaseUrl =
      'http://app.kasast.com/api/v1/users/forgot_password?email=';

  Future<bool> getPassword(String password) async {
    String url = prefixBaseUrl + password;
    var parsedUrl = Uri.parse(url);
    var response = await http.put(parsedUrl);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
