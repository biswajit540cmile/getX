//import 'dart:convert';

//List<GetResponse> getResponseFromJson(String str) => List<GetResponse>.from(json.decode(str).map((x) => GetResponse.fromJson(x)));

//String getResponseToJson(List<GetResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetResponse {
  int userId;
  int id;
  String title;

  GetResponse({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory GetResponse.fromJson(Map<String, dynamic> json) => GetResponse(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
  };
}
