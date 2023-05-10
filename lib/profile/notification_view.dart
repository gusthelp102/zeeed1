import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeeed2/auth/auth_util.dart';
import 'package:zeeed2/backend/schema/notification.dart';
import 'package:zeeed2/flutter_flow/flutter_flow_theme.dart';

class NotificationView extends StatefulWidget {
  const NotificationView();

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF124C08),
        title: Text(
          'Notifications',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('Notification')
            .where('user_id', isEqualTo: currentUserUid)
            .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: const CircularProgressIndicator());
            default:
              if (snapshot.hasData) {
                if (snapshot.data!.size > 0) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.size,
                        itemBuilder: (context, index) {
                          String id = snapshot.data!.docs[index].data()["id"];
                          String message =
                              snapshot.data!.docs[index].data()["message"];
                          String userId =
                              snapshot.data!.docs[index].data()["user_id"];
                          double price = double.parse(snapshot.data!.docs[index]
                              .data()["amount"]
                              .toString());
                          bool? show = snapshot.data!.docs[index].data()["show_accept_decline"] ?? true;
                          bool? accepted = snapshot.data!.docs[index].data()["accepted"] ?? false;
                          return ListTile(
                            title: Text(message),
                            leading: Icon(Icons.notifications),
                            subtitle: (show ?? true) ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color(0xFF124C08),
                                      ),
                                      onPressed: () async {
                                        await UserNotification
                                            .updateNotification(id, userId,
                                                message, price, true, false);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: CupertinoAlertDialog(
                                                title: Text(
                                                    "Amount will deposit in your account soon"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Ok")),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('Accept')),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.red,
                                      ),
                                      onPressed: () async {
                                        await UserNotification
                                            .updateNotification(id, userId,
                                                message, price, false, false);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Container(
                                              child: CupertinoAlertDialog(
                                                title: Text("Amount declined"),
                                                actions: [
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Ok")),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: const Text('Decline'))
                                ]) : Text( (accepted ?? true) ? 'Accepted' : 'Declined'),
                          );
                        }),
                  );
                }
                return const Center(
                    child: Text(
                  'No Notifications',
                  style: TextStyle(color: Colors.grey),
                ));
              }
              return const Center(
                  child: Text(
                'No Notifications',
                style: TextStyle(color: Colors.grey),
              ));
          }
        },
      ),
    );
  }
}
