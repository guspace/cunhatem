import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'suporte_widget.dart' show SuporteWidget;
import 'package:flutter/material.dart';

class SuporteModel extends FlutterFlowModel<SuporteWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
  }
}
