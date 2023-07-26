// To parse this JSON data, do
//
//     final amenitiesResponseModel = amenitiesResponseModelFromJson(jsonString);

import 'dart:convert';

AmenitiesResponseModel amenitiesResponseModelFromJson(String str) =>
    AmenitiesResponseModel.fromJson(json.decode(str));

String amenitiesResponseModelToJson(AmenitiesResponseModel data) =>
    json.encode(data.toJson());

class AmenitiesResponseModel {
  AmenitiesResponseModel({
    this.msg,
    this.error,
    this.data,
  });

  String msg;
  bool error;
  List<Datumm> data;

  factory AmenitiesResponseModel.fromJson(Map<String, dynamic> json) =>
      AmenitiesResponseModel(
        msg: json["msg"],
        error: json["error"],
        data: List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datumm {
  Datumm({
    this.name,
    this.image,
    this.icon,
    this.description,
    this.location,
  });

  String name;
  String image;
  String icon;
  String description;
  String location;

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
        name: json["name"],
        image: json["image"],
        icon: json["icon"],
        description: json["description"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "icon": icon,
        "description": description,
        "location": location,
      };
}
