import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/card_local1/card_local1_widget.dart';
import 'pesquisar_widget.dart' show PesquisarWidget;
import 'package:flutter/material.dart';

class PesquisarModel extends FlutterFlowModel<PesquisarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<LocaisRecord> simpleSearchResults = [];
  // Models for cardLocal1 dynamic component.
  late FlutterFlowDynamicModels<CardLocal1Model> cardLocal1Models;

  @override
  void initState(BuildContext context) {
    cardLocal1Models = FlutterFlowDynamicModels(() => CardLocal1Model());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    cardLocal1Models.dispose();
  }
}
