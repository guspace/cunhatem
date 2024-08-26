import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'lista_comodidades_widget.dart' show ListaComodidadesWidget;
import 'package:flutter/material.dart';

class ListaComodidadesModel extends FlutterFlowModel<ListaComodidadesWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // State field(s) for pesquisar1 widget.
  FocusNode? pesquisar1FocusNode;
  TextEditingController? pesquisar1TextController;
  String? Function(BuildContext, String?)? pesquisar1TextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    pesquisar1FocusNode?.dispose();
    pesquisar1TextController?.dispose();
  }
}
