import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/gerenciamento/modais/botao_adicionar/botao_adicionar_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'dart:async';
import 'lista_eventos_widget.dart' show ListaEventosWidget;
import 'package:flutter/material.dart';

class ListaEventosModel extends FlutterFlowModel<ListaEventosWidget> {
  ///  Local state fields for this page.

  bool verVisiveis = true;

  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // State field(s) for pesquisar1 widget.
  FocusNode? pesquisar1FocusNode;
  TextEditingController? pesquisar1TextController;
  String? Function(BuildContext, String?)? pesquisar1TextControllerValidator;
  List<EventosRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<EventosRecord>();
  // Model for botaoAdicionar component.
  late BotaoAdicionarModel botaoAdicionarModel;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    botaoAdicionarModel = createModel(context, () => BotaoAdicionarModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    pesquisar1FocusNode?.dispose();
    pesquisar1TextController?.dispose();

    paginatedDataTableController.dispose();
    botaoAdicionarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
