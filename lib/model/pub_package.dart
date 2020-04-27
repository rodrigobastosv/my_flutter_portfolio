import 'package:cloud_firestore/cloud_firestore.dart';

class PubPackage {
  final String name;
  final String description;
  final String pubLink;
  final String version;
  final int score;
  final Timestamp releaseDate;

  PubPackage({
    this.name,
    this.description,
    this.pubLink,
    this.version,
    this.score,
    this.releaseDate,
  });

  static PubPackage fromJson(Map<String, dynamic> json) {
    return PubPackage(
      name: json['name'] as String,
      description: json['description'] as String,
      pubLink: json['pubLink'] as String,
      version: json['version'] as String,
      score: json['score'] as int,
      releaseDate: json['releaseDate'] as Timestamp,
    );
  }
}
