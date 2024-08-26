import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/btn_vertudo/btn_vertudo_widget.dart';
import '/main/pages/modais/card_modais/card_local2/card_local2_widget.dart';
import 'list_locais_widget.dart' show ListLocaisWidget;
import 'package:flutter/material.dart';

class ListLocaisModel extends FlutterFlowModel<ListLocaisWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for btnVertudo component.
  late BtnVertudoModel btnVertudoModel1;
  // Models for cardLocal2 dynamic component.
  late FlutterFlowDynamicModels<CardLocal2Model> cardLocal2Models;
  // Model for btnVertudo component.
  late BtnVertudoModel btnVertudoModel2;

  @override
  void initState(BuildContext context) {
    btnVertudoModel1 = createModel(context, () => BtnVertudoModel());
    cardLocal2Models = FlutterFlowDynamicModels(() => CardLocal2Model());
    btnVertudoModel2 = createModel(context, () => BtnVertudoModel());
  }

  @override
  void dispose() {
    btnVertudoModel1.dispose();
    cardLocal2Models.dispose();
    btnVertudoModel2.dispose();
  }
}
