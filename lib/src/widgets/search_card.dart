import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/show.dart';

/// A widget for displaying search results.
class SearchCard extends StatelessWidget {
  final Show show;
  final VoidCallback onTap;
  final double width;
  const SearchCard({
    super.key,
    required this.show,
    required this.onTap,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: show.originalImageUrl,
                width: width,
                height: width * 1.35,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
