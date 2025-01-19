import '/flutter_flow/flutter_flow_util.dart';
import 'login0_widget.dart' show Login0Widget;
import 'package:flutter/material.dart';

class Login0Model extends FlutterFlowModel<Login0Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for first_name widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastname widget.
  FocusNode? lastnameFocusNode;
  TextEditingController? lastnameTextController;
  String? Function(BuildContext, String?)? lastnameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password-login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;
  // State field(s) for cpassword-login widget.
  FocusNode? cpasswordLoginFocusNode;
  TextEditingController? cpasswordLoginTextController;
  late bool cpasswordLoginVisibility;
  String? Function(BuildContext, String?)?
      cpasswordLoginTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordLoginVisibility = false;
    cpasswordLoginVisibility = false;
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastnameFocusNode?.dispose();
    lastnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();

    cpasswordLoginFocusNode?.dispose();
    cpasswordLoginTextController?.dispose();
  }
}
