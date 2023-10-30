import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        // AspectRatio => if you put height it handle width based on height and otherwise
        aspectRatio: 1 / 1.45, //  width/height
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          errorWidget: (ctx, url, error) => const Icon(Icons.error),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
