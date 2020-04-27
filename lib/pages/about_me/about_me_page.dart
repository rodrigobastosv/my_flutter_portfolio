import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/widget/loading.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool isLoading;
  Map<String, dynamic> data;

  @override
  void initState() {
    isLoading = true;
    Firestore.instance.collection('profile').getDocuments().then((doc) {
      setState(() {
        data = doc.documents[0].data;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Loading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: FancyShimmerImage(
                        imageUrl: data['profilePhoto'],
                        width: 120,
                        height: 120,
                        boxFit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}
