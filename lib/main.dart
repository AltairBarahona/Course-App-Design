import 'package:CourseApp/constants.dart';
import 'package:CourseApp/details_screen.dart';
import 'package:CourseApp/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'model/card_curso.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Course App',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  final Function presionado;

  const HomeScreen({Key key, this.presionado}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 50, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SvgPicture.asset("assets/icons/menu.svg"),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://scontent.fuio1-1.fna.fbcdn.net/v/t1.0-9/25660411_1962115577334598_1357919134389895982_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHkK6njCHrHrUB04kX4nnARikMpEN0hDRGKQykQ3SENEc0O5RbyYWeErGm4lpoy0n6kvmVxCaKxiIbG_g28VWDy&_nc_ohc=LtKlHK_90w8AX-MA459&_nc_ht=scontent.fuio1-1.fna&oh=8fe8083cef7b1c530e1783a2c01a3db5&oe=606F8F8C"),
                ),
                // Image.asset("assets/images/user.png")
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Text("Hey Altair Barahona", style: kHeadingextStyle),
            Text("Encuentra un curso que te gustaría aprender",
                style: kSubheadingextStyle),
            SizedBox(height: 30),
            TextField(
              // autofocus: true,
              // textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                // counter: Text("Letras ${nombre.length}"),
                hintText: "Buscar un curso",
                labelText: "Buscar un curso",
                helperText: "Busca un curso de tu interés",
                // suffixIcon: Icon(Icons.tag_faces),
                // icon: Icon(Icons.search),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 30),

            // Container(
            //   margin: EdgeInsets.symmetric(vertical: 30),
            //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            //   height: MediaQuery.of(context).size.height * 0.075,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       color: Color(0xFFF5F5F7),
            //       borderRadius: BorderRadius.circular(40)),
            //   child: Row(
            //     children: <Widget>[
            //       SvgPicture.asset("assets/icons/search.svg"),
            //       SizedBox(width: 16),
            //       Text(
            //         "Busca lo que sea",
            //         style: TextStyle(fontSize: 18, color: Color(0xFFA0A5BD)),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Categoría", style: kTitleTextStyle),
                Text(
                  "Ver Todos",
                  style: kSubtitleTextSyule.copyWith(color: kBlueColor),
                )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(0),
                crossAxisCount: 2,
                itemCount: categories.length,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            courseName: categories[index].name,
                            pathImage: categories[index].image,
                          ),
                        ),
                      );
                    },
                    child: CardCurso(index),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              ),
            ),
          ],
        ),
      ),
      // drawer: Drawer(),
    );
  }
}
