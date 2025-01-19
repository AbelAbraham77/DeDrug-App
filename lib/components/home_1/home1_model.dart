import '/components/taskprogress_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home1_widget.dart' show Home1Widget;
import 'package:flutter/material.dart';

class Home1Model extends FlutterFlowModel<Home1Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for Taskprogress component.
  late TaskprogressModel taskprogressModel;

  @override
  void initState(BuildContext context) {
    taskprogressModel = createModel(context, () => TaskprogressModel());
  }

  @override
  void dispose() {
    taskprogressModel.dispose();
  }
}
