import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaperhub/Categories/Wallpaper_model.dart';

Widget brandname(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[

      Text("Wallpaper", style: TextStyle(
          color: Color(0xffFCA5F1),
        letterSpacing: 1.5,
        fontFamily: 'Lobster',
        fontSize: 30.0
      ),),
      Text("Club",style: TextStyle(
          color: Color(0xffFC766AFF,),
          letterSpacing: 1.5,
          fontFamily: 'Lobster',
          fontSize: 30.0
      ),)

    ],
  );
}
Widget wallpapersList({List<WallpaperModel> wallpapers, context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:16.0) ,
    child: GridView.count(
        shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((e) {
        return GridTile(
          child: Container(
            child: Image.network(e.src.portrait),
          ),
        );
      }).toList(),
    ),
  );
}



// Widget wallpapersList({List<WallpaperModel> wallpapers, context}){
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.symmetric(horizontal:16.0),
//       child: GridView.count(
//         shrinkWrap: true,
//           crossAxisCount: 2,
//         childAspectRatio: 0.6,
//         mainAxisSpacing: 6.0,
//         crossAxisSpacing: 6.0,
//         children: wallpapers.map((wallpaper){
//           return GridTile(
//             child: Container(
//               child: Image.network(wallpaper.src.portrait),
//
//             ),
//           );
//         }).toList(),
//
//       ),
//     ),
//   );
// }