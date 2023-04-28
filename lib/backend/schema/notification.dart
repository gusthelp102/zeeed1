import 'package:firebase_auth/firebase_auth.dart';
import 'package:zeeed2/backend/backend.dart';

class NotificationModel {
  String? id;
  String? user_id;
  String? message;
  double? amount;
  DateTime createdAt = DateTime.now();

  NotificationModel({this.id, this.user_id, this.message, this.amount});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': user_id,
        'message': message,
        'amount': amount,
        'createdAt': createdAt
      };
}

class UserNotification {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future createNotification(
      String? user_id, String? message, double? amount) async {
    final historyDocument =
        FirebaseFirestore.instance.collection('Notification').doc();

    final history = NotificationModel(
        id: historyDocument.id,
        user_id: user_id,
        message: message,
        amount: amount);

    final json = history.toJson();

    await historyDocument.set(json);
  }
}
