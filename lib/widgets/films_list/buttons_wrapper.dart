import 'package:flutter/material.dart';
import 'package:flutter_gmp/widgets/common/buttons.dart';

class ButtonsWrapperWidget extends StatelessWidget {
  final VoidCallback addToFavoritesOnTap;
  final VoidCallback shareOnTap;

  const ButtonsWrapperWidget({
    required this.addToFavoritesOnTap,
    required this.shareOnTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TileTextButton.addToFavorites(onTap: addToFavoritesOnTap),
            TileTextButton.share(onTap: shareOnTap),
          ],
        ),
      ],
    );
  }
}
