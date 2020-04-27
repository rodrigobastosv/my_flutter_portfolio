import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_portfolio/model/package_model.dart';

class AppModel {
  final String id;
  final String name;
  final String mainColor;
  final String titleColor;
  final String logo;
  final String description;
  final String googlePlayLink;
  final DateTime releaseDate;
  final List<UsedPackageInfoModel> stuffUsed;
  final List<String> images;

  AppModel(
      {this.id,
      this.name,
      this.mainColor,
      this.titleColor,
      this.logo,
      this.googlePlayLink,
      this.description,
      this.releaseDate,
      this.stuffUsed,
      this.images});

  static Future<AppModel> fromJson(Map<String, dynamic> json) async {
    final id = json['id'] as String;
    final queryImages = await Firestore.instance
        .collection('apps')
        .document(id)
        .collection('images')
        .getDocuments();
    final documentImages = queryImages.documents;
    final images = List<String>.generate(
            documentImages.length, (i) => documentImages[i].data['url']) ??
        [];

    final queryStuffUsed = await Firestore.instance
        .collection('apps')
        .document(id)
        .collection('stuffUsed')
        .getDocuments();
    final documentStuff = queryStuffUsed.documents;
    final stuff = List<UsedPackageInfoModel>.generate(documentStuff.length,
            (i) => UsedPackageInfoModel.fromJson(documentStuff[i].data)) ??
        [];

    return AppModel(
      id: json['id'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      description: json['description'] as String,
      mainColor: json['mainColor'] as String,
      titleColor: json['titleColor'] as String,
      googlePlayLink: json['googlePlayLink'] as String,
      releaseDate:
          AppModel._fromJsonTimestamp(json['releaseDate'] as Timestamp),
      stuffUsed: stuff,
      images: images,
    );
  }

  static DateTime _fromJsonTimestamp(Timestamp timestamp) =>
      DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
}
