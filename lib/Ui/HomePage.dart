import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/movieModel.dart';
import '../providers/movieProvider.dart';
import 'FavoritePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movieList = context.watch<MovieProvider>().movies;
    var favList = context.watch<MovieProvider>().favList;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Provider")),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  child: Center(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        color: Colors.white,
                        Icons.favorite,
                        size: 30,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Go To My List (${favList.length})",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  MovieModel current_movie = movieList[index];
                  return Card(
                    elevation: 5,
                    color: Colors.blue,
                    child: ListTile(
                        title: Text(current_movie.title),
                        subtitle: Text(current_movie.duration),
                        trailing: IconButton(
                          onPressed: () {
                            if (!favList.contains(current_movie)) {
                              context
                                  .read<MovieProvider>()
                                  .addToFavorite(current_movie);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeFromFavorite(current_movie);
                            }
                          },
                          icon: Icon(favList.contains(current_movie)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined),
                          color: Colors.white,
                          iconSize: 30,
                        )),
                  );
                },
              ))
            ],
          )),
    );
  }
}
