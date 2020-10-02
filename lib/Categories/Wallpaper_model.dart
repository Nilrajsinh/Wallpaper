class WallpaperModel{
  String photographer;
  String photographer_url;
  int photographer_id;
  SrcModel src;

  WallpaperModel({this.photographer, this.photographer_id, this.photographer_url, this.src});

  factory WallpaperModel.fromMap(Map<String,dynamic>jsondata){
    return WallpaperModel(
        src: SrcModel.fromMap(jsondata[["src"]]),
      photographer: jsondata["photographer"],
      photographer_url: jsondata["photographer_url"],
      photographer_id: jsondata["photographer_id"],

    );
  }
}

class SrcModel{

  String original;
  String small;
  String portrait;

  SrcModel({this.original, this.portrait, this.small});

  factory SrcModel.fromMap(Map<String,dynamic>jsondata){
    return SrcModel(
      original: jsondata["original"],
      small: jsondata["small"],
      portrait: jsondata["portrait"],

    );
  }


}