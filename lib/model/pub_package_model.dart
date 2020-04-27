import 'package:cloud_firestore/cloud_firestore.dart';

class PubPackageModel {
  final String name;
  final String description;
  final String pubLink;
  final String version;
  final int score;
  final Timestamp releaseDate;

  PubPackageModel({
    this.name,
    this.description,
    this.pubLink,
    this.version,
    this.score,
    this.releaseDate,
  });

  static PubPackageModel fromJson(Map<String, dynamic> json) {
    return PubPackageModel(
      name: json['name'] as String,
      description: json['description'] as String,
      pubLink: json['pubLink'] as String,
      version: json['version'] as String,
      score: json['score'] as int,
      releaseDate: json['releaseDate'] as Timestamp,
    );
  }
}
