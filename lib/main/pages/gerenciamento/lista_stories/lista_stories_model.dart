import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'lista_stories_widget.dart' show ListaStoriesWidget;
import 'package:flutter/material.dart';

class ListaStoriesModel extends FlutterFlowModel<ListaStoriesWidget> {
  ///  Local state fields for this page.

  List<SubCategoriasStruct> subsReordenar = [];
  void addToSubsReordenar(SubCategoriasStruct item) => subsReordenar.add(item);
  void removeFromSubsReordenar(SubCategoriasStruct item) =>
      subsReordenar.remove(item);
  void removeAtIndexFromSubsReordenar(int index) =>
      subsReordenar.removeAt(index);
  void insertAtIndexInSubsReordenar(int index, SubCategoriasStruct item) =>
      subsReordenar.insert(index, item);
  void updateSubsReordenarAtIndex(
          int index, Function(SubCategoriasStruct) updateFn) =>
      subsReordenar[index] = updateFn(subsReordenar[index]);

  List<SubCategoriasStruct> listaReordenar = [];
  void addToListaReordenar(SubCategoriasStruct item) =>
      listaReordenar.add(item);
  void removeFromListaReordenar(SubCategoriasStruct item) =>
      listaReordenar.remove(item);
  void removeAtIndexFromListaReordenar(int index) =>
      listaReordenar.removeAt(index);
  void insertAtIndexInListaReordenar(int index, SubCategoriasStruct item) =>
      listaReordenar.insert(index, item);
  void updateListaReordenarAtIndex(
          int index, Function(SubCategoriasStruct) updateFn) =>
      listaReordenar[index] = updateFn(listaReordenar[index]);

  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
  }
}
