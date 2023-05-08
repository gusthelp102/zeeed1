import 'package:firebase_auth/firebase_auth.dart';
import 'package:zeeed2/backend/backend.dart';

class NotificationModel {
  String? id;
  String? user_id;
  String? message;
  double? amount;
  bool? accepted = false;
  bool? showAcceptDecline = true;
  DateTime createdAt = DateTime.now();

  NotificationModel(
      {this.id,
      this.user_id,
      this.message,
      this.amount,
      this.accepted,
      this.showAcceptDecline});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user_id': user_id,
        'message': message,
        'amount': amount,
        'accepted': accepted,
        'show_accept_decline': showAcceptDecline,
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

  static Future updateNotification(String id, String? user_id, String? message,
      double? amount, bool? accepted, bool? showAcceptDecline) async {
    final historyDocument =
        FirebaseFirestore.instance.collection('Notification').doc(id);

    final history = NotificationModel(
        id: historyDocument.id,
        user_id: user_id,
        message: message,
        amount: amount,
        accepted: accepted,
        showAcceptDecline: showAcceptDecline);

    final json = history.toJson();

    await historyDocument.set(json);
  }
}
