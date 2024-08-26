import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_comodidades_widget.dart' show EditComodidadesWidget;
import 'package:flutter/material.dart';

class EditComodidadesModel extends FlutterFlowModel<EditComodidadesWidget> {
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

  String iconName = 'unknown';

  ///  State fields for stateful widgets in this component.

  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();
  }
}
