import 'package:flutter/material.dart';
import 'package:subping/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subping/modules/design_system/subping_ui.dart';

class SearchResults extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SubpingColor.white100,
          elevation: 0,
      ),
      body: Column(children: <Widget>[
          SearchCategories(),
      ],),
    );
  }
}

class SearchCategories extends StatefulWidget {

  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  List<String> searchCategories = ["상품","리뷰"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: searchCategories.length,
        itemBuilder: (context,index)=> buildSearchCategories(index),
        ),
    );
  }

  Widget buildSearchCategories(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        searchCategories[index],
        style: TextStyle(
          color: Colors.red[200]
        ),
        ),
    );
  }
}