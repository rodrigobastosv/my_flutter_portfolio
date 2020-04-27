import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/model/pub_package.dart';
import 'package:url_launcher/url_launcher.dart';

class PubPackagesList extends StatelessWidget {
  PubPackagesList(this.packages);

  final List<PubPackage> packages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => GestureDetector(
        onTap: () async => launch(packages[i].pubLink),
        child: ListTile(
          title: Text(packages[i].name),
          subtitle: Text(packages[i].version),
          trailing: GestureDetector(
            onTap: () async => launch('${packages[i].pubLink}#-analysis-tab-'),
            child: CircleAvatar(
              child: Text(
                packages[i].score.toString(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
      ),
      itemCount: packages.length,
    );
  }
}
