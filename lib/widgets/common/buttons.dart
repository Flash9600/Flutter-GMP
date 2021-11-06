import 'package:flutter/material.dart';

class TileTextButton extends StatelessWidget {
  final String text;

  final VoidCallback onTap;
  const TileTextButton.addToFavorites({
    Key? key,
    required this.onTap,
  })  : text = 'ADD TO FAVORITES',
        super(key: key);

  const TileTextButton.share({
    Key? key,
    required this.onTap,
  })  : text = 'SHARE',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(text));
  }
}
