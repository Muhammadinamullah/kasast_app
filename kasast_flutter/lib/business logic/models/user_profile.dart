// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'dart:convert';

UserProfile userProfileFromJson(String str) => UserProfile.fromJson(json.decode(str));

String userProfileToJson(UserProfile data) => json.encode(data.toJson());

class UserProfile {
  UserProfile({
    this.user,
    this.details,
  });

  User user;
  Details details;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        user: User.fromJson(json["user"]),
        details: Details.fromJson(json["details"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "details": details.toJson(),
      };
}

class Details {
  Details({
    this.totalEarnings,
    this.workerTotalJobs,
    this.hoursWorked,
    this.totalSpending,
    this.employerTotalJobs,
    this.hoursPaid,
    this.receivedReviews,
  });

  int totalEarnings;
  int workerTotalJobs;
  dynamic hoursWorked;
  int totalSpending;
  int employerTotalJobs;
  dynamic hoursPaid;
  List<dynamic> receivedReviews;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        totalEarnings: json["total_earnings"],
        workerTotalJobs: json["worker_total_jobs"],
        hoursWorked: json["hours_worked"],
        totalSpending: json["total_spending"],
        employerTotalJobs: json["employer_total_jobs"],
        hoursPaid: json["hours_paid"],
        receivedReviews: List<dynamic>.from(json["received_reviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total_earnings": totalEarnings,
        "worker_total_jobs": workerTotalJobs,
        "hours_worked": hoursWorked,
        "total_spending": totalSpending,
        "employer_total_jobs": employerTotalJobs,
        "hours_paid": hoursPaid,
        "received_reviews": List<dynamic>.from(receivedReviews.map((x) => x)),
      };
}

class User {
  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.gender,
    this.address,
    this.apiToken,
    this.averageRating,
    this.skills,
    this.role,
    this.country,
    this.state,
    this.latitude,
    this.longitude,
    this.avatar,
    this.workerCompletionRate,
    this.stripeToken,
    this.updatedAt,
    this.createdAt,
    this.confirmed,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String phone;
  dynamic gender;
  dynamic address;
  String apiToken;
  dynamic averageRating;
  List<dynamic> skills;
  String role;
  dynamic country;
  dynamic state;
  dynamic latitude;
  dynamic longitude;
  dynamic avatar;
  dynamic workerCompletionRate;
  dynamic stripeToken;
  DateTime updatedAt;
  DateTime createdAt;
  bool confirmed;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
        apiToken: json["api_token"],
        averageRating: json["average_rating"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        role: json["role"],
        country: json["country"],
        state: json["state"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        avatar: json["avatar"],
        workerCompletionRate: json["worker_completion_rate"],
        stripeToken: json["stripe_token"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        confirmed: json["confirmed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "gender": gender,
        "address": address,
        "api_token": apiToken,
        "average_rating": averageRating,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "role": role,
        "country": country,
        "state": state,
        "latitude": latitude,
        "longitude": longitude,
        "avatar": avatar,
        "worker_completion_rate": workerCompletionRate,
        "stripe_token": stripeToken,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "confirmed": confirmed,
      };
}
