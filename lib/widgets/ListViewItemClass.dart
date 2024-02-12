import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class listviewItemClass {
  ///الخاصة بالستفيو listview دالة لتضبيط العناوين
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

///// listview حيث تاخذ ابن وهي عبارة عن كونتينر  ياخذ لست فيو  listview دالة
  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),

      /// height: 200,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }
}
