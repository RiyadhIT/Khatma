import 'package:flutter/material.dart';

import 'package:khatma/quran_kareem/surahList_Scrren.dart';
import 'package:khatma/screen/Aladeia_Screen.dart';
import 'package:khatma/screen/Home_Screen.dart';
import 'package:path/path.dart';

import '../quran_kareem/PageList_Screen.dart';
import '../screen/Customers_List.dart';
import '../screen/ReadingAldaeia_Screen.dart';

class HomeItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  HomeItem(this.id, this.title, this.imageUrl);

  void selectCategory(BuildContext NewPage) {
    Navigator.of(NewPage).pushNamed(AladeiaScreen.screenRoute,
        arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (id == 'c1') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => surahListScreen(),
            ),
          );
        }
        ////زيارة عاشوراء
        else if (id == 'c2') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1000",
            },
          );
        }
        //////'دعاء الفرج',
        else if (id == 'c3') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1001",
            },
          );
        }
        //// 'دعاء الندبة',
        else if (id == 'c4') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1002",
            },
          );
        }
        ////'الصلاة على محمد وال محمد',
        else if (id == 'c5') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1003",
            },
          );
        }
        //////'صفحات القرآن الكريم  ',
        else if (id == 'c7') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PageListScreen(),
            ),
          );
        }
        //////'قائمة المقروئات ',
        else if (id == 'c8') {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerListPage(),
            ),
          );
        }

        ///تعليمات الاشتراك
        else if (id == 'c9') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1007",
            },
          );
        }

        ///نية القرأة
        else if (id == 'c10') {
          Navigator.of(context).pushNamed(
            ReadingAldaeia.screenRoute,
            arguments: {
              "id": "1008",
            },
          );
        } else {
          selectCategory(context);
        }
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: SizedBox(
            height: 250,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //   child: Image.asset(
                //     imageUrl,
                //     height: 250,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        //decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.wavy,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.clip,
                        fontFamily: "ElMessiri"),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 248, 248),
                    borderRadius: BorderRadius.circular(15),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
