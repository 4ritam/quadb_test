import 'package:quadb_test/config/extentions/html_clean.dart';

/// Represents a TV show with its details.
class Show {
  const Show({
    required this.id,
    required this.name,
    required this.mediumImageUrl,
    required this.originalImageUrl,
    required this.genres,
    required this.rating,
    required this.yearOfRelease,
    required this.summary,
  });

  final int id;
  final String name;
  final List<String> genres;
  final double rating;
  final String mediumImageUrl;
  final String originalImageUrl;
  final String yearOfRelease;
  final String summary;

  /// Represents a TV show with its details.
  factory Show.fromJson(Map<String, dynamic> show) {
    return Show(
      id: show['id'],
      name: show['name'],
      genres: List<String>.from(show['genres']),
      rating: show['rating']['average'] == null
          ? 0.0
          : show['rating']['average'].toDouble(),
      yearOfRelease: show['premiered'] ?? 'N/A',
      mediumImageUrl: show['image']?['medium'] ?? '',
      originalImageUrl: show['image']?['original'] ?? '',
      summary: (show['summary'] as String).cleanHTML(),
    );
  }
}
