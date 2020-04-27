import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/package_model.dart';
import 'package:url_launcher/url_launcher.dart';

class Stuff extends StatelessWidget {
  Stuff(this.packages, this.mainColor, this.titleColor);

  final List<UsedPackageInfoModel> packages;
  final String mainColor;
  final String titleColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Column(
        children: <Widget>[
          Text(
            'Packages:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Wrap(
                  children: getBadges(packages, mainColor, titleColor),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> getBadges(List<UsedPackageInfoModel> stuffUsed, String mainColor,
      String titleColor) {
    return stuffUsed
        .map(
          (stuff) => GestureDetector(
            onTap: () async => launch(stuff.pubLink),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Chip(
                backgroundColor: Color(
                  int.parse(mainColor),
                ),
                padding: EdgeInsets.all(0),
                label: Text(
                  stuff.name,
                  style: TextStyle(color: Color(int.parse(titleColor))),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
