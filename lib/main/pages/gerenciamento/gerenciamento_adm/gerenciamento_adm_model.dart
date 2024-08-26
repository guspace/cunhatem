import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'gerenciamento_adm_widget.dart' show GerenciamentoAdmWidget;
import 'package:flutter/material.dart';

class GerenciamentoAdmModel extends FlutterFlowModel<GerenciamentoAdmWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Stores action output result for [Bottom Sheet - descricaoEdit] action in Container widget.
  String? novoTermos;
  // Stores action output result for [Bottom Sheet - descricaoEdit] action in Container widget.
  String? novaPolitica;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
  }
}
