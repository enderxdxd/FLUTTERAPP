import 'package:http/http.dart' as http;
import 'dart:convert';  // Corrected the quotation mark
import '../api_config.dart';
import 'movie.dart';

class MovieService {
  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/movie/popular?api_key=${ApiConfig.apiKey}'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body) as Map<String, dynamic>;
      final List<dynamic> results = data['results'] as List<dynamic>;
      return results.map<Movie>((json) => Movie.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      // Improved error handling: Log the status code and response body for better debugging.
      throw Exception('Failed to fetch movies. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }
}
