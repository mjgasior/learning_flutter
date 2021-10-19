import 'package:flutter/material.dart';

import 'circle_image.dart';

class AuthorCard extends StatelessWidget {
  const AuthorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleImage(
        imageProvider: AssetImage('assets/author_mjg.png'));
  }
}
