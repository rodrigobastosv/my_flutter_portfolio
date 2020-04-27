import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/medium_post_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MediumPostsList extends StatelessWidget {
  MediumPostsList(this.posts);

  final List<MediumPostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => GestureDetector(
        onTap: () async => launch(posts[i].link),
        child: ListTile(
          leading: Text(
            '${i + 1})',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          title: Text(
            posts[i].title,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      itemCount: posts.length,
    );
  }
}
