// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../utils/sql_helper.dart';

Widget x(String str) {
  return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Color.fromRGBO(148, 39, 39, 0.973),
      child: Text(str,
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontSize: 5.0,
            fontStyle: FontStyle.normal,
          )));
}

Future<void> _addItem(String id, String title, String NumberOfReadings) async {
  await SQLHelper.createItem(int.parse(id), title, NumberOfReadings);
  _refreshJournals();
}

List<Map<String, dynamic>> _journals = [];

bool _isLoading = true;
// This function is used to fetch all data from the database
void _refreshJournals() async {
  final data = await SQLHelper.getItems();
  // setState(() {
  _journals = data;
  _isLoading = false;
  _refreshJournals(); // Loading the diary when the app starts
  //});
}
