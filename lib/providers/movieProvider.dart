import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../model/movieModel.dart';

final List<MovieModel> initData = List.generate(
    50,
    (index) => MovieModel(
        title: "Movie $index",
        duration: "${Random().nextInt(100) + 60} minutes"));

class MovieProvider extends ChangeNotifier {
  // List of All movies
  final List<MovieModel> _movieList = initData;

  List<MovieModel> get movies => _movieList;

  // List of Favorite movies
  final List<MovieModel> _myList = [];

  List<MovieModel> get favList => _myList;

  void addToFavorite(MovieModel movie) {
    favList.add(movie);
    notifyListeners(); // update the UI
  }

  removeFromFavorite(MovieModel movie) {
    favList.remove(movie);
    notifyListeners();
  }
}
