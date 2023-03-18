import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../quran_kareem/mydrawer.dart';
import '../utils/app_data.dart';
import '../widgets/Home_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const screenRoute = '/categroy-App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text("لا تهجروا القرآن والصدقة"),
        ),
        backgroundColor: Colors.teal[400],
        body: Container(
          padding: const EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
            bottom: 60,
          ),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/124.jpg"),
            fit: BoxFit.cover,
          )),
          child: Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 10,
              right: 20,
              bottom: 60,
            ),
            // color: Colors.white10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: GridView(
              padding: const EdgeInsets.only(
                top: 10,
                left: 8,
                right: 8,
                bottom: 10,
              ),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 240,
                  childAspectRatio: 1.75,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0),
              children: Categories_data.map(
                (categoryData) => HomeItem(
                    categoryData.id, categoryData.title, categoryData.imageUrl),
              ).toList(),
            ),
          ),
        ));
  }
}
