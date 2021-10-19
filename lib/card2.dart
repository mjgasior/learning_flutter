import 'package:flutter/material.dart';

import 'author_card.dart';
import 'fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The art of chleb';
  final String description = 'Learn to make bardzo dobry chleb';
  final String chef = 'Michał J. Gąsior';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Stack(
          children: [
            const AuthorCard(),
            Positioned(
                child: Text(description,
                    style: FooderlichTheme.darkTextTheme.bodyText1),
                bottom: 30,
                right: 0),
            Positioned(
                child:
                    Text(chef, style: FooderlichTheme.darkTextTheme.bodyText1),
                bottom: 10,
                right: 0),
          ],
        ),
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mag5.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}