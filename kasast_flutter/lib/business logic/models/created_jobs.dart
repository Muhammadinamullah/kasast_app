// To parse this JSON data, do
//
//     final createdJobs = createdJobsFromJson(jsonString);

import 'dart:convert';

List<Jobs> createdJobsFromJson(String str) =>
    List<Jobs>.from(json.decode(str).map((x) => Jobs.fromJson(x)));

String createdJobsToJson(List<Jobs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Jobs {
  Jobs({
    this.id,
    this.title,
    this.description,
    this.longitude,
    this.latitude,
    this.additionalAddress,
    this.address,
    this.startDate,
    this.startTime,
    this.jobType,
    this.hours,
    this.perHour,
    this.fixedAmount,
    this.status,
    this.canApply,
    this.businessName,
    this.totalPrice,
    this.offersCount,
    this.hasWorkerReviewed,
    this.hasEmployerReviewed,
    this.user,
    this.bids,
  });

  int id;
  String title;
  String description;
  String longitude;
  String latitude;
  String additionalAddress;
  String address;
  DateTime startDate;
  DateTime startTime;
  int jobType;
  dynamic hours;
  dynamic perHour;
  dynamic fixedAmount;
  String status;
  bool canApply;
  dynamic businessName;
  dynamic totalPrice;
  int offersCount;
  bool hasWorkerReviewed;
  bool hasEmployerReviewed;
  User user;
  List<dynamic> bids;

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        additionalAddress: json["additional_address"],
        address: json["address"],
        startDate: DateTime.parse(json["start_date"]),
        startTime: DateTime.parse(json["start_time"]),
        jobType: json["job_type"],
        hours: json["hours"],
        perHour: json["per_hour"],
        fixedAmount: json["fixed_amount"],
        status: json["status"],
        canApply: json["can_apply"],
        businessName: json["business_name"],
        totalPrice: json["total_price"],
        offersCount: json["offers_count"],
        hasWorkerReviewed: json["has_worker_reviewed"],
        hasEmployerReviewed: json["has_employer_reviewed"],
        user: User.fromJson(json["user"]),
        bids: List<dynamic>.from(json["bids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "additional_address": additionalAddress,
        "address": address,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime.toIso8601String(),
        "job_type": jobType,
        "hours": hours,
        "per_hour": perHour,
        "fixed_amount": fixedAmount,
        "status": status,
        "can_apply": canApply,
        "business_name": businessName,
        "total_price": totalPrice,
        "offers_count": offersCount,
        "has_worker_reviewed": hasWorkerReviewed,
        "has_employer_reviewed": hasEmployerReviewed,
        "user": user.toJson(),
        "bids": List<dynamic>.from(bids.map((x) => x)),
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
