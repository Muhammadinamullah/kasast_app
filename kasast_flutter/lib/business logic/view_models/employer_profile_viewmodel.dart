import 'package:http/http.dart' as http;
import 'package:kasast/business%20logic/models/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerProfileViewModel {
  final String prefixBaseUrl = 'http://app.kasast.com/api/v1/users/';
  //UserProfile userProfile;

  Future<UserProfile> getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.get('UserId').toString();
    String token = sharedPreferences.get('token');
    String url = prefixBaseUrl + id + '?api_token=' + token;
    print('Employr profile view' + url);

    var parsedUrl = Uri.parse(url);
    final http.Response response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      print(response.body);
      final userProfile = userProfileFromJson(response.body);

      return userProfile;
    } else {
      print("not working fine");
      return null;
    }
  }
}
