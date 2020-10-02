import 'package:wallpaperhub/Categories/Category_model.dart';

String apikey = '563492ad6f917000010000018e4b1f413de14b4eb91c12e4cecb9252';


List<category> getCategories(){

  List <category> categories = new List();
  category categorieModel = new category();

  //
  categorieModel.Imgurl =
  "https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Street Art";
  categories.add(categorieModel);
  categorieModel = new category();

  //
  categorieModel.Imgurl =
  "https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Wild Life";
  categories.add(categorieModel);
  categorieModel = new category();

  //
  categorieModel.Imgurl =
  "https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categorieModel.categorieName = "Nature";
  categories.add(categorieModel);
  categorieModel = new category();


  return categories;
  //

}