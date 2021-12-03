// ignore_for_file: unused_import, unused_local_variable

import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'movie.dart';

class HttpHelper {
  final String urlKey = 'api_key=42afd4a370c177be68c564f530b6036b';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBox = 'https://api.themoviedb.org/3/search/movie?api_key=42afd4a370c177be68c564f530b6036b&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;

    http.Response result = await http.get(Uri.parse(
        upcoming)); // uri.parse used to convert String to Uri, because in http ^0.13.0 we can't insert String Argument to Uri Parameter :v

    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies (String title) async {
    final String query = urlSearchBox + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    }else{
      return null;
    }

  }
}
