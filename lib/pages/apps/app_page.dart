import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/app_model.dart';
import 'package:my_flutter_portfolio/pages/apps/widget/description.dart';
import 'package:my_flutter_portfolio/pages/apps/widget/images.dart';
import 'package:my_flutter_portfolio/pages/apps/widget/release.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widget/stuff.dart';

class AppPage extends StatefulWidget {
  AppPage(this.app);

  final AppModel app;

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(
          int.parse(widget.app.mainColor),
        ),
        title: Text(
          widget.app.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color(int.parse(widget.app.titleColor)),
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: widget.app.googlePlayLink != null
          ? GestureDetector(
              onTap: () async => launch(widget.app.googlePlayLink),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage: AssetImage('assets/images/google_play.webp'),
                radius: 30,
              ),
            )
          : SizedBox.shrink(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Description(widget.app.description),
              Divider(),
              Images(widget.app.images),
              Divider(),
              Release(widget.app.releaseDate),
              Divider(),
              Stuff(
                widget.app.stuffUsed,
                widget.app.mainColor,
                widget.app.titleColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
