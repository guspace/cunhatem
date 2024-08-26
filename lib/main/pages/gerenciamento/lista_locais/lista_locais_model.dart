import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/modais/botao_adicionar/botao_adicionar_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'dart:async';
import 'lista_locais_widget.dart' show ListaLocaisWidget;
import 'package:flutter/material.dart';

class ListaLocaisModel extends FlutterFlowModel<ListaLocaisWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> locaisLote = [];
  void addToLocaisLote(DocumentReference item) => locaisLote.add(item);
  void removeFromLocaisLote(DocumentReference item) => locaisLote.remove(item);
  void removeAtIndexFromLocaisLote(int index) => locaisLote.removeAt(index);
  void insertAtIndexInLocaisLote(int index, DocumentReference item) =>
      locaisLote.insert(index, item);
  void updateLocaisLoteAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      locaisLote[index] = updateFn(locaisLote[index]);

  bool verVisiveis = true;

  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  bool firestoreRequestCompleted2 = false;
  String? firestoreRequestLastUniqueKey2;
  bool firestoreRequestCompleted1 = false;
  String? firestoreRequestLastUniqueKey1;
  // State field(s) for pesquisar1 widget.
  FocusNode? pesquisar1FocusNode;
  TextEditingController? pesquisar1TextController;
  String? Function(BuildContext, String?)? pesquisar1TextControllerValidator;
  List<LocaisRecord> simpleSearchResults = [];
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<LocaisRecord>();
  // State field(s) for filtroCategoria1 widget.
  String? filtroCategoria1Value;
  FormFieldController<String>? filtroCategoria1ValueController;
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
  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
