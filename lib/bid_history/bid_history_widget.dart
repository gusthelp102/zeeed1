import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bid_history_model.dart';
export 'bid_history_model.dart';

class BidHistoryWidget extends StatefulWidget {
  const BidHistoryWidget({Key? key}) : super(key: key);

  @override
  _BidHistoryWidgetState createState() => _BidHistoryWidgetState();
}

class _BidHistoryWidgetState extends State<BidHistoryWidget>
    with TickerProviderStateMixin {
  late BidHistoryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BidHistoryModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: Color(0xFF459B38),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Align(
          alignment: AlignmentDirectional(-0.3, 0.0),
          child: Text(
            'Bid History',
            style: FlutterFlowTheme.of(context).title2.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                ),
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('BiddingHistory')
              .where('bidderId', isEqualTo: auth.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container();
              default:
                if (snapshot.hasData) {
                  if (snapshot.data!.size != 0)
                    return ListView.builder(
                        itemCount: snapshot.data!.size,
                        itemBuilder: (context, index) {
                          String id = snapshot.data!.docs[index].data()["id"];
                          double amount =
                              snapshot.data!.docs[index].data()["amount"];
                          String name =
                              snapshot.data!.docs[index].data()["name"];
                          String date =
                              snapshot.data!.docs[index].data()["date"];
                          String photo =
                              snapshot.data!.docs[index].data()["photo"];
                          print(amount);
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16, 12.0, 16, 44.0),
                            child: Container(
                              width: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 5.0,
                                    color: Color(0x1F000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                      topLeft: Radius.circular(12.0),
                                      topRight: Radius.circular(12.0),
                                    ),
                                    child: Image.network(
                                      photo,
                                      width: double.infinity,
                                      height: 240.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          name,
                                          style: FlutterFlowTheme.of(context)
                                              .title2,
                                        ),
                                        Text(
                                          '$amount KD',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFF124C08),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // Text(
                                        //   'Published By Ahmad Al-Ali',
                                        //   style: FlutterFlowTheme.of(context)
                                        //       .bodyText2
                                        //       .override(
                                        //         fontFamily: 'Poppins',
                                        //         fontSize: 12.0,
                                        //       ),
                                        // ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, 0.0),
                                          child: Text(
                                            date,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .black600,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                }
                return Center(
                  child: Text('No history'),
                );
            }
          }),
    );
  }
}
