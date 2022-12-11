// To parse this JSON data, do
//
//     final barModel = barModelFromJson(jsonString);

import 'dart:convert';

BarModel barModelFromJson(String str) => BarModel.fromJson(json.decode(str));

String barModelToJson(BarModel data) => json.encode(data.toJson());

class BarModel {
  BarModel({
    required this.channel,
    required this.feeds,
  });

  Channel channel;
  List<Feed> feeds;

  factory BarModel.fromJson(Map<String, dynamic> json) => BarModel(
    channel: Channel.fromJson(json["channel"]),
    feeds: List<Feed>.from(json["feeds"].map((x) => Feed.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "channel": channel.toJson(),
    "feeds": List<dynamic>.from(feeds.map((x) => x.toJson())),
  };
}

class Channel {
  Channel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.field1,
    required this.field2,
    required this.field3,
    required this.createdAt,
    required this.updatedAt,
    required this.lastEntryId,
  });

  int id;
  String name;
  String latitude;
  String longitude;
  String field1;
  String? field2;
  String? field3;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic lastEntryId;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    field1: json["field1"],
    field2: json["field2"],
    field3: json["field3"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    lastEntryId: json["last_entry_id"],
  );

  Map<String, dynamic> toJson() => {
    "entry_id": id,
    "name": name,
    "latitude": latitude,
    "longitude": longitude,
    "field1": field1,
    "field2": field2,
    "field3": field3,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "last_entry_id": lastEntryId,
  };
}

class Feed {

  int id ;
  DateTime createdAt;
  String field1;
  String? field2;
  String? field3;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    createdAt: DateTime.parse(json["created_at"]),
    id:json["entry_id"],
    field1: json["field1"],
    field2: json["field2"],
    field3: json["field3"],
  );

  Map<String, dynamic> toJson() => {
    "entry_id": id,
    "created_at": createdAt.toIso8601String(),
    "field1": field1,
    "field2": field2,
    "field3": field3,
  };

  Feed({required this.id,
    required this.createdAt,
    required this.field1,
    this.field2,
    this.field3});
}
class BarModel2 {
  String year ;
  int value ;

  BarModel2(this.year, this.value);
}