import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'Page_builder.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';
import 'constant.dart';
import './arabic_sura_number.dart';

class PageListScreen extends StatefulWidget {
  const PageListScreen({Key? key}) : super(key: key);

  @override
  State<PageListScreen> createState() => _PagesQuranScreen();
}

class _PagesQuranScreen extends State<PageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          //"القرآن",
          "صفحات القرآن",
          style: TextStyle(
              //fontFamily: 'quran',
              fontSize: 35,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        // backgroundColor: const Color.fromARGB(255, 56, 115, 59),
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error(1)");
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }

  Container indexCreator(quran, context) {
    return Container(
      color: const Color.fromARGB(255, 221, 250, 236),
      child: ListView(
        children: [
          for (int i = 0; i < PagesOfVerses.length; i++)
            Container(
              color: i % 2 == 0 ? KBackgroundColor : kListViewPageColor,
              child: TextButton(
                child: PagesOfVerses[i]['page2'] == "0"
                    ? Text(
                        " الصفحة ( ${PagesOfVerses[i]['page1']} )",
                        style: const TextStyle(
                          fontSize: 16,
                          color: kFontsColor,
                          fontFamily: 'ElMessiri',
                        ),
                        textDirection: TextDirection.rtl,
                      )
                    : Text(
                        " الصفحة ( ${PagesOfVerses[i]['page1']} )  والصفحة ( ${PagesOfVerses[i]['page2']} )",
                        style: const TextStyle(
                          fontSize: 18,
                          color: kFontsColor,
                          fontFamily: 'ElMessiri',
                          // shadows: [
                          //   Shadow(
                          //     offset: Offset(.5, .5),
                          //     blurRadius: 1.0,
                          //     color: Color.fromARGB(255, 250, 6, 6),
                          //   )
                          // ]
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                onPressed: () {
                  FloatingActionButtonIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageBuilder(
                        arabic: quran[0],
                        Page: i,
                        PageNumber:
                            " الصفحة ( ${PagesOfVerses[i]['page1']} )  والصفحة ( ${PagesOfVerses[i]['page2']} )",
                        ayah: 0,
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
