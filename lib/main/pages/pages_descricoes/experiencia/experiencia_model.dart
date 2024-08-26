import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/card_local2/card_local2_widget.dart';
import 'experiencia_widget.dart' show ExperienciaWidget;
import 'package:flutter/material.dart';

class ExperienciaModel extends FlutterFlowModel<ExperienciaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for cardLocal2 dynamic component.
  late FlutterFlowDynamicModels<CardLocal2Model> cardLocal2Models;

  @override
  void initState(BuildContext context) {
    cardLocal2Models = FlutterFlowDynamicModels(() => CardLocal2Model());
  }

  @override
  void dispose() {
    cardLocal2Models.dispose();
  }
}
