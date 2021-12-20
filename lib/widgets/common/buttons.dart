import 'package:flutter/material.dart';
import 'package:flutter_gmp/generated/l10n.dart';

class TileTextButton extends StatelessWidget {
  final bool isShareButton;

  final VoidCallback onTap;
  const TileTextButton.addToFavorites({
    Key? key,
    required this.onTap,
  })  : isShareButton = false,
        super(key: key);

  const TileTextButton.share({
    Key? key,
    required this.onTap,
  })  : isShareButton = true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          isShareButton
              ? S.of(context).shareBtn
              : S.of(context).addToFavoritesBtn,
        ));
  }
}
