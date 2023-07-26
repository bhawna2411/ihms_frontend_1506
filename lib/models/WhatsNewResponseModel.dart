// To parse this JSON data, do
//
//     final whatsNewResponseModel = whatsNewResponseModelFromJson(jsonString);

import 'dart:convert';

WhatsNewResponseModel whatsNewResponseModelFromJson(String str) => WhatsNewResponseModel.fromJson(json.decode(str));

String whatsNewResponseModelToJson(WhatsNewResponseModel data) => json.encode(data.toJson());

class WhatsNewResponseModel {
    WhatsNewResponseModel({
        this.msg,
        this.error,
        this.data,
    });

    String msg;
    String error;
    List<Datumwhatsnew> data;

    factory WhatsNewResponseModel.fromJson(Map<String, dynamic> json) => WhatsNewResponseModel(
        msg: json["msg"],
        error: json["error"],
        data: List<Datumwhatsnew>.from(json["data"].map((x) => Datumwhatsnew.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datumwhatsnew {
    Datumwhatsnew({
        this.id,
        this.title,
        this.description,
        this.url,
        this.society,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String description;
    String url;
    String society;
    DateTime createdAt;
    DateTime updatedAt;

    factory Datumwhatsnew.fromJson(Map<String, dynamic> json) => Datumwhatsnew(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        society: json["society"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "url": url,
        "society": society,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
