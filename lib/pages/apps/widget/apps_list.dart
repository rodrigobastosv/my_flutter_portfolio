import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/app_model.dart';

import '../app_page.dart';

class AppsList extends StatelessWidget {
  AppsList(this.apps);

  final List<AppModel> apps;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, i) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          CupertinoPageRoute(builder: (_) => AppPage(apps[i])),
        ),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FancyShimmerImage(
              imageUrl: apps[i].logo,
              width: 60,
              height: 60,
              boxFit: BoxFit.contain,
            ),
          ),
          title: Text(
            apps[i].name,
          ),
        ),
      ),
      itemCount: apps.length,
      separatorBuilder: (_, i) => Divider(),
    );
  }
}
