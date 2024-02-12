import 'package:flutter/material.dart';

import 'package:khatma/quran_kareem/surahList_Scrren.dart';
import 'package:khatma/screen/Aladeia_Screen.dart';
import 'package:khatma/screen/Home_Screen.dart';
import 'package:khatma/screen/Ramadan_Screen.dart';
import 'package:khatma/screen/Reading_log.dart';
import 'package:khatma/screen/WDO_Screen.dart';
import 'package:khatma/utils/Customer_page_number.dart';
import 'package:path/path.dart';

import '../quran_kareem/PageList_Screen.dart';

import '../screen/ReadingAldaeia_Screen.dart';
import '../screen/SubscriptionMeals_Screen.dart';

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
              builder: (context) => ReadingLog(),
            ),
          );
        }

        ///تعليمات الاشتراك
        else if (id == 'c9') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SubscriptionMeals()),
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
        }

        ///صفحة تعلمات شهر رمضان
        else if (id == 'c11') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => RamadanScreen()),
          );
        }

        ///صفحة طرق التبرع للمؤسسة
        else if (id == 'c12') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => WDOScreen()),
          );
        }
        ///////للانتقال الى صفحات الادعية
        else {
          selectCategory(context);
        }
      },
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(
          top: 0.1,
          left: 5,
          right: 5,
          bottom: 0.1,
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 231, 215, 144),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              //decorationColor: Colors.red,
              decorationStyle: TextDecorationStyle.wavy,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.clip,
              fontFamily: "ElMessiri"),
        ),
      ),
    );
  }
}
