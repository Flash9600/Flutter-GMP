import 'package:flutter/material.dart';
import 'package:flutter_gmp/services/http_api_service.dart';

class FilmImage extends StatelessWidget {
  final String? path;
  final double? width;
  final double? height;

  const FilmImage({
    Key? key,
    this.path,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      HttpApiService.getImageUrl(path),
      height: height,
      width: width,
    );
  }
}
