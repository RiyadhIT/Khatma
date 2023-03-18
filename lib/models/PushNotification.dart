import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationManger {
  PushNotificationManger._();

  ///وضعنا هذة الشارحة لمنع اي احد يعمل له استدعاء من الخارج
  factory PushNotificationManger() => _instance;
  static final PushNotificationManger _instance = PushNotificationManger();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  bool _initialized = false;

  Future<void> int() async {
    if (!_initialized) {
      String? token = await _firebaseMessaging.getToken();
      print("my new token =$token");
      _initialized = true;
    }
  }
}
