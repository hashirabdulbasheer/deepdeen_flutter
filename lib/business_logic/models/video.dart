// To parse this JSON data, do
//
//     final myVideo = myVideoFromJson(jsonString);

import 'dart:convert';

List<DeepDeenVideo> myVideoFromJson(String str) =>
    List<DeepDeenVideo>.from(json.decode(str).map((x) => DeepDeenVideo.fromJson(x)));

String myVideoToJson(List<DeepDeenVideo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeepDeenVideo {
  DeepDeenVideo({
    this.thumbnail,
    this.title,
    this.subtitle,
    this.url,
  });

  String thumbnail;
  String title;
  String subtitle;
  String url;

  factory DeepDeenVideo.fromJson(Map<String, dynamic> json) => DeepDeenVideo(
        thumbnail: json["thumbnail"],
        title: json["title"],
        subtitle: json["subtitle"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnail": thumbnail,
        "title": title,
        "subtitle": subtitle,
        "url": url,
      };
}
