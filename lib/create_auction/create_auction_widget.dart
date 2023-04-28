// import '/auth/auth_util.dart';
// import '/backend/backend.dart';
// import '/backend/firebase_storage/storage.dart';
// import '/flutter_flow/flutter_flow_count_controller.dart';
// import '/flutter_flow/flutter_flow_icon_button.dart';
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/flutter_flow/flutter_flow_widgets.dart';
// import '/flutter_flow/upload_media.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'create_auction_model.dart';
// export 'create_auction_model.dart';

// class CreateAuctionWidget extends StatefulWidget {
//   const CreateAuctionWidget({Key? key}) : super(key: key);

//   @override
//   _CreateAuctionWidgetState createState() => _CreateAuctionWidgetState();
// }

// class _CreateAuctionWidgetState extends State<CreateAuctionWidget> {
//   late CreateAuctionModel _model;

//   final scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     super.initState();
//     _model = createModel(context, () => CreateAuctionModel());

//     _model.descpretionController ??= TextEditingController();
//     _model.productNameController ??= TextEditingController();
//     _model.priceController ??= TextEditingController();
//   }

//   @override
//   void dispose() {
//     _model.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//       appBar: AppBar(
//         backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
//         automaticallyImplyLeading: false,
//         title: Text(
//           'Create Auction',
//           style: FlutterFlowTheme.of(context).title2.override(
//                 fontFamily: 'Poppins',
//                 color: Color(0xFF124C08),
//               ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
//             child: FlutterFlowIconButton(
//               borderColor: Colors.transparent,
//               borderRadius: 30.0,
//               buttonSize: 48.0,
//               icon: Icon(
//                 Icons.close_rounded,
//                 color: FlutterFlowTheme.of(context).secondaryText,
//                 size: 30.0,
//               ),
//               onPressed: () async {
//                 context.pushNamed('MainPage');
//               },
//             ),
//           ),
//         ],
//         centerTitle: false,
//         elevation: 0.0,
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Row(
//             mainAxisSize: MainAxisSize.max,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * 0.94,
//                   decoration: BoxDecoration(),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
//                         child: InkWell(
//                           onTap: () async {
//                             final selectedMedia =
//                                 await selectMediaWithSourceBottomSheet(
//                               context: context,
//                               allowPhoto: true,
//                             );
//                             if (selectedMedia != null &&
//                                 selectedMedia.every((m) => validateFileFormat(
//                                     m.storagePath, context))) {
//                               setState(() => _model.isMediaUploading = true);
//                               var selectedUploadedFiles = <FFUploadedFile>[];
//                               var downloadUrls = <String>[];
//                               try {
//                                 showUploadMessage(
//                                   context,
//                                   'Uploading file...',
//                                   showLoading: true,
//                                 );
//                                 selectedUploadedFiles = selectedMedia
//                                     .map((m) => FFUploadedFile(
//                                           name: m.storagePath.split('/').last,
//                                           bytes: m.bytes,
//                                           height: m.dimensions?.height,
//                                           width: m.dimensions?.width,
//                                         ))
//                                     .toList();

//                                 downloadUrls = (await Future.wait(
//                                   selectedMedia.map(
//                                     (m) async => await uploadData(
//                                         m.storagePath, m.bytes),
//                                   ),
//                                 ))
//                                     .where((u) => u != null)
//                                     .map((u) => u!)
//                                     .toList();
//                               } finally {
//                                 ScaffoldMessenger.of(context)
//                                     .hideCurrentSnackBar();
//                                 _model.isMediaUploading = false;
//                               }
//                               if (selectedUploadedFiles.length ==
//                                       selectedMedia.length &&
//                                   downloadUrls.length == selectedMedia.length) {
//                                 setState(() {
//                                   _model.uploadedLocalFile =
//                                       selectedUploadedFiles.first;
//                                   _model.uploadedFileUrl = downloadUrls.first;
//                                 });
//                                 showUploadMessage(context, 'Success!');
//                               } else {
//                                 setState(() {});
//                                 showUploadMessage(
//                                     context, 'Failed to upload media');
//                                 return;
//                               }
//                             }
//                           },
//                           child: Container(
//                             width: MediaQuery.of(context).size.width * 0.96,
//                             height: 350.0,
//                             decoration: BoxDecoration(
//                               color: FlutterFlowTheme.of(context)
//                                   .primaryBackground,
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: Image.asset(
//                                   'assets/images/emptyState@2x.png',
//                                 ).image,
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                   blurRadius: 6.0,
//                                   color: Color(0x3A000000),
//                                   offset: Offset(0.0, 2.0),
//                                 )
//                               ],
//                               borderRadius: BorderRadius.circular(8.0),
//                               border: Border.all(
//                                 width: 1.0,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: 200.0,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Expanded(
//                               child: Align(
//                                 alignment: AlignmentDirectional(0.0, -0.6),
//                                 child: TextFormField(
//                                   controller: _model.descpretionController,
//                                   obscureText: false,
//                                   decoration: InputDecoration(
//                                     hintText: 'Enter post details here...',
//                                     hintStyle:
//                                         FlutterFlowTheme.of(context).bodyText2,
//                                     enabledBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: FlutterFlowTheme.of(context)
//                                             .gray600,
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0x00000000),
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0x00000000),
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderSide: BorderSide(
//                                         color: Color(0x00000000),
//                                         width: 1.0,
//                                       ),
//                                       borderRadius: BorderRadius.circular(8.0),
//                                     ),
//                                     contentPadding:
//                                         EdgeInsetsDirectional.fromSTEB(
//                                             20.0, 32.0, 20.0, 12.0),
//                                   ),
//                                   style: FlutterFlowTheme.of(context).bodyText1,
//                                   textAlign: TextAlign.start,
//                                   maxLines: 6,
//                                   validator: _model
//                                       .descpretionControllerValidator
//                                       .asValidator(context),
//                                 ),
//                               ),
//                             ),
//                             TextFormField(
//                               controller: _model.productNameController,
//                               autofocus: true,
//                               obscureText: false,
//                               decoration: InputDecoration(
//                                 hintText: 'Enter Product Name',
//                                 hintStyle:
//                                     FlutterFlowTheme.of(context).bodyText2,
//                                 enabledBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1.0,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1.0,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 errorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1.0,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                                 focusedErrorBorder: UnderlineInputBorder(
//                                   borderSide: BorderSide(
//                                     color: Color(0x00000000),
//                                     width: 1.0,
//                                   ),
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(4.0),
//                                     topRight: Radius.circular(4.0),
//                                   ),
//                                 ),
//                               ),
//                               style: FlutterFlowTheme.of(context).bodyText1,
//                               validator: _model.productNameControllerValidator
//                                   .asValidator(context),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                         padding:
//                             EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.max,
//                           children: [
//                             Expanded(
//                               child: TextFormField(
//                                 controller: _model.priceController,
//                                 autofocus: true,
//                                 obscureText: false,
//                                 decoration: InputDecoration(
//                                   hintText: 'Enter Starting Price...',
//                                   hintStyle:
//                                       FlutterFlowTheme.of(context).bodyText2,
//                                   enabledBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   errorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                   focusedErrorBorder: UnderlineInputBorder(
//                                     borderSide: BorderSide(
//                                       color: Color(0x00000000),
//                                       width: 1.0,
//                                     ),
//                                     borderRadius: const BorderRadius.only(
//                                       topLeft: Radius.circular(4.0),
//                                       topRight: Radius.circular(4.0),
//                                     ),
//                                   ),
//                                 ),
//                                 style: FlutterFlowTheme.of(context)
//                                     .bodyText1
//                                     .override(
//                                       fontFamily: 'Poppins',
//                                       color: Color(0xFF124C08),
//                                     ),
//                                 textAlign: TextAlign.start,
//                                 keyboardType: TextInputType.number,
//                                 validator: _model.priceControllerValidator
//                                     .asValidator(context),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Text(
//             'Acending Bidding Value',
//             style: FlutterFlowTheme.of(context).bodyText1,
//           ),
//           Container(
//             width: 160.0,
//             height: 50.0,
//             decoration: BoxDecoration(
//               color: Color(0xFF1E5D13),
//               borderRadius: BorderRadius.circular(25.0),
//               shape: BoxShape.rectangle,
//               border: Border.all(
//                 color: Color(0xFF9E9E9E),
//                 width: 2.0,
//               ),
//             ),
//             child: FlutterFlowCountController(
//               decrementIconBuilder: (enabled) => FaIcon(
//                 FontAwesomeIcons.minus,
//                 color: enabled
//                     ? FlutterFlowTheme.of(context).primaryBtnText
//                     : Color(0xFFEEEEEE),
//                 size: 20.0,
//               ),
//               incrementIconBuilder: (enabled) => FaIcon(
//                 FontAwesomeIcons.plus,
//                 color: enabled
//                     ? FlutterFlowTheme.of(context).primaryBtnText
//                     : Color(0xFFEEEEEE),
//                 size: 20.0,
//               ),
//               countBuilder: (count) => Text(
//                 count.toString(),
//                 style: GoogleFonts.getFont(
//                   'Roboto',
//                   color: FlutterFlowTheme.of(context).primaryBtnText,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 16.0,
//                 ),
//               ),
//               count: _model.countControllerValue ??= 5,
//               updateCount: (count) =>
//                   setState(() => _model.countControllerValue = count),
//               stepSize: 5,
//               minimum: 5,
//             ),
//           ),
//           Padding(
//             padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
//             child: FFButtonWidget(
//               onPressed: () async {
//                 final merchCreateData = createMerchRecordData(
//                   name: _model.productNameController.text,
//                   description: _model.descpretionController.text,
//                   price: double.tryParse(_model.priceController.text),
//                   photo: _model.uploadedFileUrl,
//                   ascendingAmount: _model.countControllerValue,

//                 );
//                 await MerchRecord.collection.doc().set(merchCreateData);
//                 await showDialog(
//                   context: context,
//                   builder: (alertDialogContext) {
//                     return AlertDialog(
//                       title: Text('Your auction is live!'),
//                       content:
//                           Text('You have succesfully uploaded a new auction'),
//                       actions: [
//                         TextButton(
//                           onPressed: () => Navigator.pop(alertDialogContext),
//                           child: Text('Ok'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//                 context.pop();
//               },
//               text: 'Create Auction',
//               options: FFButtonOptions(
//                 width: 270.0,
//                 height: 50.0,
//                 padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                 iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
//                 color: Color(0xFF1E5D13),
//                 textStyle: FlutterFlowTheme.of(context).subtitle2.override(
//                       fontFamily: 'Lexend Deca',
//                       color: Colors.white,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w500,
//                     ),
//                 elevation: 3.0,
//                 borderSide: BorderSide(
//                   color: Colors.transparent,
//                   width: 1.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zeeed2/auth/firebase_user_provider.dart';

import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_auction_model.dart';
export 'create_auction_model.dart';

class CreateAuctionWidget extends StatefulWidget {
  const CreateAuctionWidget({Key? key}) : super(key: key);

  @override
  _CreateAuctionWidgetState createState() => _CreateAuctionWidgetState();
}

class _CreateAuctionWidgetState extends State<CreateAuctionWidget> {
  late CreateAuctionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _picker = ImagePicker();
  List<XFile> _selectedFiles = [];
  FirebaseStorage _storageRef = FirebaseStorage.instance;
  List<String> _arrImageUrls = [];
  List<XFile> _image = [];
  DateTime _date = DateTime.now();
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateAuctionModel());

    _model.descpretionController ??= TextEditingController();
    _model.productNameController ??= TextEditingController();
    _model.priceController ??= TextEditingController();
    _model.timeController ??= TextEditingController();
    _model.uidController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  chooseimage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      // _image.add(File(pickedFile!.path));
    });
    Future<void> retrieveLostData() async {
      final LostData response = await _picker.getLostData();
      if (response.isEmpty) {
        return;
      }
      if (response.file != null) {
        setState(() {
          // _image.add(File(response.file!.path));
        });
      } else {
        print(response.file);
      }
    }

    if (pickedFile!.path == null) retrieveLostData();
  }

  Future<void> select_image() async {
    if (_selectedFiles != null) {
      _selectedFiles.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage();
      if (imgs!.isNotEmpty) {
        _selectedFiles.addAll(imgs);
      }
    } catch (e) {
      print("ERROR");
    }
    setState(() {});
  }

  Future<String> uploadfile(XFile _image) async {
    Reference reference = _storageRef.ref().child("users2").child(_image.name);
    UploadTask uploadTask = reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() {
      print(reference.getDownloadURL());
    });
    return await reference.getDownloadURL();
  }

  void uploadFunction(List<XFile> _image) {
    for (var i = 0; i < _image.length; i++) {
      var imageUrl = uploadfile(_image[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'Create Auction',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Color(0xFF124C08),
              ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              buttonSize: 48.0,
              icon: Icon(
                Icons.close_rounded,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 30.0,
              ),
              onPressed: () async {
                // context.pushNamed('MainPage');
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 12.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.94,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            onTap: () async {
                              final selectedMedia =
                                  await selectMediaWithSourceBottomSheet(
                                context: context,
                                allowPhoto: true,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
                                setState(() => _model.isMediaUploading = true);
                                var selectedUploadedFiles = <FFUploadedFile>[];
                                var downloadUrls = <String>[];
                                try {
                                  showUploadMessage(
                                    context,
                                    'Uploading file...',
                                    showLoading: true,
                                  );
                                  selectedUploadedFiles = selectedMedia
                                      .map((m) => FFUploadedFile(
                                            name: m.storagePath.split('/').last,
                                            bytes: m.bytes,
                                            height: m.dimensions?.height,
                                            width: m.dimensions?.width,
                                          ))
                                      .toList();

                                  downloadUrls = (await Future.wait(
                                    selectedMedia.map(
                                      (m) async => await uploadData(
                                          m.storagePath, m.bytes),
                                    ),
                                  ))
                                      .where((u) => u != null)
                                      .map((u) => u!)
                                      .toList();
                                } finally {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isMediaUploading = false;
                                }
                                if (selectedUploadedFiles.length ==
                                        selectedMedia.length &&
                                    downloadUrls.length ==
                                        selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile =
                                        selectedUploadedFiles.first;
                                    _model.uploadedFileUrl = downloadUrls.first;
                                  });
                                  showUploadMessage(context, 'Success!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(
                                      context, 'Failed to upload media');
                                  return;
                                }
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.96,
                              height: 200.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: Image.asset(
                                    'assets/images/emptyState@2x.png',
                                  ).image,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 6.0,
                                    color: Color(0x3A000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                        // GridView.builder(
                        //     // physics: const NeverScrollableScrollPhysics(),

                        //     itemCount: _image.length + 1,
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 2),
                        //     itemBuilder: (context, index) {
                        //       return index == 0
                        //           ? Center(
                        //               child: IconButton(
                        //                   onPressed: () {
                        //                     chooseimage();
                        //                   },
                        //                   icon: Icon(Icons.add)),
                        //             )
                        //           : Container(
                        //               margin: EdgeInsets.all(3),
                        //               color: Colors.amber,
                        //               decoration: BoxDecoration(
                        //                   image: DecorationImage(
                        //                       image:
                        //                           FileImage(_image[index - 1]))),
                        //             );
                        //     }),

                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //             backgroundColor: Color(0xFF124C08)),
                        //         onPressed: () {
                        //           select_image();
                        //         },
                        //         child: Text("Select images")),
                        //     ElevatedButton(
                        //         style: ElevatedButton.styleFrom(
                        //             backgroundColor: Color(0xFF124C08)),
                        //         onPressed: () {
                        //           uploadFunction(_selectedFiles);
                        //         },
                        //         child: Text("Upload images")),
                        //   ],
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.all(10.0),
                        //   child: Text(_selectedFiles.length.toString() +
                        //       " Image selected"),
                        // ),
                        Container(
                          height: 200.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, -0.6),
                                  child: TextFormField(
                                    controller: _model.descpretionController,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      hintText: 'Enter post details here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .gray600,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              20.0, 32.0, 20.0, 12.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    textAlign: TextAlign.start,
                                    maxLines: 6,
                                    validator: _model
                                        .descpretionControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.productNameController,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Enter Product Name',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                    ),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                                validator: _model.productNameControllerValidator
                                    .asValidator(context),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: _model.priceController,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Enter Starting Price...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF124C08),
                                      ),
                                  textAlign: TextAlign.start,
                                  keyboardType: TextInputType.number,
                                  validator: _model.priceControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: TextFormField(
                                    controller: _model.timeController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        label: Text('Enter ending date'),
                                        border: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey,
                                                width: 0.0)),
                                        prefixIcon: IconButton(
                                            icon: const Icon(Icons.date_range),
                                            onPressed: () {
                                              showCupertinoModalPopup(
                                                  context: context,
                                                  builder: (_) => Container(
                                                        height: 270,
                                                        color: Color.fromARGB(
                                                            255, 255, 255, 255),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                                height: 200,
                                                                child:
                                                                    CupertinoDatePicker(
                                                                        minimumDate:
                                                                            DateTime
                                                                                .now(),
                                                                        mode: CupertinoDatePickerMode
                                                                            .dateAndTime,
                                                                        onDateTimeChanged:
                                                                            (val) {
                                                                          setState(
                                                                              () {
                                                                            _date =
                                                                                val;
                                                                            _model.timeController.text =
                                                                                DateFormat('MM-dd-yyyy HH:mm').format(_date);
                                                                          });
                                                                        })),
                                                          ],
                                                        ),
                                                      ));
                                            }))),
                                // TextFormField(
                                //   controller: _model.timeController,
                                //   autofocus: true,
                                //   obscureText: false,
                                //   decoration: InputDecoration(
                                //     hintText: 'Enter Total hours...',
                                //     hintStyle:
                                //         FlutterFlowTheme.of(context).bodyText2,
                                //     enabledBorder: UnderlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Color(0x00000000),
                                //         width: 1.0,
                                //       ),
                                //       borderRadius: const BorderRadius.only(
                                //         topLeft: Radius.circular(4.0),
                                //         topRight: Radius.circular(4.0),
                                //       ),
                                //     ),
                                //     focusedBorder: UnderlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Color(0x00000000),
                                //         width: 1.0,
                                //       ),
                                //       borderRadius: const BorderRadius.only(
                                //         topLeft: Radius.circular(4.0),
                                //         topRight: Radius.circular(4.0),
                                //       ),
                                //     ),
                                //     errorBorder: UnderlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Color(0x00000000),
                                //         width: 1.0,
                                //       ),
                                //       borderRadius: const BorderRadius.only(
                                //         topLeft: Radius.circular(4.0),
                                //         topRight: Radius.circular(4.0),
                                //       ),
                                //     ),
                                //     focusedErrorBorder: UnderlineInputBorder(
                                //       borderSide: BorderSide(
                                //         color: Color(0x00000000),
                                //         width: 1.0,
                                //       ),
                                //       borderRadius: const BorderRadius.only(
                                //         topLeft: Radius.circular(4.0),
                                //         topRight: Radius.circular(4.0),
                                //       ),
                                //     ),
                                //   ),
                                //   style: FlutterFlowTheme.of(context)
                                //       .bodyText1
                                //       .override(
                                //         fontFamily: 'Poppins',
                                //         color: Color(0xFF124C08),
                                //       ),
                                //   textAlign: TextAlign.start,
                                //   keyboardType: TextInputType.number,
                                //   validator: _model.timeControllerValidator
                                //       .asValidator(context),
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Acending Bidding Value',
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
            Container(
              width: 160.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0xFF1E5D13),
                borderRadius: BorderRadius.circular(25.0),
                shape: BoxShape.rectangle,
                border: Border.all(
                  color: Color(0xFF9E9E9E),
                  width: 2.0,
                ),
              ),
              child: FlutterFlowCountController(
                decrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.minus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).primaryBtnText
                      : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                incrementIconBuilder: (enabled) => FaIcon(
                  FontAwesomeIcons.plus,
                  color: enabled
                      ? FlutterFlowTheme.of(context).primaryBtnText
                      : Color(0xFFEEEEEE),
                  size: 20.0,
                ),
                countBuilder: (count) => Text(
                  count.toString(),
                  style: GoogleFonts.getFont(
                    'Roboto',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                  ),
                ),
                count: _model.countControllerValue ??= 5,
                updateCount: (count) =>
                    setState(() => _model.countControllerValue = count),
                stepSize: 5,
                minimum: 5,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  // print();
                  final merchCreateData = createMerchRecordData(
                      name: _model.productNameController.text,
                      description: _model.descpretionController.text,
                      price: double.tryParse(_model.priceController.text),
                      photo: _model.uploadedFileUrl,
                      ascendingAmount: _model.countControllerValue,
                      time: _model.timeController.text,
                      id: currentUserUid,
                      user_id: currentUserUid,
                      onSale: true
                      // "User name: ${currentUserDisplayName}\nPhone No: ${currentPhoneNumber}",
                      );
                  await MerchRecord.collection.doc().set(merchCreateData);
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Your auction is live!'),
                        content:
                            Text('You have succesfully uploaded a new auction'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                  Navigator.pop(context);
                },
                text: 'Create Auction',
                options: FFButtonOptions(
                  width: 270.0,
                  height: 50.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF1E5D13),
                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
