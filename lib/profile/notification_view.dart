import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zeeed2/auth/auth_util.dart';
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
        backgroundColor: Color(0xFF1E5D13),
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
                          String message =
                              snapshot.data!.docs[index].data()["message"];
                          return ListTile(title: Text(message));
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
