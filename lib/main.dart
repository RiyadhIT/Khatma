import 'package:flutter/material.dart';

import 'package:khatma/quran_kareem/constant.dart';
import 'package:khatma/screen/Aladeia_Screen.dart';

import 'package:khatma/screen/Home_Screen.dart';
import 'package:khatma/screen/Ramadan_Screen.dart';

import 'package:khatma/screen/ReadingAldaeia_Screen.dart';
import 'package:khatma/screen/Reading_log.dart';
import 'package:khatma/screen/WDO_Screen.dart';
import 'package:khatma/utils/Customer_page_number.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:khatma/widgets/CounterControlles.dart';

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
      await getCustomer_page_number();
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
          useMaterial3: false,
          primarySwatch: Colors.teal,
          //accentColor: Colors.teal[400],
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 19,
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
        ReadingLog.screenRoute: (ctx) => ReadingLog(),
        RamadanScreen.screenRoute: (ctx) => RamadanScreen(),
        WDOScreen.screenRoute: (ctx) => WDOScreen(),
      },
    );
  }
}
