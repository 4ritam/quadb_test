import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/show.dart';

/// A widget for displaying individual shows in the list.
class ShowCard extends StatelessWidget {
  final Show show;
  final VoidCallback onTap;
  final bool isHero;
  final double width;
  const ShowCard({
    super.key,
    required this.show,
    required this.onTap,
    required this.width,
    this.isHero = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: isHero
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: show.mediumImageUrl,
                width: width,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
