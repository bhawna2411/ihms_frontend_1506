// To parse this JSON data, do
//
//     final userProfileResponseModel = userProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) =>
    UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) =>
    json.encode(data.toJson());

class UserProfileResponseModel {
  UserProfileResponseModel({
    this.msg,
    this.error,
    this.data,
  });

  String msg;
  bool error;
  Data data;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      UserProfileResponseModel(
        msg: json["msg"],
        error: json["error"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "error": error,
        "data": data.toJson(),
      };
}

class Data {
  Data(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.gender,
      this.society,
      this.towerNumber,
      this.flatNumber,
      this.emailVerifiedAt,
      this.otp,
      this.otpVerifyStatus,
      this.status,
      this.userType,
      this.password,
      this.rememberToken,
      this.createdAt,
      this.updatedAt,
      this.adminVerify,
      this.deleteStatus,
      this.dob,
      this.anniversary,
      this.image});

  int id;
  String name;
  String email;
  String mobile;
  String gender;
  String society;
  String towerNumber;
  String flatNumber;
  String emailVerifiedAt;
  String otp;
  String otpVerifyStatus;
  String status;
  String userType;
  String password;
  String rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  String adminVerify;
  String deleteStatus;
  String dob;
  String anniversary;
  String image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        gender: json["gender"],
        society: json["society"],
        towerNumber: json["tower_number"],
        flatNumber: json["flat_number"],
        emailVerifiedAt: json["email_verified_at"],
        otp: json["otp"],
        otpVerifyStatus: json["otp_verify_status"],
        status: json["status"],
        userType: json["user_type"],
        password: json["password"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        adminVerify: json["admin_verify"],
        deleteStatus: json["delete_status"],
        dob: json["dob"],
        anniversary: json["anniversary"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "gender": gender,
        "society": society,
        "tower_number": towerNumber,
        "flat_number": flatNumber,
        "email_verified_at": emailVerifiedAt,
        "otp": otp,
        "otp_verify_status": otpVerifyStatus,
        "status": status,
        "user_type": userType,
        "password": password,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "admin_verify": adminVerify,
        "delete_status": deleteStatus,
        "dob": dob,
        "anniversary": anniversary,
        "image": image
      };
}
