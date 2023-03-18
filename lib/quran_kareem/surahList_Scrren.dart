import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'mydrawer.dart';
import 'surah_builder.dart';
import 'constant.dart';
import './arabic_sura_number.dart';

class surahListScreen extends StatefulWidget {
  const surahListScreen({Key? key}) : super(key: key);

  @override
  State<surahListScreen> createState() => _surahListScreenState();
}

class _surahListScreenState extends State<surahListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Go to bookmark',
        child: const Icon(Icons.bookmark),
        onPressed: () async {
          FloatingActionButtonIsClicked = true;
          if (await readBookmark() == true) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SurahBuilder(
                          arabic: quran[0],
                          sura: bookmarkedSura - 1,
                          suraName: arabicName[bookmarkedSura - 1]['name'],
                          ayah: bookmarkedAyah,
                        )));
          }
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "القرآن الكريم",
          // "Quran",
          style: TextStyle(
              //fontFamily: 'quran',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ]),
        ),
        //  backgroundColor: const Color.fromARGB(255, 56, 115, 59),
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
          for (int i = 0; i < 114; i++)
            Container(
              color: i % 2 == 0 ? KBackgroundColor : kListViewPageColor,
              child: TextButton(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(8.0),
                  child: Row(
                    /// mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      SizedBox(
                        width: 300,
                        child: Text(
                          arabicName[i]['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontFamily: 'ElMessiri',
                            // shadows: [
                            //   Shadow(
                            //     offset: Offset(.5, .5),
                            //     blurRadius: 1.0,
                            //     color: Color.fromARGB(255, 0, 0, 0),
                            //   )
                            // ]
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: ArabicSuraNumber(i: i),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  FloatingActionButtonIsClicked = false;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                        arabic: quran[0],
                        sura: i,
                        suraName: arabicName[i]['name'],
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
