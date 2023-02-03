import 'package:flutter/material.dart';

class CelebrityImage extends StatelessWidget {
  const CelebrityImage({
    required this.imageName,
    super.key,
  });

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageName,
      height: 300,
      width: 300,
    );
  }
}
