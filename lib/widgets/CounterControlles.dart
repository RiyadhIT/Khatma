import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

//ignore: must_be_immutable
class IncrementCounter extends StatelessWidget {
  int counter = 0;

  void incrementCounter() {
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CounterController extends GetxController {
  var counter = 0.obs;
  void increment() {
    counter++;
  }
}

class CounterBuilder extends GetxController {
  int bcounter = 0;

  @override
  void onInit() {
    super.onInit();
    super.onClose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() {
    bcounter++;
    update();
  }
}

int DueaAlfarajCounter = 0;
Future saveCounter() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('DueaAlfarajCounter', DueaAlfarajCounter.toInt());
}

Future getCounter() async {
  print("read DueaAlfarajCounter called");
  final prefs = await SharedPreferences.getInstance();
  try {
    DueaAlfarajCounter = await prefs.getInt('DueaAlfarajCounter')!;
    return true;
  } catch (_) {
    DueaAlfarajCounter = 115;
  }
}
