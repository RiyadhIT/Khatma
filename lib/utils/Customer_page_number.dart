import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/////رقم الاشتراك للعميل

int Customer_Subscription_number = -44;
Future saveCustomer_page_number() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(
      'Customer_page_number', Customer_Subscription_number.toInt());
}

Future getCustomer_page_number() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    Customer_Subscription_number =
        (await prefs.getInt('Customer_page_number')!.toInt());
  } catch (_) {
    Customer_Subscription_number = -10;
  }
}
