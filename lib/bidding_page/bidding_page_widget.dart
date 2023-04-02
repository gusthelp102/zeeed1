import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'bidding_page_model.dart';
export 'bidding_page_model.dart';

class BiddingPageWidget extends StatefulWidget {
  int prod_index;

  BiddingPageWidget({
    Key? key,
    required this.prod_index,
    this.auctionRif,
  }) : super(key: key);

  final DocumentReference? auctionRif;

  @override
  _BiddingPageWidgetState createState() => _BiddingPageWidgetState();
}

class _BiddingPageWidgetState extends State<BiddingPageWidget> {
  late BiddingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BiddingPageModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MerchRecord>>(
      stream: queryMerchRecord(
          // singleRecord: true,
          ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<MerchRecord> biddingPageMerchRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        print(biddingPageMerchRecordList[widget.prod_index].photo);
        final biddingPageMerchRecord = biddingPageMerchRecordList.isNotEmpty
            ? biddingPageMerchRecordList[widget.prod_index]
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Color(0xFF95A1AC),
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Align(
              alignment: AlignmentDirectional(-0.3, 0.0),
              child: Text(
                'Live Auction',
                style: FlutterFlowTheme.of(context).bodyText2.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0xFF24A00E),
                      fontSize: 22.0,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94,
                        height: 400.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6.0,
                              color: Color(0x3E000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 500.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: PageView(
                                  controller: _model.pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Image.network(
                                      biddingPageMerchRecordList[
                                              widget.prod_index]
                                          .photo
                                          .toString(),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      biddingPageMerchRecordList[
                                              widget.prod_index]
                                          .photo
                                          .toString(),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.network(
                                      biddingPageMerchRecordList[
                                              widget.prod_index]
                                          .photo
                                          .toString(),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 3,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      _model.pageViewController!.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: smooth_page_indicator
                                        .ExpandingDotsEffect(
                                      expansionFactor: 2.0,
                                      spacing: 8.0,
                                      radius: 16.0,
                                      dotWidth: 16.0,
                                      dotHeight: 16.0,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Color(0xFF22A556),
                                      paintStyle: PaintingStyle.fill,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<MerchRecord>>(
                          stream: queryMerchRecord(
                              // singleRecord: true,
                              ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                                ),
                              );
                            }
                            List<MerchRecord> textMerchRecordList =
                                snapshot.data!;
                            final textMerchRecord =
                                textMerchRecordList.isNotEmpty
                                    ? textMerchRecordList[widget.prod_index]
                                    : null;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    textMerchRecord!.name!,
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFF090F13),
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${textMerchRecordList[widget.prod_index].description}"),
                                ),
                                Text(
                                  '  ${textMerchRecordList[widget.prod_index].price} KD',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF22A556),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  '  End at ${textMerchRecordList[widget.prod_index].time}',
                                  style: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF22A556),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      "${textMerchRecordList[widget.prod_index].user_id}"),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       StreamBuilder<List<MerchRecord>>(
                //         stream: queryMerchRecord(
                //           singleRecord: true,
                //         ),
                //         builder: (context, snapshot) {
                //           // Customize what your widget looks like when it's loading.
                //           if (!snapshot.hasData) {
                //             return Center(
                //               child: SizedBox(
                //                 width: 50.0,
                //                 height: 50.0,
                //                 child: CircularProgressIndicator(
                //                   color:
                //                       FlutterFlowTheme.of(context).primaryColor,
                //                 ),
                //               ),
                //             );
                //           }
                //           List<MerchRecord> textMerchRecordList =
                //               snapshot.data!;
                //           // Return an empty Container when the item does not exist.
                //           if (snapshot.data!.isEmpty) {
                //             return Container();
                //           }
                //           final textMerchRecord = textMerchRecordList.isNotEmpty
                //               ? textMerchRecordList.first
                //               : null;
                //           return Text(
                //             textMerchRecord!.price!.toString(),
                //             textAlign: TextAlign.end,
                //             style: FlutterFlowTheme.of(context).title3.override(
                //                   fontFamily: 'Lexend Deca',
                //                   color: Color(0xFF22A556),
                //                   fontSize: 20.0,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //           );
                //         },
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: StreamBuilder<List<MerchRecord>>(
                //           stream: queryMerchRecord(
                //             singleRecord: true,
                //           ),
                //           builder: (context, snapshot) {
                //             // Customize what your widget looks like when it's loading.
                //             if (!snapshot.hasData) {
                //               return Center(
                //                 child: SizedBox(
                //                   width: 50.0,
                //                   height: 50.0,
                //                   child: CircularProgressIndicator(
                //                     color: FlutterFlowTheme.of(context)
                //                         .primaryColor,
                //                   ),
                //                 ),
                //               );
                //             }
                //             List<MerchRecord> textMerchRecordList =
                //                 snapshot.data!;
                //             // Return an empty Container when the item does not exist.
                //             if (snapshot.data!.isEmpty) {
                //               return Container();
                //             }
                //             final textMerchRecord =
                //                 textMerchRecordList.isNotEmpty
                //                     ? textMerchRecordList.first
                //                     : null;
                //             return Text(
                //               textMerchRecord!.description!,
                //               style: FlutterFlowTheme.of(context)
                //                   .bodyText2
                //                   .override(
                //                     fontFamily: 'Lexend Deca',
                //                     color:
                //                         FlutterFlowTheme.of(context).black600,
                //                     fontSize: 16.0,
                //                     fontWeight: FontWeight.normal,
                //                   ),
                //             );
                //           },
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 40.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textController,
                          autofocus: true,
                          obscureText: false,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Bid Amount...',
                            hintStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFF74C190),
                                    ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF459B38),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7E031D),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF7E031D),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          keyboardType: TextInputType.number,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.7, -0.3),
                          child: StreamBuilder<List<MerchRecord>>(
                            stream: queryMerchRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<MerchRecord> buttonMerchRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonMerchRecord =
                                  buttonMerchRecordList.isNotEmpty
                                      ? buttonMerchRecordList
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (double.parse(
                                          _model.textController!.text) >=
                                      biddingPageMerchRecordList[
                                              widget.prod_index]
                                          .ascendingAmount!
                                          .toDouble()) {
                                    final merchUpdateData = {
                                      'price': FieldValue.increment(
                                          double.parse(
                                              _model.textController!.text)),
                                    };
                                    await biddingPageMerchRecordList[
                                            widget.prod_index]
                                        .reference
                                        .update(merchUpdateData);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Not enough amount!'),
                                          content: Text(
                                              'Minimum bidding amount is ${biddingPageMerchRecordList[widget.prod_index].ascendingAmount}'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Ok'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                                text: 'Bid Your Price',
                                options: FFButtonOptions(
                                  width: 160.0,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF124C08),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
                          //   child: FFButtonWidget(
                          //     onPressed: () {
                          //       final merchUpdateData = {
                          //   'price': FieldValue.increment(
                          //       buttonMerchRecord!.ascendingAmount!.toDouble()),
                          // };
                          // await buttonMerchRecord.reference
                          //     .update(merchUpdateData);
                          //     },
                          //     text: 'Bid Your Price',
                          //     options: FFButtonOptions(
                          //       width: 170.0,
                          //       height: 50.0,
                          //       padding: EdgeInsetsDirectional.fromSTEB(
                          //           0.0, 0.0, 0.0, 0.0),
                          //       iconPadding: EdgeInsetsDirectional.fromSTEB(
                          //           0.0, 0.0, 0.0, 0.0),
                          //       color: Color(0xFF24A00E),
                          //       textStyle: FlutterFlowTheme.of(context)
                          //           .subtitle2
                          //           .override(
                          //             fontFamily: 'Lexend Deca',
                          //             color: Colors.white,
                          //             fontSize: 16.0,
                          //             fontWeight: FontWeight.w500,
                          //           ),
                          //       elevation: 3.0,
                          //       borderSide: BorderSide(
                          //         color: Colors.transparent,
                          //         width: 1.0,
                          //       ),
                          //     ),
                          //   ),
                        ),
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<MerchRecord>>(
                  stream: queryMerchRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<MerchRecord> buttonMerchRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final buttonMerchRecord = buttonMerchRecordList.isNotEmpty
                        ? buttonMerchRecordList.first
                        : null;
                    return FFButtonWidget(
                      onPressed: () async {
                        final merchUpdateData = {
                          'price': FieldValue.increment(
                              biddingPageMerchRecordList[widget.prod_index]
                                  .ascendingAmount!
                                  .toDouble()),
                        };
                        await biddingPageMerchRecordList[widget.prod_index]
                            .reference
                            .update(merchUpdateData);
                      },
                      text:
                          'Min Bid: ${biddingPageMerchRecordList[widget.prod_index].ascendingAmount}',
                      options: FFButtonOptions(
                        width: 160.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color(0xFF124C08),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  },
                ),
                Image.asset(
                  'assets/images/aws-larger-logo.png',
                  width: 100.0,
                  height: 100.0,
                  fit: BoxFit.cover,
                ),
                // Row(
                //   mainAxisSize: MainAxisSize.max,
                //   children: [
                //     Align(
                //       alignment: AlignmentDirectional(0.0, 0.25),
                //       child: Text(
                //         'Market Price ≈ 380KD',
                //         style: FlutterFlowTheme.of(context).bodyText1.override(
                //               fontFamily: 'Poppins',
                //               color: Color(0xFF74C190),
                //               decoration: TextDecoration.underline,
                //             ),
                //       ),
                //     ),
                //     Align(
                //       alignment: AlignmentDirectional(-0.85, -0.35),
                //       child: Image.asset(
                //         'assets/images/aws-larger-logo.png',
                //         width: 100.0,
                //         height: 100.0,
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
