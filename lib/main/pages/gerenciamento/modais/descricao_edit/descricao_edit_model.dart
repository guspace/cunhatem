import '/flutter_flow/flutter_flow_util.dart';
import 'descricao_edit_widget.dart' show DescricaoEditWidget;
import 'package:flutter/material.dart';

class DescricaoEditModel extends FlutterFlowModel<DescricaoEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textDescricao widget.
  FocusNode? textDescricaoFocusNode;
  TextEditingController? textDescricaoTextController;
  String? Function(BuildContext, String?)? textDescricaoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textDescricaoFocusNode?.dispose();
    textDescricaoTextController?.dispose();
  }
}
