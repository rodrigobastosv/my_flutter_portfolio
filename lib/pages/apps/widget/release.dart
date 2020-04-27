import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class Release extends StatelessWidget {
  Release(this.releaseDate);

  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      child: Column(
        children: <Widget>[
          Text(
            'Release Date:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                releaseDate.toUtc().toString(),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
