import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/model/sourcesResponse/SourcesResponse.dart';
class ApiManager{
  static const baseUrl='api.themoviedb.org';
  static const apiKey='ddb4c0d881ae48fd71ff8e4d2d2d2d4f';
  static const imagePath="https://image.tmdb.org/t/p/w500/";
  Future<SourcesResponse> getSources(String categoryId)async{
    Uri uri=Uri.https(baseUrl,'3/search/movie',{
      "apiKey":apiKey,
    });
    var response =await http.get(uri);
    var json=jsonDecode((response.body));
    var sourcesResponse =SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  Future<SourcesResponse>searchMovies(String query)async{
    Uri uri=Uri.https(baseUrl,'3/search/movie',{
      "apiKey":apiKey,'q':query
    });
    var response =await http.get(uri);
    var json=jsonDecode((response.body));
    var sourcesResponse =SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
}