import 'package:http/http.dart' as http;

class RegisterScreenViewModel {
  String fName = ' ', lName = ' ';

  final prefixBaseUrl = 'http://app.kasast.com/api/v1/users/?';

  Future<bool> registerUser(
      {String fullName, String email, String phone, String password}) async {
    var names = fullName.split(" ");
    if (names.length >= 2) {
      fName = names[0];
      lName = names[1];
    } else {
      fName = names[0];
    }
    String url = prefixBaseUrl + 'user[email]=' + email;
    url = url + '&user[first_name]=' + fName;
    url = url + '&user[last_name]=' + lName;
    url = url +
        '&user[phone]=' +
        phone +
        '&PushToken=pushasdfasd4cwerqwecda4qrcadqd3der3rqwer33qe';
    url = url + '&user[password]=' + password;
    url = url + '&user[passsword_confirmation]=' + password;

    var parsedUrl = Uri.parse(url);
    var response = await http.post(parsedUrl);
    print(response.statusCode.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}
