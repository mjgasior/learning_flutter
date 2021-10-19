import 'package:flutter/material.dart';

import 'circle_image.dart';
import 'fooderlich_theme.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      required this.imageProvider})
      : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleImage(imageProvider: widget.imageProvider, imageRadius: 28),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.authorName,
                        style: FooderlichTheme.darkTextTheme.headline2),
                    Text(widget.title, style: FooderlichTheme.darkTextTheme.headline3),
                  ],
                )
              ],
            ),
            IconButton(
                iconSize: 30,
                color: _isFavorited ? Colors.red[400] : Colors.grey[400],
                onPressed: () {
                  setState(() {
                    _isFavorited = !_isFavorited;
                  });
                  const snackBar = SnackBar(content: Text('Press fav!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border))
          ],
        ));
  }
}
