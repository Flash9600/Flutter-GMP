import 'package:flutter/material.dart';

import '../list_page_builder.dart';

class FavoritePageWidget extends StatelessWidget {
  const FavoritePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListPageBuilder(itemContent: Text('Favorite'));
  }
}
