import 'package:flutter/material.dart';

import '../list_page_builder.dart';

class FilmsPageWidget extends StatelessWidget {
  const FilmsPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListPageBuilder(itemContent: Text('Films'));
  }
}
