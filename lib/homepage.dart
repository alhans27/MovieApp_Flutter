// ignore_for_file: avoid_unnecessary_containers, unnecessary_this, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie_detail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MovieList();
  }
}

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List? result;
  HttpHelper? helper;
  int? movieCount;
  List? movies;
  final String iconBase = 'https://image.tmdb.org/t/p/w92';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
  Icon visibleIcon = Icon(Icons.search);
  Widget searchBar = Text('Movies');

  Future initialize() async {
    movies = await helper!.getUpcoming();
    setState(() {
      movieCount = movies!.length;
      movies = movies;
    });
  }

  Future search(text) async {
    movies = await helper!.findMovies(text);
    setState(() {
      movieCount = movies!.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NetworkImage image;
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        actions: <Widget>[
          IconButton(
            icon: visibleIcon,
            onPressed: () {
              setState(() {
                if (this.visibleIcon.icon == Icons.search) {
                  this.visibleIcon = Icon(Icons.cancel);
                  this.searchBar = TextField(
                    onSubmitted: (String text) {
                      search(text);
                    },
                    textInputAction: TextInputAction.search,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  );
                } else {
                  setState(() {
                    this.visibleIcon = Icon(Icons.search);
                    this.searchBar = Text('Movies');
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: (this.movieCount == null) ? 0 : this.movieCount,
          itemBuilder: (BuildContext context, int position) {
            if (movies![position].posterPath != null) {
              image = NetworkImage(iconBase + movies![position].posterPath);
            } else {
              image = NetworkImage(defaultImage);
            }

            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: image,
                ),
                title: Text(movies![position].title),
                subtitle: Text('Released: ' +
                    movies![position].releaseDate +
                    ' - Vote: ' +
                    movies![position].voteAverage.toString()),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies![position]));
                  Navigator.push(context, route);
                },
              ),
            );
          }),
    );
  }
}
