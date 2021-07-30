import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kasast/business%20logic/models/created_jobs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmployerJobListViewModel {
  final String prefixBaseUrl = 'http://app.kasast.com/';
  //UserProfile userProfile;
  List<Jobs> jobslist;

  // ignore: missing_return
  Future<List<Jobs>> getJobs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String id = sharedPreferences.get('UserId').toString();
    String token = sharedPreferences.get('token');
    String url = prefixBaseUrl +
        'api/v1/jobs/my_jobs?api_token=' +
        token +
        '&user_id=' +
        id;
    //String url = 'http://app.kasast.com/api/v1/jobs/my_jobs?api_token=fqnvGruDWMNwNdwlOKqNBwtt&user_id=118';
    print(url);

    var parsedUrl = Uri.parse(url);
    final http.Response response = await http.get(parsedUrl);
    if (response.statusCode == 200) {
      print(response.body);

      jobslist = jsonDecode(response.body)
          .map<Jobs>(
            (data) => Jobs.fromJson(data),
          )
          .toList();
      print(jobslist.last.id);

      return jobslist;
    } else {
      print("not working fine");
    }
  }
}
