import 'package:animations/animations.dart';
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
    return ListView.builder(
      itemBuilder: (_, i) => OpenContainer(
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        openColor: Theme.of(context).scaffoldBackgroundColor,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 400),
        openBuilder: (context, action) {
          return AppPage(apps[i]);
        },
        closedBuilder: (context, action) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
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
          );
        },
      ),
      itemCount: apps.length,
    );
  }
}
