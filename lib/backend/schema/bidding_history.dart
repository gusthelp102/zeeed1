import 'package:firebase_auth/firebase_auth.dart';
import 'package:zeeed2/backend/backend.dart';

class BiddingHistoryModel {
  String? id;
  String? bidderId;
  String? name;
  double? amount;
  String? date;
  String? photo;
  DateTime createdAt = DateTime.now();

  BiddingHistoryModel(
      {this.id, this.bidderId, this.name, this.amount, this.date, this.photo});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'bidderId': bidderId,
        'name': name,
        'amount': amount,
        'date': date,
        'photo': photo,
        'createdAt': createdAt
      };
}

class BiddingHistory {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static Future createBiddingHistory(
      String? name, double? amount, String? date, String? photo) async {
    final historyDocument =
        FirebaseFirestore.instance.collection('BiddingHistory').doc();

    final history = BiddingHistoryModel(
        id: historyDocument.id,
        bidderId: auth.currentUser!.uid,
        name: name,
        amount: amount,
        date: date,
        photo: photo);

    final json = history.toJson();

    await historyDocument.set(json);
  }
}
