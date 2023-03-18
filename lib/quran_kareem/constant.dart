// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool FloatingActionButtonIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

String arabicFont = 'quran';
double arabicFontSize = 28;
double mushafFontSize = 40;

Uri quranAppurl = Uri.parse('https://github.com/itsherifahmed');

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
  await prefs.setInt('mushafFontSize', mushafFontSize.toInt());
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = await prefs.getInt('arabicFontSize')!.toDouble();
    mushafFontSize = await prefs.getInt('mushafFontSize')!.toDouble();
  } catch (_) {
    arabicFontSize = 28;
    mushafFontSize = 40;
  }
}

saveBookMark(surah, ayah) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

readBookmark() async {
  print("read book mark called");
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}

List<Map> arabicName = [
  {"surah": "1", "name": "الفاتحة"},
  {"surah": "2", "name": "البقرة"},
  {"surah": "3", "name": "آل عمران"},
  {"surah": "4", "name": "النساء"},
  {"surah": "5", "name": "المائدة"},
  {"surah": "6", "name": "الأنعام"},
  {"surah": "7", "name": "الأعراف"},
  {"surah": "8", "name": "الأنفال"},
  {"surah": "9", "name": "التوبة"},
  {"surah": "10", "name": "يونس"},
  {"surah": "11", "name": "هود"},
  {"surah": "12", "name": "يوسف"},
  {"surah": "13", "name": "الرعد"},
  {"surah": "14", "name": "ابراهيم"},
  {"surah": "15", "name": "الحجر"},
  {"surah": "16", "name": "النحل"},
  {"surah": "17", "name": "الإسراء"},
  {"surah": "18", "name": "الكهف"},
  {"surah": "19", "name": "مريم"},
  {"surah": "20", "name": "طه"},
  {"surah": "21", "name": "الأنبياء"},
  {"surah": "22", "name": "الحج"},
  {"surah": "23", "name": "المؤمنون"},
  {"surah": "24", "name": "النور"},
  {"surah": "25", "name": "الفرقان"},
  {"surah": "26", "name": "الشعراء"},
  {"surah": "27", "name": "النمل"},
  {"surah": "28", "name": "القصص"},
  {"surah": "29", "name": "العنكبوت"},
  {"surah": "30", "name": "الروم"},
  {"surah": "31", "name": "لقمان"},
  {"surah": "32", "name": "السجدة"},
  {"surah": "33", "name": "الأحزاب"},
  {"surah": "34", "name": "سبإ"},
  {"surah": "35", "name": "فاطر"},
  {"surah": "36", "name": "يس"},
  {"surah": "37", "name": "الصافات"},
  {"surah": "38", "name": "ص"},
  {"surah": "39", "name": "الزمر"},
  {"surah": "40", "name": "غافر"},
  {"surah": "41", "name": "فصلت"},
  {"surah": "42", "name": "الشورى"},
  {"surah": "43", "name": "الزخرف"},
  {"surah": "44", "name": "الدخان"},
  {"surah": "45", "name": "الجاثية"},
  {"surah": "46", "name": "الأحقاف"},
  {"surah": "47", "name": "محمد"},
  {"surah": "48", "name": "الفتح"},
  {"surah": "49", "name": "الحجرات"},
  {"surah": "50", "name": "ق"},
  {"surah": "51", "name": "الذاريات"},
  {"surah": "52", "name": "الطور"},
  {"surah": "53", "name": "النجم"},
  {"surah": "54", "name": "القمر"},
  {"surah": "55", "name": "الرحمن"},
  {"surah": "56", "name": "الواقعة"},
  {"surah": "57", "name": "الحديد"},
  {"surah": "58", "name": "المجادلة"},
  {"surah": "59", "name": "الحشر"},
  {"surah": "60", "name": "الممتحنة"},
  {"surah": "61", "name": "الصف"},
  {"surah": "62", "name": "الجمعة"},
  {"surah": "63", "name": "المنافقون"},
  {"surah": "64", "name": "التغابن"},
  {"surah": "65", "name": "الطلاق"},
  {"surah": "66", "name": "التحريم"},
  {"surah": "67", "name": "الملك"},
  {"surah": "68", "name": "القلم"},
  {"surah": "69", "name": "الحاقة"},
  {"surah": "70", "name": "المعارج"},
  {"surah": "71", "name": "نوح"},
  {"surah": "72", "name": "الجن"},
  {"surah": "73", "name": "المزمل"},
  {"surah": "74", "name": "المدثر"},
  {"surah": "75", "name": "القيامة"},
  {"surah": "76", "name": "الانسان"},
  {"surah": "77", "name": "المرسلات"},
  {"surah": "78", "name": "النبإ"},
  {"surah": "79", "name": "النازعات"},
  {"surah": "80", "name": "عبس"},
  {"surah": "81", "name": "التكوير"},
  {"surah": "82", "name": "الإنفطار"},
  {"surah": "83", "name": "المطففين"},
  {"surah": "84", "name": "الإنشقاق"},
  {"surah": "85", "name": "البروج"},
  {"surah": "86", "name": "الطارق"},
  {"surah": "87", "name": "الأعلى"},
  {"surah": "88", "name": "الغاشية"},
  {"surah": "89", "name": "الفجر"},
  {"surah": "90", "name": "البلد"},
  {"surah": "91", "name": "الشمس"},
  {"surah": "92", "name": "الليل"},
  {"surah": "93", "name": "الضحى"},
  {"surah": "94", "name": "الشرح"},
  {"surah": "95", "name": "التين"},
  {"surah": "96", "name": "العلق"},
  {"surah": "97", "name": "القدر"},
  {"surah": "98", "name": "البينة"},
  {"surah": "99", "name": "الزلزلة"},
  {"surah": "100", "name": "العاديات"},
  {"surah": "101", "name": "القارعة"},
  {"surah": "102", "name": "التكاثر"},
  {"surah": "103", "name": "العصر"},
  {"surah": "104", "name": "الهمزة"},
  {"surah": "105", "name": "الفيل"},
  {"surah": "106", "name": "قريش"},
  {"surah": "107", "name": "الماعون"},
  {"surah": "108", "name": "الكوثر"},
  {"surah": "109", "name": "الكافرون"},
  {"surah": "110", "name": "النصر"},
  {"surah": "111", "name": "المسد"},
  {"surah": "112", "name": "الإخلاص"},
  {"surah": "113", "name": "الفلق"},
  {"surah": "114", "name": "الناس"}
];

