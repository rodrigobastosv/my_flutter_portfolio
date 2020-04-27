class UsedPackageInfoModel {
  final String name;
  final String pubLink;

  UsedPackageInfoModel({
    this.name,
    this.pubLink,
  });

  static UsedPackageInfoModel fromJson(Map<String, dynamic> json) {
    return UsedPackageInfoModel(
      name: json['name'] as String,
      pubLink: json['pubLink'] as String,
    );
  }
}
