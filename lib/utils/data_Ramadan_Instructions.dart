import 'package:flutter/material.dart';

const Ramadan_data = const [
  RamadanInstructions(
    id: 'n1',
    categories: [
      '1- الاشتراك بمبلغ قدره ( 5000) الاف دينار لمن لا يستطيع القراءة',
      '2- الاشتراك نيابة عن أحد الأموات بمبلغ قدره ( 10,000) الاف دينار. تعتبر الاشتراكات صدقة مطلقة.',
      '3- او قراءة الواجبات ادناه.',
      'أ- قراءة جزء في كل يوم (أي يختم القرآن خلال الشهر الكريم )',
      'ب - قراءة زيارة عاشوراء اربعة مرات في الشهر',
      'ج- قراءة دعاء الندبة مرة واحدة في الشهر',
      'د- الصلاة على محمد وآل محمد مائة مرة خلال الشهر',
      'هـ - قراءة دعاء الفرج ( اللهم كن لوليك الحجة ابن الحسن) ثلاثون مرة خلال الشهر',
      'و- قراءة الدعاء الخاص لدفع الاشرار وكيد الفجار مرة واحدة خلال الشهر',
    ],
  ),
  RamadanInstructions(
    id: 'n2',
    categories: [
      '1- اكثر من (300) ثواب حتمة قرآنية .',
      '2-أكثر من (1200) ثواب زيارة عاشوراء',
      '3-اكثر من (300) ثواب دعاء ندية',
      '4-أكثر من (30,000) ثواب الصلاة على محمد وال محمد',
      '5-أكثر من (9000) ثواب دعاء الفرج ( اللهم كن لوليك الحجة ابن الحسن )',
      '6-أكثر من ( 300 ) دعاء لدفع الاشرار وكيد الفجار.',
    ],
  ),
  RamadanInstructions(
    id: 'n3',
    categories: [
      'نية القراءة :- اصالة عن نفسي ونيابة عن امواتي والمشتركين وامواتهم واعضاء مؤسسة شباب الحسين (ع) وامواتهم وبالخصوص المشتركين المتوفين في هذه الحملة و شهداء العراق والى مقام صاحب العصر و الزمان وصاحب مسيرتنا و منقذنا الامام المنتظر ( عجل الله فرجه الشريف )',
    ],
  ),
  RamadanInstructions(
    id: 'n4',
    categories: [
      'ملاحظة ١/ حال عدم استطاعة المشترك من اتمام الواجبات عليه في شهر رمضان المبارك تكليف من ينوب عنه أو تبليغ المؤسسة علما ان اتمام الختمة ذمة شرعية .',
      'ملاحظة ٢/ وكذلك يمكن للراغبين الاشتراك في برنامج المؤسسة الشهرية.',
    ],
  ),
  RamadanInstructions(
    id: 'n5',
    categories: [
      '1- اكثر من (850) ثواب ختمة قرآنية',
      '2-أكثر من ( 3,400) ثواب زيارة عاشوراء ',
      '3-اكثر من (850) ثواب دعاء ندية ',
      '4-أكثر من (85,000) ثواب الصلاة على محمد وال محمد',
      '5-أكثر من (25,500) ثواب دعاء الفرج ( اللهم كن لوليك الحجة ابن الحسن ) ',
      '6- أكثر من ( 850 ) دعاء لدفع الاشرار وكيد الفجار. ',
    ],
  ),
  RamadanInstructions(
    id: 'n6',
    categories: [
      '1- للاستفسار او الاشتراك الاتصال على 07601199150',
      '2-زيارة مقر المؤسسة مقر المؤسسة ( بابل- قضاء الهاشمية - شارع مركز الشرطة) ',
      '3-أضغط هنا للاشتراك من خلال لاستمارة الالكترونية ',
    ],
  )
];

///;class تعليمات الاشتراك
class RamadanInstructions {
  final String id;
  final List<String> categories;

  const RamadanInstructions({required this.id, required this.categories});
}