///عدد الايات لكل صورة
List<int> noOfVerses = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

savePagesOfVersesCounter(page, PCounter) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("page", page);
  await prefs.setInt("Counter", PCounter);
}

int CounterOfPages = 0;
int page = 0;
getPagesOfVersesCounter() async {
  print("read getPagesOfVersesCounter called");
  final prefs = await SharedPreferences.getInstance();
  try {
    page = prefs.getInt('page')!;
    CounterOfPages = prefs.getInt('Counter')!;

    return true;
  } catch (e) {
    return false;
  }
}

List<Map> PagesOfVerses = [
  {"page1": "1", "page2": "0"},
  {"page1": "2", "page2": "3"},
  {"page1": "4", "page2": "5"},
  {"page1": "6", "page2": "7"},
  {"page1": "8", "page2": "9"},
  {"page1": "10", "page2": "11"},
  {"page1": "12", "page2": "13"},
  {"page1": "14", "page2": "15"},
  {"page1": "16", "page2": "17"},
  {"page1": "18", "page2": "19"},
  {"page1": "20", "page2": "21"},
  //////////
  {"page1": "22", "page2": "23"},
  {"page1": "24", "page2": "25"},
  {"page1": "26", "page2": "27"},
  {"page1": "28", "page2": "29"},
  {"page1": "30", "page2": "31"},
  {"page1": "32", "page2": "33"},
  {"page1": "34", "page2": "35"},
  {"page1": "36", "page2": "37"},
  {"page1": "38", "page2": "39"},
  {"page1": "40", "page2": "41"},
  {"page1": "42", "page2": "43"},
  ///////
  {"page1": "44", "page2": "45"},
  {"page1": "46", "page2": "47"},
  {"page1": "48", "page2": "49"},
  {"page1": "50", "page2": "51"},
  {"page1": "52", "page2": "53"},
  {"page1": "54", "page2": "55"},
  {"page1": "56", "page2": "57"},
  {"page1": "58", "page2": "59"},
  {"page1": "60", "page2": "61"},
  {"page1": "62", "page2": "63"},
  {"page1": "64", "page2": "65"},
  {"page1": "66", "page2": "67"},
  {"page1": "68", "page2": "69"},
  {"page1": "70", "page2": "71"},
  {"page1": "72", "page2": "73"},
  {"page1": "74", "page2": "75"},
  {"page1": "76", "page2": "77"},
  {"page1": "78", "page2": "79"},
  {"page1": "80", "page2": "81"},
  {"page1": "82", "page2": "83"},
  {"page1": "84", "page2": "85"},
  {"page1": "86", "page2": "87"},
  {"page1": "88", "page2": "89"},
  {"page1": "90", "page2": "91"},
  {"page1": "92", "page2": "93"},
  {"page1": "94", "page2": "95"},
  {"page1": "96", "page2": "97"},
  {"page1": "98", "page2": "99"},
  {"page1": "100", "page2": "101"},
  ////102-103

  ///////
  {"page1": "102", "page2": "103"},
  {"page1": "104", "page2": "105"},
  {"page1": "106", "page2": "107"},
  {"page1": "108", "page2": "109"},
  {"page1": "110", "page2": "111"},
  {"page1": "112", "page2": "113"},
  {"page1": "114", "page2": "115"},
  {"page1": "116", "page2": "117"},
  {"page1": "118", "page2": "119"},
  {"page1": "120", "page2": "121"},
  {"page1": "122", "page2": "123"},
  {"page1": "124", "page2": "125"},
  {"page1": "126", "page2": "127"},
  {"page1": "128", "page2": "129"},
  {"page1": "130", "page2": "131"},
  {"page1": "132", "page2": "133"},
  {"page1": "134", "page2": "135"},
  {"page1": "136", "page2": "137"},
  {"page1": "138", "page2": "139"},
  {"page1": "140", "page2": "141"},
  {"page1": "142", "page2": "143"},
  {"page1": "144", "page2": "145"},
  {"page1": "146", "page2": "147"},
  {"page1": "148", "page2": "149"},
  {"page1": "150", "page2": "151"},
  {"page1": "152", "page2": "153"},
  {"page1": "154", "page2": "155"},
  {"page1": "156", "page2": "157"},
  {"page1": "158", "page2": "159"},
  {"page1": "160", "page2": "161"},
  {"page1": "162", "page2": "163"},
  {"page1": "164", "page2": "165"},
  {"page1": "166", "page2": "167"},
  {"page1": "168", "page2": "169"},
  {"page1": "170", "page2": "171"},
  {"page1": "172", "page2": "173"},
  {"page1": "174", "page2": "175"},
  {"page1": "176", "page2": "177"},
  {"page1": "178", "page2": "179"},
  {"page1": "180", "page2": "181"},
  {"page1": "182", "page2": "193"},

  {"page1": "184", "page2": "185"},
  {"page1": "186", "page2": "187"},
  {"page1": "188", "page2": "189"},
  {"page1": "190", "page2": "191"},
  {"page1": "192", "page2": "193"},
  {"page1": "194", "page2": "195"},
  {"page1": "196", "page2": "197"},
  {"page1": "198", "page2": "199"},

  {"page1": "200", "page2": "201"},
  {"page1": "202", "page2": "202"},
  {"page1": "204", "page2": "203"},
  {"page1": "206", "page2": "205"},
  {"page1": "208", "page2": "209"},
  {"page1": "210", "page2": "211"},

  {"page1": "212", "page2": "213"},
  {"page1": "214", "page2": "215"},
  {"page1": "217", "page2": "216"},
  {"page1": "218", "page2": "219"},
  {"page1": "220", "page2": "221"},
  {"page1": "222", "page2": "223"},
  {"page1": "224", "page2": "225"},
  {"page1": "226", "page2": "227"},
  {"page1": "228", "page2": "229"},
  {"page1": "230", "page2": "231"},
  {"page1": "232", "page2": "233"},
  {"page1": "234", "page2": "235"},
  {"page1": "236", "page2": "237"},
  {"page1": "238", "page2": "239"},
  {"page1": "240", "page2": "241"},
  {"page1": "242", "page2": "243"},
  {"page1": "244", "page2": "245"},
  {"page1": "246", "page2": "247"},
  {"page1": "248", "page2": "249"},
  {"page1": "250", "page2": "251"},
  /////////252-
  ///
  {"page1": "252", "page2": "253"},
  {"page1": "254", "page2": "255"},
  {"page1": "256", "page2": "257"},
  {"page1": "258", "page2": "259"},
  {"page1": "260", "page2": "261"},
  {"page1": "262", "page2": "263"},
  {"page1": "264", "page2": "265"},
  {"page1": "266", "page2": "267"},
  {"page1": "268", "page2": "269"},
  {"page1": "270", "page2": "271"},
  {"page1": "272", "page2": "273"},
  {"page1": "274", "page2": "275"},
  {"page1": "276", "page2": "277"},
  {"page1": "278", "page2": "279"},
  {"page1": "280", "page2": "281"},
  {"page1": "282", "page2": "283"},
  {"page1": "284", "page2": "285"},
  {"page1": "286", "page2": "287"},
  {"page1": "288", "page2": "289"},
  {"page1": "290", "page2": "291"},
  {"page1": "292", "page2": "293"},
  {"page1": "294", "page2": "295"},
  {"page1": "296", "page2": "297"},
  {"page1": "298", "page2": "299"},

  ///300
  {"page1": "300", "page2": "301"},
  {"page1": "302", "page2": "303"},
  {"page1": "304", "page2": "305"},
  {"page1": "306", "page2": "307"},
  {"page1": "308", "page2": "309"},
  {"page1": "310", "page2": "311"},
  {"page1": "312", "page2": "313"},
  {"page1": "314", "page2": "315"},
  {"page1": "316", "page2": "317"},
  {"page1": "318", "page2": "319"},
  {"page1": "320", "page2": "321"},
  {"page1": "322", "page2": "323"},
  {"page1": "324", "page2": "325"},
  {"page1": "326", "page2": "327"},
  {"page1": "328", "page2": "329"},
  {"page1": "330", "page2": "331"},
  {"page1": "332", "page2": "333"},
  {"page1": "334", "page2": "335"},
  {"page1": "336", "page2": "337"},
  {"page1": "338", "page2": "339"},
  {"page1": "340", "page2": "341"},
  {"page1": "342", "page2": "343"},
  {"page1": "344", "page2": "345"},
  {"page1": "346", "page2": "347"},
  {"page1": "348", "page2": "349"},
  {"page1": "350", "page2": "351"},
  {"page1": "352", "page2": "353"},
  {"page1": "354", "page2": "355"},
  {"page1": "356", "page2": "357"},
  {"page1": "358", "page2": "359"},
  {"page1": "360", "page2": "361"},
  {"page1": "362", "page2": "363"},
  {"page1": "364", "page2": "365"},
  {"page1": "366", "page2": "367"},
  {"page1": "368", "page2": "369"},
  {"page1": "370", "page2": "371"},
  {"page1": "372", "page2": "373"},
  {"page1": "374", "page2": "375"},
  {"page1": "376", "page2": "377"},
  {"page1": "378", "page2": "379"},
  {"page1": "380", "page2": "381"},
  {"page1": "382", "page2": "383"},
  {"page1": "384", "page2": "385"},
  {"page1": "386", "page2": "387"},
  {"page1": "388", "page2": "389"},
  {"page1": "390", "page2": "391"},
  {"page1": "392", "page2": "393"},
  {"page1": "394", "page2": "395"},
  {"page1": "396", "page2": "397"},
  {"page1": "398", "page2": "399"},
  ////400000
  {"page1": "400", "page2": "401"},
  {"page1": "402", "page2": "403"},
  {"page1": "404", "page2": "405"},
  {"page1": "406", "page2": "407"},
  {"page1": "408", "page2": "409"},
  {"page1": "410", "page2": "411"},
  {"page1": "412", "page2": "413"},
  {"page1": "414", "page2": "415"},
  {"page1": "416", "page2": "417"},
  {"page1": "418", "page2": "419"},
  {"page1": "420", "page2": "421"},
  {"page1": "422", "page2": "423"},
  {"page1": "424", "page2": "425"},
  {"page1": "426", "page2": "427"},
  {"page1": "428", "page2": "429"},
  {"page1": "430", "page2": "431"},
  {"page1": "432", "page2": "433"},
  {"page1": "434", "page2": "435"},

  {"page1": "436", "page2": "437"},
  {"page1": "438", "page2": "439"},
  {"page1": "440", "page2": "441"},
  {"page1": "442", "page2": "443"},
  {"page1": "444", "page2": "445"},
  {"page1": "446", "page2": "447"},
  {"page1": "448", "page2": "449"},
  {"page1": "450", "page2": "451"},

  {"page1": "452", "page2": "453"},
  {"page1": "454", "page2": "455"},
  {"page1": "456", "page2": "457"},
  {"page1": "458", "page2": "459"},
  {"page1": "460", "page2": "461"},
  {"page1": "462", "page2": "463"},

  {"page1": "464", "page2": "465"},
  {"page1": "466", "page2": "467"},
  {"page1": "468", "page2": "469"},
  {"page1": "470", "page2": "471"},
  {"page1": "472", "page2": "473"},
  {"page1": "474", "page2": "475"},
  {"page1": "476", "page2": "477"},
  {"page1": "478", "page2": "479"},
  {"page1": "480", "page2": "481"},
  {"page1": "482", "page2": "483"},
  {"page1": "484", "page2": "485"},
  //////////
  {"page1": "486", "page2": "487"},
  {"page1": "488", "page2": "489"},
  {"page1": "490", "page2": "491"},
  {"page1": "492", "page2": "493"},
  {"page1": "494", "page2": "495"},
  {"page1": "496", "page2": "497"},
  {"page1": "498", "page2": "499"},
  ////5000
  {"page1": "500", "page2": "501"},
  {"page1": "502", "page2": "503"},
  {"page1": "504", "page2": "505"},
  {"page1": "506", "page2": "507"},
  {"page1": "508", "page2": "509"},
  {"page1": "510", "page2": "511"},
  {"page1": "512", "page2": "513"},
  {"page1": "514", "page2": "515"},
  {"page1": "516", "page2": "517"},
  {"page1": "518", "page2": "519"},
  {"page1": "520", "page2": "521"},
  {"page1": "522", "page2": "523"},
  {"page1": "524", "page2": "525"},
  {"page1": "526", "page2": "527"},
  {"page1": "528", "page2": "529"},
  {"page1": "530", "page2": "531"},
  {"page1": "532", "page2": "533"},
  {"page1": "534", "page2": "535"},
  {"page1": "536", "page2": "537"},
  {"page1": "538", "page2": "539"},
  {"page1": "540", "page2": "541"},
  {"page1": "542", "page2": "543"},
  {"page1": "544", "page2": "545"},
  {"page1": "546", "page2": "547"},
  {"page1": "548", "page2": "549"},
  {"page1": "550", "page2": "551"},
  {"page1": "552", "page2": "553"},
  {"page1": "554", "page2": "555"},
  {"page1": "556", "page2": "557"},
  {"page1": "558", "page2": "559"},
  {"page1": "560", "page2": "561"},
  {"page1": "562", "page2": "563"},
  {"page1": "564", "page2": "565"},
  {"page1": "566", "page2": "567"},
  {"page1": "568", "page2": "569"},
  {"page1": "570", "page2": "571"},
  {"page1": "572", "page2": "573"},
  {"page1": "574", "page2": "575"},
  {"page1": "576", "page2": "577"},
  {"page1": "578", "page2": "579"},
  {"page1": "580", "page2": "581"},
  {"page1": "582", "page2": "583"},
  {"page1": "584", "page2": "585"},
  {"page1": "586", "page2": "587"},
  {"page1": "588", "page2": "589"},
  {"page1": "590", "page2": "591"},
  {"page1": "592", "page2": "593"},
  {"page1": "594", "page2": "595"},
  {"page1": "596", "page2": "597"},
  {"page1": "598", "page2": "599"},
  {"page1": "600", "page2": "601"},
  {"page1": "602", "page2": "603"},
  {"page1": "604", "page2": "0"},
];
List<int> noOfPages = [
  7, 16, 13, 19, 13, 15, 12, 13, 11, 14, 15,
////22-23//
  12, 16, 12, 9, 12, 13, 9, 9, 12, 7, 7, 10, 12, 5, 15, 14, 16, 16, 16, 14, 17,
  13, 19, 13, 12, 15, 14, 12, 8, 9, 10, 11, 15, 15, 12, 8, 11, 16, 13, 13,

  ///102-103
  15, 13, 6, 8, 10, 13, 9, 12, 13, 12, 13, 13, 12, 18, 17, 17, 16, 13, 13, 16,
  14, 13, 9, 11, 19, 19, 13, 14, 16, 14, 17, 26,
  13, 12, 8, 15, 17, 19, 17, 15, 12, 17, 12, 14, 11, 9,
  14, 14, 11, 14, 13, 11, 12, 14, 11,

  ///212-213-----250-251
  17, 19, 17, 19, 17, 14, 18, 16, 18, 17, 20, 19, 18, 15, 15, 17, 17, 17, 13,
  13,

  ///252-253------310-311

  16, 14, 13,
  15, 19, 31, 39, 35, 20, 16, 22, 15, 14, 17, 18, 17,
  21, 20, 17, 21, 19, 16, 14, 19, 21, 23, 24, 27, 26, 31,

  /// 312-313-414-415
  40, 27, 23, 26, 22, 24, 20, 28, 18, 22, 15, 15, 16, 18, 14, 27, 32, 31, 29,
  20, 11, 12, 15, 8, 18, 23,
  24, 29, 41, 50, 48, 47, 34, 22, 20, 21, 22, 16, 14, 15, 20, 14, 18, 16, 15,
  18, 21,
  17, 18, 21, 17, 17,
////416-417-518-519
  19, 15, 15, 13, 11, 19, 14, 17, 17, 17, 19, 14, 28, 27, 29, 51, 51, 51, 45,
  26, 41, 15, 21, 16, 20, 15, 18, 15, 18, 19, 19, 18, 17, 18, 12, 22, 19, 23,
  27, 29, 39, 33, 19,
  19, 14, 18, 18, 18, 14, 10, 14, 35,

  ///520-512-602-603-604
  40, 44, 35, 44, 45, 44, 51, 61, 49, 15, 11, 11, 14, 13, 13, 13, 17, 14, 18,
  12, 12, 26, 46, 44, 57, 33,
  28, 37, 58, 46, 56, 55, 73, 54, 55, 54, 53, 56, 53, 30, 38, 28, 15
];

List arabic = [];
List malayalam = [];
List quran = [];

Future readJson() async {
  final String response =
      await rootBundle.loadString('assets/hafs_smart_v8.json');
  final data = json.decode(response);
  arabic = data["quran"];
  malayalam = data["malayalam"];
  return quran = [arabic, malayalam];
}
