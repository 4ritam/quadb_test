import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/show.dart';
import '../views/details_screen.dart';

/// A widget for displaying the featured show on the home screen.
class LandingCard extends StatelessWidget {
  final Show show;
  const LandingCard({super.key, required this.show});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 165,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Hero(
              tag: show.id,
              child: CachedNetworkImage(
                imageUrl: show.originalImageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            show.name.toUpperCase(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...show.genres
                .sublist(0, show.genres.length > 3 ? 3 : show.genres.length)
                .map((genre) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(genre,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400)),
              );
            }),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          //Buttons
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {},
              label: const Text('Play'),
              icon: const Icon(Icons.play_arrow),
            ),
            const SizedBox(width: 16),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(show: show),
                  ),
                );
              },
              child: const Text('Details'),
            ),
          ],
        )
      ],
    );
  }
}
