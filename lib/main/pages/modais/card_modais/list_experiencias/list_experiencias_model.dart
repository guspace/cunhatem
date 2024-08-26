import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/card_experiencia2/card_experiencia2_widget.dart';
import 'list_experiencias_widget.dart' show ListExperienciasWidget;
import 'package:flutter/material.dart';

class ListExperienciasModel extends FlutterFlowModel<ListExperienciasWidget> {
  ///  State fields for stateful widgets in this component.

  // Models for cardExperiencia2 dynamic component.
  late FlutterFlowDynamicModels<CardExperiencia2Model> cardExperiencia2Models;

  @override
  void initState(BuildContext context) {
    cardExperiencia2Models =
        FlutterFlowDynamicModels(() => CardExperiencia2Model());
  }

  @override
  void dispose() {
    cardExperiencia2Models.dispose();
  }
}
