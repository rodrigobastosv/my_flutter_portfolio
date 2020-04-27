import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/medium_post_model.dart';
import 'package:my_flutter_portfolio/widget/loading.dart';

import 'widge/medium_posts_list.dart';

class MediumPostsPage extends StatefulWidget {
  @override
  _MediumPostsPageState createState() => _MediumPostsPageState();
}

class _MediumPostsPageState extends State<MediumPostsPage> {
  bool isLoading = true;
  List<MediumPostModel> posts = [];

  @override
  void initState() {
    Firestore.instance
        .collection('medium_posts')
        .getDocuments()
        .then((querySnapshot) {
      final documentSnapshots = querySnapshot.documents;

      setState(() {
        posts = List.generate(documentSnapshots.length,
            (i) => MediumPostModel.fromJson(documentSnapshots[i].data));
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
          'My Medium Posts',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: isLoading ? Loading() : MediumPostsList(posts),
    );
  }
}
