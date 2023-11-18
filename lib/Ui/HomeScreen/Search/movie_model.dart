class MovieModel {
  String? movie_title;
  int? movie_release_year; // Change the data type to int
  String? movie_poster_url;
  double? rating;
  String? overview;

  MovieModel(this.movie_title, String releaseDate, this.rating,this.overview, this.movie_poster_url) {
    // Parse the year from the release date string
    if (releaseDate.isNotEmpty) {
      final dateParts = releaseDate.split('-');
      if (dateParts.isNotEmpty) {
        movie_release_year = int.tryParse(dateParts[0]);
    }
    }
    }
}