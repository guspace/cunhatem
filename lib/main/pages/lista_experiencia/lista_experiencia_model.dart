import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_experiencia2/card_experiencia2_widget.dart';
import 'lista_experiencia_widget.dart' show ListaExperienciaWidget;
import 'package:flutter/material.dart';

class ListaExperienciaModel extends FlutterFlowModel<ListaExperienciaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Models for cardExperiencia2 dynamic component.
  late FlutterFlowDynamicModels<CardExperiencia2Model> cardExperiencia2Models;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    cardExperiencia2Models =
        FlutterFlowDynamicModels(() => CardExperiencia2Model());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    cardExperiencia2Models.dispose();
  }
}
