// ignore_for_file: non_constant_identifier_names, unnecessary_this

class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? releaseDate;
  String? overview;
  String? posterPath;
  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview,
      this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = parsedJson['vote_average'] * 1.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
    this.releaseDate = parsedJson['release_date'];
  }
}
