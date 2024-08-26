import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'lista_usuarios_widget.dart' show ListaUsuariosWidget;
import 'package:flutter/material.dart';

class ListaUsuariosModel extends FlutterFlowModel<ListaUsuariosWidget> {
  ///  Local state fields for this page.

  bool ativos = true;

  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // State field(s) for pesquisar1 widget.
  FocusNode? pesquisar1FocusNode;
  TextEditingController? pesquisar1TextController;
  String? Function(BuildContext, String?)? pesquisar1TextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UsersRecord>();

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    pesquisar1FocusNode?.dispose();
    pesquisar1TextController?.dispose();

    paginatedDataTableController.dispose();
  }
}
