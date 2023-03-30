import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for logInEmail widget.
  TextEditingController? logInEmailController;
  String? Function(BuildContext, String?)? logInEmailControllerValidator;
  // State field(s) for logInPass widget.
  TextEditingController? logInPassController;
  late bool logInPassVisibility;
  String? Function(BuildContext, String?)? logInPassControllerValidator;
  // State field(s) for UserNameField widget.
  TextEditingController? userNameFieldController;
  String? Function(BuildContext, String?)? userNameFieldControllerValidator;
  // State field(s) for PhoneField widget.
  TextEditingController? phoneFieldController;
  String? Function(BuildContext, String?)? phoneFieldControllerValidator;
  // State field(s) for Pass2 widget.
  TextEditingController? pass2Controller;
  late bool pass2Visibility;
  String? Function(BuildContext, String?)? pass2ControllerValidator;
  // State field(s) for Pass1 widget.
  TextEditingController? pass1Controller;
  late bool pass1Visibility;
  String? Function(BuildContext, String?)? pass1ControllerValidator;
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for ForgetPassEmail widget.
  TextEditingController? forgetPassEmailController;
  String? Function(BuildContext, String?)? forgetPassEmailControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    logInPassVisibility = false;
    pass2Visibility = false;
    pass1Visibility = false;
  }

  void dispose() {
    logInEmailController?.dispose();
    logInPassController?.dispose();
    userNameFieldController?.dispose();
    phoneFieldController?.dispose();
    pass2Controller?.dispose();
    pass1Controller?.dispose();
    emailFieldController?.dispose();
    forgetPassEmailController?.dispose();
  }

  /// Additional helper methods are added here.

}
