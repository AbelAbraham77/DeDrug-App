import '/flutter_flow/flutter_flow_util.dart';
import 'aibot_widget.dart' show AibotWidget;
import 'package:flutter/material.dart';

class AibotModel extends FlutterFlowModel<AibotWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? response;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
