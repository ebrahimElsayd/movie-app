// search_bloc.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/model/sourcesResponse/Results.dart';

class TmdbService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your TMDB API key

  Future<List<Results>> searchMovies(String query) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&query=$query'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      if (data.containsKey('results')) {
        List<dynamic> results = data['results'];
        return results.map((movieData) => Results.fromJson(movieData)).toList();
      }
    }

    return []; // Return an empty list if there's an error or no results
  }
}

