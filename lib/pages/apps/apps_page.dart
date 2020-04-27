import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/app_model.dart';
import 'package:my_flutter_portfolio/widget/loading.dart';

import 'widget/apps_list.dart';

class AppsPage extends StatefulWidget {
  @override
  _AppsPageState createState() => _AppsPageState();
}

class _AppsPageState extends State<AppsPage> {
  List<Widget> items = [
    Image.asset('assets/images/1.jpeg'),
    Image.asset('assets/images/2.jpeg'),
    Image.asset('assets/images/3.jpeg'),
    Image.asset('assets/images/4.jpeg'),
  ];

  bool isLoading = true;
  List<AppModel> apps = [];

  @override
  void initState() {
    Firestore.instance
        .collection('apps')
        .getDocuments()
        .then((querySnapshot) async {
      final documents = querySnapshot.documents;
      for (var document in documents) {
        apps.add(await AppModel.fromJson(document.data));
      }
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Apps on PlayStore',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading ? Loading() : AppsList(apps),
    );
  }
}
