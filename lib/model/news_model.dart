class Articles{
  String ? title;
  String ? description;
  String ?urlToImage;

  Articles({
    this.title,
    this.description,
    this.urlToImage
  });

  Articles.fromJson(Map<String,dynamic>json){
    this.title=json['title'];
    this.description=json['description'];
    this.urlToImage=json['urlToImage'];
  }
}
class NewsModel{
  List<Articles>? articles;
  NewsModel({
    this.articles
  });
  NewsModel.fromJson(Map<String,dynamic>json){
    this.articles=(json["articles"] as List).map((e) =>Articles.fromJson(e)).toList();
  }
}
