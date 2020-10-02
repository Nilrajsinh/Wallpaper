import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperhub/Categories/Wallpaper_model.dart';
import 'package:wallpaperhub/Views/Widget/widget.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperhub/dat/Data.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  List<WallpaperModel>wallpapers = new List();

  getTrendingWallpaper() async{
    setState(() async{
      var response = await http.get("https://api.pexels.com/v1/search?query=trending&per_page=80",
          headers: {
            "Authorization": apikey});
    //  print(response.body.toString());

      Map<String,dynamic> jsondata = jsonDecode(response.body);
      jsondata["photos"].forEach((element){
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(element);
      });
      setState(() {

      });
    });
  }
  @override
  void initState() {
    getTrendingWallpaper();
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: wallpapersList(wallpapers: wallpapers,context: context),

    );

  }
}
