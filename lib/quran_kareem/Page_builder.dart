import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';
import '../main.dart';

import '../utils/sql_helper.dart';
import '../widgets/CounterControlles.dart';

///import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

//ignore: must_be_immutable
class PageBuilder extends StatefulWidget {
  final Page;
  final arabic;
  final PageNumber;
  int ayah;

  PageBuilder(
      {Key? key, this.Page, this.arabic, this.PageNumber, required this.ayah})
      : super(key: key);

  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  bool view = true; //لتغير شكل الصفحة

  IncrementCounter _incrementCounter = IncrementCounter();

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getPagesOfVersesCounter();
      _refreshJournals();
    });
    super.initState();
  }

  List<Map<String, dynamic>> _journals = [];

  bool _isLoading = true;
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
      _refreshJournals(); // Loading the diary when the app starts
    });
  }

  late String title;
  late int counterReading = 0;
  void show(int id) {
    if (id != null) {
      final existingJournal = _journals
          .firstWhere((element) => element['id'] == id, orElse: () => {});

      ///var found = _journals.firstWhereOrNull((e) => e['id'] == id);
      if (existingJournal.isEmpty) return;
      title = existingJournal['title'];
      print("title:$title");

      counterReading = int.parse(existingJournal['NumberOfReadings']);

      print("counter:$counterReading");
    }
  }

  Future<void> _addItem(
      String id, String title, String NumberOfReadings) async {
    await SQLHelper.createItem(int.parse(id), title, NumberOfReadings);
    _refreshJournals();
  }

  // Update an existing journal
  Future<void> _updateItem(
      String id, String title, String NumberOfReadings) async {
    await SQLHelper.updateItem(int.parse(id), title, title);
    _refreshJournals();
  }

  Row verseBuilder(int index, previousVerses) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //if (index + previousVerses == 6231) const RetunBasmala(),
              ///سورة الفاتحة
              (index + previousVerses == 0) ||

                      ///سورة البقرة
                      (index + previousVerses == 8 - 1) ||
                      (index + previousVerses == 294 - 1) ||

                      ///سورة ال عمران
                      (index + previousVerses == 494 - 1) ||

                      ///سورة  النساء
                      (index + previousVerses == 670 - 1) ||

                      ///سورة  المائدة
                      (index + previousVerses == 790 - 1) ||

                      ///سورة الانعام
                      (index + previousVerses == 955 - 1) ||

                      ///سورة الاعراف
                      (index + previousVerses == 1161 - 1) ||

                      ///سورة الانفال
                      (index + previousVerses == 1236 - 1) ||

                      ///سورة التوبة
                      (index + previousVerses == 1365 - 1) ||

                      ///سورة يونس
                      (index + previousVerses == 1474 - 1) ||

                      ///سورة هود
                      (index + previousVerses == 1597 - 1) ||

                      ///سورة يوسف
                      (index + previousVerses == 1708 - 1) ||

                      ///سورةالرعد
                      (index + previousVerses == 1751 - 1) ||

                      ///سورة ابراهيم
                      (index + previousVerses == 1803 - 1) ||

                      ///سورة الحجر
                      (index + previousVerses == 1902 - 1) ||

                      ///سورة النحل
                      (index + previousVerses == 2030 - 1) ||

                      ///سورةالاسراء
                      (index + previousVerses == 2141 - 1) ||

                      ///سورة الكهف
                      (index + previousVerses == 2251 - 1) ||

                      ///سورة مريم
                      (index + previousVerses == 2349 - 1) ||

                      ///سورة طه
                      (index + previousVerses == 2484 - 1) ||

                      ///سورة الانبياء
                      (index + previousVerses == 2596 - 1) ||

                      ///سورة الحج
                      (index + previousVerses == 2674 - 1) ||

                      ///سورة المؤمنون
                      (index + previousVerses == 2798 - 1) ||

                      ///سورة النور
                      (index + previousVerses == 2886 - 1) ||

                      ///سورة الفرقان
                      (index + previousVerses == 2933 - 1) ||

                      ///سورة الشعراء
                      (index + previousVerses == 3160 - 1) ||

                      ///سورة النمل
                      (index + previousVerses == 3253 - 1) ||

                      ///سورة القصص
                      (index + previousVerses == 3341 - 1) ||

                      ///سورة العنكبوت
                      (index + previousVerses == 3410 - 1) ||

                      ///سورة الروم
                      ///سورة لقمان
                      (index + previousVerses == 3470 - 1) ||

                      ///سورة السجدة
                      (index + previousVerses == 3504 - 1) ||

                      ///سورة الاحزاب
                      (index + previousVerses == 5334 - 1) ||

                      ///سورة سبأ
                      (index + previousVerses == 3607 - 1) ||

                      ///سورة فاطر
                      (index + previousVerses == 3661 - 1) ||

                      ///سورة يس
                      (index + previousVerses == 3706 - 1) ||

                      ///سورة الصافات
                      (index + previousVerses == 3789 - 1) ||

                      ///سورة ص
                      (index + previousVerses == 3971 - 1) ||

                      ///سورة الزمر
                      (index + previousVerses == 4059 - 1) ||

                      ///سورةغافر
                      (index + previousVerses == 4134 - 1) ||

                      ///سورة فصلت
                      (index + previousVerses == 4291 - 1) ||

                      ///سورة الشورى
                      (index + previousVerses == 4273 - 1) ||

                      ///سورة الزخرف
                      (index + previousVerses == 4326 - 1) ||

                      ///سورة الدخان
                      (index + previousVerses == 4415 - 1) ||

                      ///سورة الجاثية
                      (index + previousVerses == 4474 - 1) ||

                      ///سورة الاححقاف
                      (index + previousVerses == 4711 - 1) ||

                      ///سورة محمد
                      (index + previousVerses == 4546 - 1) ||

                      ///سورة الفتح
                      (index + previousVerses == 4584 - 1) ||

                      ///سورة الحجرات
                      (index + previousVerses == 4613 - 1) ||

                      ///سورة ق
                      (index + previousVerses == 4631 - 1) ||

                      ///سورة الذاريات
                      (index + previousVerses == 4676 - 1) ||

                      ///سورة الطور
                      (index + previousVerses == 4736 - 1) ||

                      ///سورة النجم
                      (index + previousVerses == 4785 - 1) ||

                      ///سورة القمر
                      (index + previousVerses == 4874 - 1) ||

                      ///سورةالرحمن
                      (index + previousVerses == 4902 - 1) ||

                      ///سورة الواقعة
                      (index + previousVerses == 4980 - 1) ||

                      ///سورةالحديد
                      (index + previousVerses == 5076 - 1) ||

                      ///سورةالمجادلة
                      (index + previousVerses == 5105 - 1) ||

                      ///سورة الحشر
                      (index + previousVerses == 5127 - 1) ||

                      ///سورةالممتحنة
                      (index + previousVerses == 5151 - 1) ||

                      ///سورة الصف
                      (index + previousVerses == 5164 - 1) ||

                      ///سورةالجمعة
                      (index + previousVerses == 5178 - 1) ||

                      ///سورة المنافقون
                      (index + previousVerses == 5189 - 1) ||

                      ///سورة التغابن
                      (index + previousVerses == 5200 - 1) ||

                      ///سورة الطلاق
                      (index + previousVerses == 5218 - 1) ||

                      ///سورة التحريم
                      (index + previousVerses == 5230 - 1) ||

                      ///سورة الملك
                      (index + previousVerses == 5242 - 1) ||

                      ///سورة القلم
                      (index + previousVerses == 5272 - 1) ||

                      ///سورة الحاقة
                      (index + previousVerses == 5324 - 1) ||

                      ///سورة المعارج
                      (index + previousVerses == 5376 - 1) ||

                      ///سورة نوح
                      (index + previousVerses == 5420 - 1) ||

                      ///سورةالجن
                      (index + previousVerses == 5440 - 1) ||

                      ///سورة المزمل
                      (index + previousVerses == 5476 - 1) ||

                      ///سورة المدثر
                      (index + previousVerses == 5490 - 1) ||

                      ///سورة القيامة
                      (index + previousVerses == 5552 - 1) ||

                      ///سورة الانسان
                      (index + previousVerses == 5592 - 1) ||

                      ///سورةالمراسلات
                      (index + previousVerses == 5623 - 1) ||

                      ///سورة النبأ
                      (index + previousVerses == 5673 - 1) ||

                      ///سورة النازعات
                      (index + previousVerses == 5713 - 1) ||

                      ///سورة عبس
                      (index + previousVerses == 5759 - 1) ||

                      ///سورة التكوير
                      (index + previousVerses == 5802 - 1) ||

                      ///سورة الانفطار
                      (index + previousVerses == 5830 - 1) ||

                      ///سورة المطففين
                      (index + previousVerses == 5849 - 1) ||

                      ///سورة الانشقاق
                      (index + previousVerses == 5885 - 1) ||

                      ///سورة البروج
                      (index + previousVerses == 5910 - 1) ||

                      ///سورة الطارق
                      (index + previousVerses == 5932 - 1) ||

                      ///سورة الاعلى
                      (index + previousVerses == 5949 - 1) ||

                      ///سورةالغاشية
                      (index + previousVerses == 5968 - 1) ||

                      ///سورة الفجر
                      (index + previousVerses == 5994 - 1) ||

                      ///سورة البلد
                      (index + previousVerses == 6024 - 1) ||

                      ///سورة الشمس
                      (index + previousVerses == 6044 - 1) ||

                      ///سورةالليل
                      (index + previousVerses == 6059 - 1) ||

                      ///سورة الضحى
                      (index + previousVerses == 6080 - 1) ||

                      ///سورة الشرح
                      (index + previousVerses == 6091 - 1) ||

                      ///سورة التين
                      (index + previousVerses == 6099 - 1) ||

                      ///سورة العلق
                      (index + previousVerses == 6107 - 1) ||

                      ///سورة القدر
                      (index + previousVerses == 6126 - 1) ||

                      ///سورةالبينة
                      (index + previousVerses == 6131 - 1) ||

                      ///سورةالزلزلة
                      (index + previousVerses == 6139 - 1) ||

                      ///سورة العاديات
                      (index + previousVerses == 6147 - 1) ||

                      ///سورة القارعة
                      (index + previousVerses == 6158 - 1) ||

                      ///سورة التكاثر
                      (index + previousVerses == 6169 - 1) ||

                      ///سورة العصر
                      (index + previousVerses == 6177 - 1) ||

                      ///سورة الهمزة
                      (index + previousVerses == 6180 - 1) ||

                      ///سورة الفيل
                      (index + previousVerses == 6189 - 1) ||

                      ///سورة قريش
                      (index + previousVerses == 6194 - 1) ||

                      ///سورة الماعون
                      (index + previousVerses == 6198 - 1) ||

                      ///سورة الكوثر
                      (index + previousVerses == 6205 - 1) ||

                      ///سورة الكافرون
                      (index + previousVerses == 6208 - 1) ||

                      ///سورة النصر
                      (index + previousVerses == 6214 - 1) ||

                      ///سورة المسد
                      (index + previousVerses == 6217 - 1) ||

                      ///سورة الاخلاص
                      (index + previousVerses == 6222 - 1) ||

                      ///سورة الفلق
                      (index + previousVerses == 6226 - 1) ||

                      ///سورة الناس
                      (index + previousVerses == 6231 - 1)
                  ? const RetunBasmala()
                  : const Text(''),
              Text(
                widget.arabic[index + previousVerses]['aya_text'],
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: arabicFontSize,
                  fontFamily: arabicFont,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }

  SafeArea SinglePageBuilder(LenghtOfPages) {
    // and bottomLeft

    String fullSura = '';
    int previousVerses = 0;
    if (widget.Page + 1 != 1) {
      for (int i = widget.Page - 1; i >= 0; i--) {
        previousVerses = previousVerses + NumberOfVerses_on_each_page[i];
      }
    }

    if (!view)
      for (int i = 0; i < LenghtOfPages; i++) {
        fullSura += (widget.arabic[i + previousVerses]['aya_text']);
      }

    return SafeArea(
      child: Container(
        color: Color.fromARGB(255, 235, 234, 227),
        child: view
            ? ScrollablePositionedList.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      // (index == 0) || (widget.Page == 8) || (widget.Page == 1)
                      //     ? const Text('')
                      //     : const RetunBasmala(),
                      Container(
                        color:
                            index % 2 == 0 ? KBackgroundColor : kQuranPageColor,
                        child: PopupMenuButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: verseBuilder(index, previousVerses),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      saveBookMark(widget.Page + 1, index);
                                    },
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.bookmark_add,
                                          color:
                                              Color.fromARGB(255, 56, 115, 59),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Bookmark'),
                                      ],
                                    ),
                                  ),
                                  PopupMenuItem(
                                    onTap: () {},
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: const [
                                        Icon(
                                          Icons.share,
                                          color:
                                              Color.fromARGB(255, 56, 115, 59),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Share'),
                                      ],
                                    ),
                                  ),
                                ]),
                      ),
                    ],
                  );
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
                itemCount: LenghtOfPages, ////تحدد عدد الصفحات
              )
            : ListView(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // widget.Page + 1 != 1 && widget.Page + 1 != 9
                            //     ? const RetunBasmala()
                            //     : const Text(''),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                fullSura, //mushaf mode
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: mushafFontSize,
                                  fontFamily: arabicFont,
                                  color: const Color.fromARGB(196, 44, 44, 44),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Offset position = Offset(100, 100);
    int LengthOfPage = NumberOfVerses_on_each_page[widget.Page];
    show(int.parse("${widget.Page}"));

    ///عدد الايات لهذة السورة

    ///  theme: ThemeData(primarySwatch: Colors.yellow),

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          floatingActionButton: Draggable(
              feedback: Container(
                child: FloatingActionButton(
                    child: Icon(Icons.add), onPressed: () {}),
              ),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FloatingActionButton.large(
                    onPressed: () {
                      print("CounterOfPages old: ${counterReading}");

                      {
                        setState(() async {
                          _incrementCounter.counter = counterReading;
                          _incrementCounter.incrementCounter();
                          counterReading = _incrementCounter.counter;

                          if (counterReading <= 30) {
                            await _addItem("${widget.Page}",
                                "${widget.PageNumber}", "$counterReading");
                          }
                        });
                      }
                    },
                    // tooltip: "$counterReading",
                    // backgroundColor: Color.fromRGBO(23, 182, 134, 1),
                    child: Text(
                      "${counterReading}",
                      style: TextStyle(
                        fontSize: 50,
                        fontFamily: arabicFont,
                        color: Color.fromRGBO(255, 254, 254, 1),
                      ),
                    ),
                  ),
                ),
              ),
              childWhenDragging: Container(),
              //تسمح هذه الخاصية بتحديد الإجراء الذي يتم تنفيذه عند انتهاء سحب الويدجت.

              onDragEnd: (details) {
                setState(() {
                  position = details.offset;

                  ///لكي تقف على الوضع الحالي
                });
                // print(position);
                // print(position.dx);
                // print(position.dy);
              }),

          // floatingActionButton: Container(
          //   width: 150.0,
          //   height: 150.0,
          //   child: Padding(
          //     padding: const EdgeInsets.only(bottom: 50.0),
          //     child: GetBuilder<CounterBuilder>(
          //         init: CounterBuilder(),
          //         builder: (Value) => FloatingActionButton(
          //             onPressed: () {
          //               print("CounterOfPages old: ${counterReading}");

          //               {
          //                 setState(() async {

          //                   Value.bcounter = counterReading;
          //                   Value.increment();
          //                   Value.bcounter;
          //                   print("${Value.bcounter}");
          //                   counterReading = Value.bcounter;
          //                   if (counterReading <= 30) {
          //                     await _addItem("${widget.Page}",
          //                         "${widget.PageNumber}", "$counterReading");
          //                   }
          //                 });
          //               }
          //             },
          //             backgroundColor: Color.fromRGBO(23, 182, 134, 1),
          //             child: Transform.translate(
          //               offset: Offset(dx, 5),
          //               child: Text(
          //                 "${counterReading}",
          //                 style: TextStyle(
          //                   color: Color.fromRGBO(255, 254, 254, 1),
          //                   fontSize: 50.0,
          //                   fontStyle: FontStyle.normal,
          //                 ),
          //               ),
          //             )
          //             )

          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  padding: EdgeInsets.only(left: 10),
                  icon:
                      Icon(Icons.arrow_back, textDirection: TextDirection.rtl),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
            leading: Tooltip(
              message: 'Mushaf Mode',
              child: TextButton(
                child: const Icon(
                  Icons.chrome_reader_mode,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    view = !view;
                  });
                },
              ),
            ),
            centerTitle: true,
            title: Text(
              // widget.
              widget.PageNumber,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'quran',
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
          body: SinglePageBuilder(LengthOfPage) // and bottomLeft
          ),
    );
  }
}

class RetunBasmala extends StatelessWidget {
  const RetunBasmala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      const Center(
        child: Text(
          'بسم الله الرحمن الرحيم',
          style: TextStyle(fontFamily: 'me_quran', fontSize: 30),
          textDirection: TextDirection.rtl,
        ),
      ),
    ]);
  }
}
