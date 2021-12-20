import 'package:flutter/material.dart';

class ErrorPageWidget extends StatelessWidget {
  final String text;

  const ErrorPageWidget(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text, style: const TextStyle(fontSize: 24)),
    );
  }
}
