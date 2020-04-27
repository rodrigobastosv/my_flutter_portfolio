import 'package:cloud_firestore/cloud_firestore.dart';

class MediumPostModel {
  final String title;
  final String link;
  final Timestamp date;

  MediumPostModel({
    this.title,
    this.link,
    this.date,
  });

  static MediumPostModel fromJson(Map<String, dynamic> json) {
    return MediumPostModel(
      title: json['title'] as String,
      link: json['link'] as String,
      date: json['date'] as Timestamp,
    );
  }
}
