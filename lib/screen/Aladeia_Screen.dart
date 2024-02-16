import 'package:flutter/material.dart';
import 'package:khatma/utils/app_data.dart';
import 'package:khatma/widgets/Aladeia_item.dart';

class AladeiaScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;
  //  const QuranScreen(this.categoryId, this.categoryTitle);
  static const screenRoute = '/AladeiaScreen';
  @override
  Widget build(BuildContext context) {
    final routearguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routearguments["id"];
    final categoryTitle = routearguments[
        "title"]; ////عملية سحب الايدي الخاص بكل تصنيف ومن خلال هذا الايدي نستطيع الحصول على التصنيفات المرتبطة بهذا الايدي

    ////سوف ننشاء متغير يقوم بجلب بينات التصنيفات الخاصة بهذا الايدي
    final FilterAladeia = Aladeia_data.where((element) {
      return element.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      ////سوف نعرض القائمة
      body: ListView.builder(
          itemCount: FilterAladeia.length,
          itemBuilder: (ctx, index) {
            return AladeiaItem(
              id: FilterAladeia[index].id,
              title: FilterAladeia[index].title,
              imageUrl: FilterAladeia[index].imageUrl,
              duration: FilterAladeia[index].duration,
            );
          }),
    );
  }
}
