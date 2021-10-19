import 'package:flutter/material.dart';

import 'author_card.dart';
import 'fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          children: [
            const AuthorCard(
                authorName: "Jan Sześcian",
                title: "Smooth",
                imageProvider: AssetImage('assets/author_mjg.png')),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                      child: Text('Recipe',
                          style: FooderlichTheme.darkTextTheme.headline1),
                      right: 16,
                      bottom: 16),
                  Positioned(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text('Smoothies',
                            style: FooderlichTheme.darkTextTheme.headline1),
                      ),
                      bottom: 70,
                      left: 16),
                ],
              ),
            )
          ],
        ),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/mag5.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
      ),
    );
  }
}
