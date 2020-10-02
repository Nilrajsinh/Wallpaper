import 'package:flutter/material.dart';
import 'package:wallpaperhub/Views/Category.dart';
import 'package:wallpaperhub/Views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'WallpaperClub',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: 'main',
      routes: {
        'Category' : (context) => CategoryPage(),
        'main': (context) => Home()
      },
      home: Home(),

    );

  }
}

