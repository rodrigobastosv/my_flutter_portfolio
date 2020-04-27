import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedCard(
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
              text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
