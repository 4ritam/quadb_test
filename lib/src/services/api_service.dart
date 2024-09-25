import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quadb_test/src/models/show.dart';

/// Service class for making API calls to the TVMaze API.
class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  /// Fetches a list of all shows.
  ///
  /// Returns a [Future] that completes with a [List] of [Show] objects.
  Future<List<Show>> getShows() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      data.removeWhere((item) => item['show']['image'] == null);
      return data.map((item) => Show.fromJson(item['show'])).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  /// Searches for shows based on a query string.
  ///
  /// Returns a [Future] that completes with a [List] of [Show] objects.
  Future<List<Show>> searchShows(String query) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      data.removeWhere((item) => item['show']['image'] == null);
      return data.map((item) => Show.fromJson(item['show'])).toList();
    } else {
      throw Exception('Failed to search shows');
    }
  }
}
