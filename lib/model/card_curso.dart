import 'package:flutter/material.dart';

import '../constants.dart';
import 'category.dart';

class CardCurso extends StatelessWidget {
  int index;
  CardCurso(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: index.isEven ? 200 : 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(categories[index].image),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            categories[index].name,
            style: kTitleTextStyle,
          ),
          Text("${categories[index].numOfCourses} Cursos")
        ],
      ),
    );
  }
}
