import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/movieModel.dart';
import '../providers/movieProvider.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends State<FavoritePage> {
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
    var favList = context.watch<MovieProvider>().favList;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Favorite Movies")),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.builder(
          itemCount: favList.length,
          itemBuilder: (context, index) {
            MovieModel current_movie = favList[index];
            return Card(
              elevation: 5,
              child: ListTile(
                  title: Text(current_movie.title),
                  subtitle: Text(current_movie.duration),
                  trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromFavorite(current_movie);
                    },
                    child: Text("Remove",
                        style: TextStyle(color: Colors.red, fontSize: 14)),
                  )),
            );
          },
        ),
      ),
    );
  }
}
