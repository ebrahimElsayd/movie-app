import 'package:flutter/material.dart';
import 'package:movies_app/API/ApiManager.dart';
import 'package:movies_app/model/sourcesResponse/Results.dart';
import 'TmdbService.dart';

class SearchScreen extends StatefulWidget {
  static const routName='Search';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Results> _searchResults = [];
  TmdbService _tmdbService = TmdbService();
  bool _isLoading = false;
  Future<void> _performSearch(String query) async {
    setState(() {
      _isLoading = true;
    });

    List<Results> results = await _tmdbService.searchMovies(query);

    setState(() {
      _searchResults = results;
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (value) => _performSearch(_searchController.text),
              controller: _searchController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width:1,color: Color(0xFFFFFFFF)),
                      borderRadius: BorderRadius.circular(50)
                  ),
                  filled: true,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Color(0xFF707070)),
                  fillColor: Color(0xFF514F4F),
                  prefixIcon: Icon(Icons.search,color: Colors.white,),
              ),

            ),
    ),
          _isLoading
              ? Center(
            child: CircularProgressIndicator(),
          )
          :Expanded(
            child: _searchResults.isEmpty
                ? Center(
              child: Image.asset('assets/images/Group 22.png')
            )
                : ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${_searchResults[index].title}"),
                  subtitle: Text("${_searchResults[index].overview}"),
                  leading: _searchResults[index].posterPath != null
                      ? Image.network(
                    '${ApiManager.imagePath}${_searchResults[index].posterPath}',
                    width: 50,
                  )
                      : Container(
                    width: 50,
                    child: Center(child: Text('No Image')),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}