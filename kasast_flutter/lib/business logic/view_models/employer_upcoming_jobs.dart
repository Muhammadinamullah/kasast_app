import 'dart:convert';

import 'package:kasast/business%20logic/models/employer_upcoming_jobs.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmployerUpcomingJobsViewModel {
  final String prefixBaseUrl = 'http://app.kasast.com/';

  List<dynamic> upcomingjobslist;

  Future<List<dynamic>> getUpcomingJobs() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.get('token');
    String url =
        prefixBaseUrl + 'api/v1/jobs/employer_upcoming?api_token=' + token;
    print('Upcoming jobs url ' + url);
    var parseUrl = Uri.parse(url);
    final http.Response response = await http.get(parseUrl);
    if (response.statusCode == 200) {
      print(response.body);

      upcomingjobslist = jsonDecode(response.body)
          .map<UpcmngJobs>(
            (data) => UpcmngJobs.fromJson(data),
          )
          .toList();
      print(upcomingjobslist.last.id);

      return upcomingjobslist;
    } else {
      print("No upcoming Job Here!");
    }
  }
}
