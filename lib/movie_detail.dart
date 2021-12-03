// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500';
  MovieDetail(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    double height = MediaQuery.of(context).size.height;

    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath.toString();
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Image.network(path),
                height: height / 1.5,
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(movie.overview.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
