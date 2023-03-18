import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khatma/models/Aladeia.dart';

import 'package:khatma/quran_kareem/constant.dart';
import 'package:khatma/quran_kareem/surahList_Scrren.dart';
import 'package:khatma/screen/Aladeia_Screen.dart';
import 'package:khatma/screen/Customers_List.dart';
import 'package:khatma/screen/Home_Screen.dart';

import 'package:khatma/screen/ReadingAldaeia_Screen.dart';
import 'package:khatma/utils/sql_helper.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatma/widgets/CounterControlles.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
      await getCounter();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ar', 'AE'), // English, no country code
      ],
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Khatma',
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          //accentColor: Colors.teal[400],
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      ////  home: const IndexPage(),

      /// static const هذاه الكلامات معناها استطيع استخدم المتغير بدون اعمل اوبجكت جديد من الكلاس
      initialRoute: '/', //المسار الاولى للتطبيق
      routes: {
        '/': (ctx) => HomeScreen(), //هذا السطر يقوم بوظيفة الصفحة الرئسية
        AladeiaScreen.screenRoute: (ctx) => AladeiaScreen(),
        ReadingAldaeia.screenRoute: (ctx) => ReadingAldaeia(),
        CustomerListPage.screenRoute: (ctx) => CustomerListPage(),
      },
    );
  }
}
