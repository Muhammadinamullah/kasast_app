import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JobPostDetailViewModel {
  final prefixBaseUrl = 'http://app.kasast.com/api/v1/jobs?';

  Future<bool> createJob(
      {String taskTitle,
      String description,
      String latitude,
      String longitude,
      String neighbourHood,
      String startTime,
      String startDate,
      String pricePerHour,
      String hours}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.get('token');
    String id = prefs.getInt('UserId').toString();
    String url = prefixBaseUrl + 'api_token=' + token;
    url += '&job[title]=' + taskTitle;
    url += '&job[description]=' + description;
    url += '&job[start_time]=' + startTime;
    url += '&job[start_date]=' + startDate;
    url += '&job[longitude]=' + longitude;
    url += '&job[latitude]=' + latitude;
    url += '&job[job_type]=' + 2.toString();
    url += '&job[hours]=' + hours;
    url += '&job[per_hour]=' + pricePerHour;
    url += '&job[user_id]=' + id;
    url += '&job[additional_address]=' + neighbourHood;
    print(url);

    var parsedUrl = Uri.parse(url);
    var response = await http.post(parsedUrl);
    //var data = jsonDecode(response.body);

    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
