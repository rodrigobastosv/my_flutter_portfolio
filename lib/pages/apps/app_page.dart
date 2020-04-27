import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/app_model.dart';
import 'package:my_flutter_portfolio/model/package_model.dart';
import 'package:url_launcher/url_launcher.dart';

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
            color: Colors.black,
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
            children: <Widget>[
              Text(
                'Description: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                widget.app.description,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              CarouselSlider.builder(
                itemCount: widget.app.images.length,
                itemBuilder: (_, i) => Card(
                  child: FancyShimmerImage(
                    imageUrl: widget.app.images[i],
                  ),
                ),
                options: CarouselOptions(
                  aspectRatio: 1,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Release Date: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    widget.app.releaseDate.toUtc().toString(),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Wrap(
                      children: getBadges(widget.app.stuffUsed),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> getBadges(List<UsedPackageInfoModel> stuffUsed) {
    return stuffUsed
        .map(
          (stuff) => GestureDetector(
            onTap: () async => launch(stuff.pubLink),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Chip(
                backgroundColor: Color(
                  int.parse(widget.app.mainColor),
                ),
                padding: EdgeInsets.all(0),
                label: Text(
                  stuff.name,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
        .toList();
  }
}
