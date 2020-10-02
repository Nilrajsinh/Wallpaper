import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaperhub/Categories/Category_model.dart';
import 'package:wallpaperhub/dat/Data.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  List<category> categories = new List();


  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff5f8fd),
                  borderRadius: BorderRadius.circular(16)
                ),
                padding: EdgeInsets.symmetric(horizontal: 24),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search Wallpaper",
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    Icon(Icons.search,color: Color(0xffFC766AFF),)
                  ],),),
              SizedBox(height: 16,),
              Container(
               height: 550,
                child: ListView.builder(
                  itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index){
                    return Cattile(
                      title: categories[index].categorieName ,
                      Imgurl: categories[index].Imgurl,
                    );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
class Cattile extends StatelessWidget {
 final String Imgurl, title;

 Cattile({@required this.title,@required this.Imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6),
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
               child: Image.network(Imgurl,fit: BoxFit.cover,height: 300,width: 150,),),

          Container(

            color: Colors.black26,
            height: 300,
            width: 150,
            alignment: Alignment.center,
            child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25,letterSpacing: 1.5),),
          )
        ],
      ),
    );
  }
}

