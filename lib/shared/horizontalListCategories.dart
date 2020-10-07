import 'package:flutter/material.dart';

//constants
import 'package:puranapustaks/constants/customColor.dart';

class HorizontalListCategoriesClass extends StatelessWidget {

  List categories = [["HOME",1],["NEPALI",0],["FOREIGN",0],["SCHOOL",0],["COLLEGE",0],["UNIVERSITY",0],["LANGUAGE",0],["ENTRANCE",0],["OTHERS",0]];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      color: Colors.green,
      height: MediaQuery.of(context).size.height/20,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for( var i = 0 ; i < categories.length; i++ ) InkWell(
            child: (
                CategoryInList(categories[i][0], categories[i][1])
            ),
            onTap: (){
              for (var j = 0; j < categories.length; j++)(
                categories[j][1] = 0
              );
              categories[i][1] = 1;
            },
          ),
        ],
      ),
    );
  }
}

class CategoryInList extends StatelessWidget {
  String category;
  int active;

  CategoryInList(
    this.category,
    this.active
  );

  getColor(active) {
    if (active == 1) {
      return [Colors.black,Colors.white];
    } else {
      return [Colors.white,createMaterialColor(Color(0xFF129935))];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColor(active)[1],
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width/35, 0.0, MediaQuery.of(context).size.width/35, 0.0),
      alignment: Alignment.center,
      child: Text(category, style: TextStyle(color: getColor(active)[0], fontWeight: FontWeight.bold, fontSize: 15.0),),
    );
  }
}
