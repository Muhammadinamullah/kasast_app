import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AccountTypeViewModel {
  final String prefixBaseUrl = 'http://app.kasast.com/api/v1/users/';

  Future<bool> updateRole(String type) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.get('UserId').toString();
    String token = sharedPreferences.get('token');
    //http://app.kasast.com/api/v1/users/2/?api_token=Q6H26J3RmrrLqlCRHI0n7gtt&user[role]=Employer&user_id=123

    String url =
        prefixBaseUrl + id + '/?user[role]=' + type + '&api_token=' + token;
    print('This url' + url);

    var parsedUrl = Uri.parse(url);
    var response = await http.put(parsedUrl);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
