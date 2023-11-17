import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../homeScreen.dart';
import 'movie_model.dart';

class Search extends StatefulWidget {
  static const String routename = 'search';

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  static const imagePath="https://image.tmdb.org/t/p/w500/";
  final TextEditingController _searchController = TextEditingController();
  List<MovieModel> searchResults = [];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white60),
                  borderRadius: BorderRadius.circular(50),
                ),
                filled: true,
                hintText: 'Search',
                hintStyle: TextStyle(color: Color(0xFF707070)),
                fillColor: Color(0xFF363534),
                prefixIcon: Icon(Icons.search, color: Colors.white),
              ),
              style: TextStyle(color: Colors.white,fontSize: 24),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    _performSearch(value);
                  });

                } else {
                  // Clear the search results when the search term is empty
                  setState(() {
                    searchResults.clear();
                  });
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child:searchResults.isEmpty
            ? Center(
            child: Image.asset('assets/images/Group 22.png')
            ):ListView.builder(
                itemCount: searchResults.length,
                itemBuilder: (context, index) {
                  final movie = searchResults[index];
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 2,margin: EdgeInsets.symmetric(horizontal:13), color: Colors.grey),
                      ListTile(
                        onTap:()=>homeScreen(),
                        title: Text(movie.movie_title ?? '',style: TextStyle(color: Colors.white),),
                        subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${movie.movie_release_year}',style: TextStyle(color: Colors.white70),),
                            //Text('${movie.overview}',style: TextStyle(color: Colors.white70))
                            
                          ],
                        )
                  // Text('${movie.movie_release_year}',style: TextStyle(color: Colors.white70),),
                        ,leading: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                                height: 89,
                                width: 120,
                                child: Image.network(
                                    filterQuality: FilterQuality.high,
                                    fit: BoxFit.cover,
                                    '${imagePath}${movie.movie_poster_url ?? ''}'
                                ),
                            ),
                        ),
                  // Image.network('${imagePath}${movie.movie_poster_url ?? ''}'),
                        // trailing: Text(' ${movie.rating}'),
                  // )
                      )
                  ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _performSearch(String searchTerm) async {
    // Build the API URL using the search term
    final url = 'https://api.themoviedb.org/3/search/movie?query=$searchTerm&include_adult=false&language=en-US&page=1';

    // Make the HTTP request using the Authorization header
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwZWQ1YjVjNGMxODMwOTRmMjFkZDEzYTk4NDUyMTZkMSIsInN1YiI6IjY1NGEzZmRhNjMzMmY3MDBhZDdlMzE2YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.mku0CavQ88UZHN0FeAUl1T9_ymo41rptGNrmZsDN-X8',
    });

    // Decode the JSON response
    final data = jsonDecode(response.body);

    // Handle the search results
    if (data['results'] != null) {
      List<MovieModel> results = (data['results'] as List)
          .map((result) => MovieModel(
          result['title'],
          result['release_date'],
          result['vote_average'].toDouble(),
          result['overview'],
          result['poster_path'],
      )
      )
          .toList();

      setState(() {
        searchResults = results;
        print(data);
      });
    } else {
      print(data);
      print('no movie found');
      setState(() {
        searchResults.clear();
      });
    }
    }
}
