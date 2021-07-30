// To parse this JSON data, do
//
//     final upcomingJobs = upcomingJobsFromJson(jsonString);

import 'dart:convert';

List<UpcmngJobs> upcomingJobsFromJson(String str) => List<UpcmngJobs>.from(
    json.decode(str).map((x) => UpcmngJobs.fromJson(x)));

String upcomingJobsToJson(List<UpcmngJobs> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcmngJobs {
  UpcmngJobs({
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
    this.reviews,
    this.bids,
  });

  dynamic id;
  String title;
  String description;
  String longitude;
  String latitude;
  String additionalAddress;
  Address address;
  DateTime startDate;
  DateTime startTime;
  dynamic jobType;
  dynamic hours;
  dynamic perHour;
  dynamic fixedAmount;
  Status status;
  bool canApply;
  dynamic businessName;
  dynamic totalPrice;
  dynamic offersCount;
  bool hasWorkerReviewed;
  bool hasEmployerReviewed;
  User user;
  List<dynamic> reviews;
  List<dynamic> bids;

  factory UpcmngJobs.fromJson(Map<String, dynamic> json) => UpcmngJobs(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        additionalAddress: json["additional_address"],
        address: addressValues.map[json["address"]],
        startDate: DateTime.parse(json["start_date"]),
        startTime: DateTime.parse(json["start_time"]),
        jobType: json["job_type"],
        hours: json["hours"] == null ? null : json["hours"],
        perHour: json["per_hour"] == null ? null : json["per_hour"],
        fixedAmount: json["fixed_amount"] == null ? null : json["fixed_amount"],
        status: statusValues.map[json["status"]],
        canApply: json["can_apply"],
        businessName: json["business_name"],
        totalPrice: json["total_price"],
        offersCount: json["offers_count"],
        hasWorkerReviewed: json["has_worker_reviewed"],
        hasEmployerReviewed: json["has_employer_reviewed"],
        user: User.fromJson(json["user"]),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        bids: List<dynamic>.from(json["bids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "longitude": longitude,
        "latitude": latitude,
        "additional_address": additionalAddress,
        "address": addressValues.reverse[address],
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "start_time": startTime.toIso8601String(),
        "job_type": jobType,
        "hours": hours == null ? null : hours,
        "per_hour": perHour == null ? null : perHour,
        "fixed_amount": fixedAmount == null ? null : fixedAmount,
        "status": statusValues.reverse[status],
        "can_apply": canApply,
        "business_name": businessName,
        "total_price": totalPrice,
        "offers_count": offersCount,
        "has_worker_reviewed": hasWorkerReviewed,
        "has_employer_reviewed": hasEmployerReviewed,
        "user": user.toJson(),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "bids": List<dynamic>.from(bids.map((x) => x)),
      };
}

enum Address { JOHARTOWN_LAHORE, EMPTY }

final addressValues = EnumValues(
    {"": Address.EMPTY, "johartown lahore": Address.JOHARTOWN_LAHORE});

enum Status { OPEN }

final statusValues = EnumValues({"open": Status.OPEN});

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

  dynamic id;
  Email email;
  FirstName firstName;
  LastName lastName;
  String phone;
  dynamic gender;
  dynamic address;
  ApiToken apiToken;
  dynamic averageRating;
  List<dynamic> skills;
  Role role;
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
        email: emailValues.map[json["email"]],
        firstName: firstNameValues.map[json["first_name"]],
        lastName: lastNameValues.map[json["last_name"]],
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
        apiToken: apiTokenValues.map[json["api_token"]],
        averageRating: json["average_rating"],
        skills: List<dynamic>.from(json["skills"].map((x) => x)),
        role: roleValues.map[json["role"]],
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
        "email": emailValues.reverse[email],
        "first_name": firstNameValues.reverse[firstName],
        "last_name": lastNameValues.reverse[lastName],
        "phone": phone,
        "gender": gender,
        "address": address,
        "api_token": apiTokenValues.reverse[apiToken],
        "average_rating": averageRating,
        "skills": List<dynamic>.from(skills.map((x) => x)),
        "role": roleValues.reverse[role],
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

enum ApiToken { OA_HFG_XK_TMZP_TQ8_CCO_CDH_PGTT }

final apiTokenValues = EnumValues(
    {"OaHFGXkTMZPTq8ccoCDHPgtt": ApiToken.OA_HFG_XK_TMZP_TQ8_CCO_CDH_PGTT});

enum Email { INAMULLAH_ORAXTECH_GMAIL_COM }

final emailValues = EnumValues(
    {"inamullah.oraxtech@gmail.com": Email.INAMULLAH_ORAXTECH_GMAIL_COM});

enum FirstName { INAM }

final firstNameValues = EnumValues({"inam": FirstName.INAM});

enum LastName { ULLAH }

final lastNameValues = EnumValues({"ullah": LastName.ULLAH});

enum Role { EMPLOYER }

final roleValues = EnumValues({"Employer": Role.EMPLOYER});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
