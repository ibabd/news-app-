import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_flutter_egypt/model/news_model.dart';
import 'package:news_flutter_egypt/view_model/news_view_model.dart';

class Science extends GetWidget<NewsViewModel> {
  final controller = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.grtData('science'),
        builder: (context, AsyncSnapshot snapshot) {
          //data شايل كل حاجه فى api
          NewsModel? data = snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              //data.articles دى اليست الى شايله الداتا كلها
              itemCount: data!.articles!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          data.articles![index].urlToImage.toString(),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      data.articles![index].title.toString(),
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      data.articles![index].description.toString(),
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.grey),
                      textDirection: TextDirection.rtl,
                    ),
                  ],
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
    );
  }
}