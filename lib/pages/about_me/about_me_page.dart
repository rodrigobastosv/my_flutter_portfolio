import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_flutter_portfolio/widget/loading.dart';

class AboutMePage extends StatefulWidget {
  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  bool isLoading;
  Map<String, dynamic> data;
  List<String> stuffIKnow;
  List<String> otherStuff;

  @override
  void initState() {
    isLoading = true;
    Firestore.instance.collection('profile').getDocuments().then((doc) {
      Firestore.instance
          .collection('profile')
          .document(doc.documents[0].documentID)
          .collection('stuff')
          .getDocuments()
          .then((stuff) {
        final documents = stuff.documents;

        Firestore.instance
            .collection('profile')
            .document(doc.documents[0].documentID)
            .collection('other_stuff')
            .getDocuments()
            .then((stuff2) {
          final documents2 = stuff2.documents;
          setState(() {
            otherStuff = List.generate(
                documents2.length, (i) => documents2[i].data['name']);
            stuffIKnow = List.generate(
                documents.length, (i) => documents[i].data['name']);
            data = doc.documents[0].data;
            isLoading = false;
          });
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? Loading()
          : SingleChildScrollView(
              child: Column(
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
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(
                      data['name'],
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['info'],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        'icons/flags/png/br.png',
                        package: 'country_icons',
                        scale: 3.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: ExpansionTileCard(
                      leading: FlutterLogo(),
                      title: Text('Why Flutter?'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            data['why'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: ExpansionTileCard(
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        backgroundImage: AssetImage('assets/images/pubdev.png'),
                      ),
                      title: Text('Packages Used'),
                      children: stuffIKnow
                          .map(
                            (s) => ListTile(
                              leading: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              title: Text(s),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: ExpansionTileCard(
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Icons.keyboard),
                      ),
                      title: Text('Other Stuff'),
                      children: otherStuff
                          .map(
                            (s) => ListTile(
                              leading: Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              ),
                              title: Text(s),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: ExpansionTileCard(
                      leading: CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Icon(Entypo.emoji_happy),
                      ),
                      title: Text('Hobbies'),
                      children: [
                        ListTile(
                          leading: Icon(
                            MaterialIcons.keyboard,
                          ),
                          title: Text('Programming (Of course)'),
                        ),
                        ListTile(
                          leading: Icon(
                            MaterialCommunityIcons.soccer,
                          ),
                          title: Text('Play soccer'),
                        ),
                        ListTile(
                          leading: Icon(
                            FontAwesome.child,
                          ),
                          title: Text('Play with my child'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
