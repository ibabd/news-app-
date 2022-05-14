


import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_flutter_egypt/model/news_model.dart';

class NewsViewModel extends GetxController{

  grtData(String category)async{
    String url='https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=d112449ce7dd4001bf8fd64974b32ddb';
    var response=await(http.get(Uri.parse(url)));
    if(response.statusCode ==200){
      try{
        return NewsModel.fromJson(jsonDecode(response.body));
      }
      catch(e){
        Get.snackbar('can not get data', e.toString());

      }
    }
  }
}