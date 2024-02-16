// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khatma/constant.dart';

import '../quran_kareem/constant.dart';
import '../utils/app_data.dart';
import '../utils/sql_helper.dart';
import '../widgets/CounterControlles.dart';

class ReadingAldaeia extends StatefulWidget {
  static const screenRoute = '/ReadingAldaeia';

  @override
  State<ReadingAldaeia> createState() => _ReadingAldaeiaState();
}

class _ReadingAldaeiaState extends State<ReadingAldaeia> {
  final CounterController counterController = Get.put(CounterController());
  List<Map<String, dynamic>> _journals = [];
  // This function is used to fetch all data from the database
  void _refreshJournals() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _journals = data;
    });
  }

  void initState() {
    super.initState();
    _refreshJournals(); // Loading the diary when the app starts
  }

  late String title;
  late int counterReading = 0;
  void show(int id) {
    final existingJournal = _journals
        .firstWhere((element) => element['id'] == id, orElse: () => {});

    ///var found = _journals.firstWhereOrNull((e) => e['id'] == id);
    if (existingJournal.isEmpty) return;
    title = existingJournal['title'];
    print("title:$title");

    counterReading = int.parse(existingJournal['NumberOfReadings']);

    print("counter:$counterReading");
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

////لادوخ بيها معناها دالة من نوع وجدت تستقبل نص
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  double dx = 0;
  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routearguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final IDALduea = routearguments["id"];

    final ALduea = Aladeia_data.firstWhere((Alduea) => Alduea.id == IDALduea);
    //حاليا تم ايقافة لمنع ظهور الفلوتنك بوتون فب صفحة التعليمات ونية القراءة

    show(int.parse("${ALduea.id}"));
    ; ////عملية سحب الايدي الخاص بكل تصنيف ومن خلال هذا الايدي نستطيع الحصول على التصنيفات المرتبطة بهذا الايدي
    ///firstWhere لاننا نبحث عن دعاء واحد

    return Scaffold(
      appBar: AppBar(
        title: Text("${ALduea.title}"),
      ),
      //تستخدم عندما يكون التصميم اكبر من حجم الشاشة تجعلة قابل للتمرير
      body: Stack(children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(

              /// color: Colors.yellow,
              border: Border.all(
            color: Theme.of(context).cardColor,
          )),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.only(right: 15, left: 15),
                  child: _convertHadith(context, ALduea.textAladua))
            ],
          )),
        ),
        Positioned(

            /// left: MediaQuery.of(context).size.width / 2,

            right: 20.0,
            bottom: 20.0,
            child: Draggable(

                ///تسمح هذه الخاصية بتحديد الويدجت التي يتم عرضها أثناء سحب الويدجت.
                feedback: Container(
                    child: FloatingActionButton(
                        child: Icon(Icons.add), onPressed: () {})),
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                )),

                //تسمح هذه الخاصية بتحديد الويدجت التي يتم عرضها بينما يتم سحب الويدجت.
                childWhenDragging: Container(),
                //تسمح هذه الخاصية بتحديد الإجراء الذي يتم تنفيذه عند انتهاء سحب الويدجت.

                onDragEnd: (details) {
                  setState(() {
                    ///لكي تقف على الوضع الحالي
                  });
                  // print(position);
                  // print(position.dx);
                  // print(position.dy);
                })),
        // Container(
        //   height: 300,
        //   width: double.infinity,
        //   child: Image.network(
        //     GetIdALduea.imageUrl,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        // SizedBox(height: 10),
        // buildSectionTitle(context, "${GetIdALduea.title}"),
        // Padding(
        //   padding: const EdgeInsets.only(right: 15, left: 15),
        //   child: _convertHadith(context, ALduea.textAladua),
        // ),
      ]),
    );
  }
}

RichText _convertHadith(BuildContext context, String text) {
  text = text.replaceAll('(', '{');
  text = text.replaceAll(')', '}');

  List<String> split = text.split(RegExp("{"));

  List<String> hadiths = split.getRange(1, split.length).fold([], (t, e) {
    var texts = e.split("}");

    if (texts.length > 1) {
      return List.from(t)
        ..addAll(
            ["{${texts.first}}", "${e.substring(texts.first.length + 1)}"]);
    }
    return List.from(t)..add("{${texts.first}");
  });

  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(
        fontSize: arabicFontSize,
        fontFamily: arabicFont,
        color: kFontsColor,
      ),
      //style: DefaultTextStyle.of(context).style,
      children: [TextSpan(text: split.first)]..addAll(hadiths
          .map((text) => text.contains("{")
              ? TextSpan(
                  text: text,
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold))
              : TextSpan(text: text))
          .toList()),
    ),
    textDirection: TextDirection.ltr,
  );
}
