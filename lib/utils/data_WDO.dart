/////طرق التبرع للمؤسسة
import 'package:flutter/material.dart';

const WOD_data = const [
  MethodOfPayment(
    id: 'n1',
    categories: [
      '1- للتبرع عن طريق محفظة زين كاش (07842277961)',
      '2-(5556-9600-1045-5980) للتبرع عن طريق الماستر كارد من داخل وخارج العراق ',
      '3-زيارة مقر المؤسسة ( بابل- قضاء الهاشمية - شارع مركز الشرطة)',
    ],
  )
];

class MethodOfPayment {
  final String id;
  final List<String> categories;

  const MethodOfPayment({required this.id, required this.categories});
}
