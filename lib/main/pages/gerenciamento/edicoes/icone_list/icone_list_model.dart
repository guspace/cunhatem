import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'icone_list_widget.dart' show IconeListWidget;
import 'package:flutter/material.dart';

class IconeListModel extends FlutterFlowModel<IconeListWidget> {
  ///  Local state fields for this component.

  List<ComodidadesStruct> editedComodidades = [];
  void addToEditedComodidades(ComodidadesStruct item) =>
      editedComodidades.add(item);
  void removeFromEditedComodidades(ComodidadesStruct item) =>
      editedComodidades.remove(item);
  void removeAtIndexFromEditedComodidades(int index) =>
      editedComodidades.removeAt(index);
  void insertAtIndexInEditedComodidades(int index, ComodidadesStruct item) =>
      editedComodidades.insert(index, item);
  void updateEditedComodidadesAtIndex(
          int index, Function(ComodidadesStruct) updateFn) =>
      editedComodidades[index] = updateFn(editedComodidades[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
