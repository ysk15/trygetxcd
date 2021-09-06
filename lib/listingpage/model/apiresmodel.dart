// To parse this JSON data, do
//
//     final apiResModel = apiResModelFromJson(jsonString);

import 'dart:convert';

ApiResModel apiResModelFromJson(String str) => ApiResModel.fromJson(json.decode(str));

String apiResModelToJson(ApiResModel data) => json.encode(data.toJson());

class ApiResModel {
  ApiResModel({
    this.totalPassengers,
    this.totalPages,
    this.data,
  });

  int totalPassengers;
  int totalPages;
  List<Datum> data;

  factory ApiResModel.fromJson(Map<String, dynamic> json) => ApiResModel(
    totalPassengers: json["totalPassengers"] == null ? null : json["totalPassengers"],
    totalPages: json["totalPages"] == null ? null : json["totalPages"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "totalPassengers": totalPassengers == null ? null : totalPassengers,
    "totalPages": totalPages == null ? null : totalPages,
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.trips,
    this.airline,
    this.v,
  });

  String id;
  String name;
  int trips;
  dynamic airline;
  int v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    trips: json["trips"] == null ? null : json["trips"],
    airline: json["airline"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "trips": trips == null ? null : trips,
    "airline": airline,
    "__v": v == null ? null : v,
  };
}

class AirlineElement {
  AirlineElement({
    this.id,
    this.airlineId,
    this.name,
    this.country,
    this.logo,
    this.slogan,
    this.headQuaters,
    this.website,
    this.established,
    this.v,
  });

  String id;
  int airlineId;
  String name;
  String country;
  String logo;
  String slogan;
  String headQuaters;
  String website;
  String established;
  int v;

  factory AirlineElement.fromJson(Map<String, dynamic> json) => AirlineElement(
    id: json["_id"] == null ? null : json["_id"],
    airlineId: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    country: json["country"] == null ? null : json["country"],
    logo: json["logo"] == null ? null : json["logo"],
    slogan: json["slogan"] == null ? null : json["slogan"],
    headQuaters: json["head_quaters"] == null ? null : json["head_quaters"],
    website: json["website"] == null ? null : json["website"],
    established: json["established"] == null ? null : json["established"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "id": airlineId == null ? null : airlineId,
    "name": name == null ? null : name,
    "country": country == null ? null : country,
    "logo": logo == null ? null : logo,
    "slogan": slogan == null ? null : slogan,
    "head_quaters": headQuaters == null ? null : headQuaters,
    "website": website == null ? null : website,
    "established": established == null ? null : established,
    "__v": v == null ? null : v,
  };
}
