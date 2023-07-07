import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/providers/movieProvider.dart';

import 'Ui/HomePage.dart';

void main() {
  // Use Provider To run app
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => MovieProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}
