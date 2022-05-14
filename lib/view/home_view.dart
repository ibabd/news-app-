import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_flutter_egypt/model/news_model.dart';
import 'package:news_flutter_egypt/view/bottom_navigation_bar/health.dart';
import 'package:news_flutter_egypt/view/bottom_navigation_bar/science.dart';
import 'package:news_flutter_egypt/view/bottom_navigation_bar/sports.dart';
import 'package:news_flutter_egypt/view_model/news_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = Get.put(NewsViewModel());

  int currentIndex= 0;

  List<Widget> screens=[
    Sports(),
    Science(),
    Health(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
       onTap: (val){
          setState(() {
            currentIndex =val;
          });
       },
       items: [
          BottomNavigationBarItem(
              label:'Sports',
              icon: Icon(Icons.sports_baseball),
          ),
          BottomNavigationBarItem(
            label:'Science',
            icon: Icon(Icons.science),
          ),
          BottomNavigationBarItem(
            label:'Health',
            icon: Icon(Icons.health_and_safety),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          'الأخبار المصريه',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10,right: 10,left: 10),
          padding: EdgeInsets.symmetric(vertical: 5),
          child: screens[currentIndex]),
    );
  }
}