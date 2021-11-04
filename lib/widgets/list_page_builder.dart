import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ListPageBuilder extends StatelessWidget {
  final Widget itemContent;

  const ListPageBuilder({
    Key? key,
    required this.itemContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, dateIndex) {
        return StickyHeader(
          header: Container(
            height: 30.0,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Header #$dateIndex',
            ),
          ),
          content: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, filmIndex) {
              return ListTile(
                title: itemContent,
              );
            },
          ),
        );
      },
    );
  }
}
