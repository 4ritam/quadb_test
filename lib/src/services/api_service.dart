import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quadb_test/src/models/show.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

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
