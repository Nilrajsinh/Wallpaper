import 'dart:convert';
import 'dart:ui';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhub/Categories/Wallpaper_model.dart';
import 'package:wallpaperhub/Views/Category.dart';
import 'package:wallpaperhub/Views/MainHome.dart';
import 'package:wallpaperhub/Views/Widget/widget.dart';
import 'package:wallpaperhub/dat/Data.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class _HomeState extends State<Home> {

  int _selectedindex = 0;
  int _counter = 0;
  PageController _pageController;

  List<WallpaperModel>wallpapers = new List();

  getTrendingWallpaper() async{

    setState(() async{
      var response = await http.get("https://api.pexels.com/v1/search?query=trending&per_page=80",
          headers: {
            "Authorization": apikey
          });
      Map<String,dynamic> jsondata = jsonDecode(response.body);
      jsondata["photos"].forEach((element){
        // print(element);
        WallpaperModel wallpaperModel = new WallpaperModel();
        wallpaperModel = WallpaperModel.fromMap(element);
        wallpapers.add(wallpaperModel);
        print(wallpaperModel);

      });
      setState(() {

      });
    });
  }

 @override
  void initState() {
   super.initState();


   _pageController = PageController();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(
          toolbarHeight: 45,
          backgroundColor: Colors.white,
          title: brandname(),
          elevation: 0.0,
        ),

        body: Container(
          child: SizedBox.expand(
            child: Container(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedindex = index);
                },
                children: <Widget>[
                  Container(child: MyHome()),
                  Container(child: CategoryPage(),),

                ],

              ),
            ),),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedindex,
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.easeInBack,
          onItemSelected: (int index) { setState(() => _selectedindex = index);
          _pageController.jumpToPage(index); },
          items: [
            BottomNavyBarItem(

                icon: Icon(Icons.home),
                title: Text('home'),
              activeColor: Color(0xffFC766AFF),
              inactiveColor: Color(0xffFCA5F1)
            ),
            BottomNavyBarItem(icon: Icon(Icons.list),
                title: Text('Category'),
                activeColor: Color(0xffFC766AFF),
                inactiveColor: Color(0xffFCA5F1)
            ),
          ],

        ),

      ),


    );
  }
}
