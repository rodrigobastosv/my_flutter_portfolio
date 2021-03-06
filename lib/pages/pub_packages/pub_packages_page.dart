import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/pub_package_model.dart';
import 'package:my_flutter_portfolio/widget/loading.dart';

import 'widget/pub_packages_list.dart';

class PubPackagesPage extends StatefulWidget {
  @override
  _PubPackagesPageState createState() => _PubPackagesPageState();
}

class _PubPackagesPageState extends State<PubPackagesPage> {
  bool isLoading = true;
  List<PubPackageModel> myPackages;

  @override
  void initState() {
    Firestore.instance
        .collection('pub_dev')
        .getDocuments()
        .then((querySnapshot) {
      final documentSnapshots = querySnapshot.documents;
      setState(() {
        myPackages = List.generate(documentSnapshots.length,
            (i) => PubPackageModel.fromJson(documentSnapshots[i].data));
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'My Pub.dev Packages',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: isLoading ? Loading() : PubPackagesList(myPackages),
    );
  }
}
