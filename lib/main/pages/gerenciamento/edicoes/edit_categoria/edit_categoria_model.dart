import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_categoria_widget.dart' show EditCategoriaWidget;
import 'package:flutter/material.dart';

class EditCategoriaModel extends FlutterFlowModel<EditCategoriaWidget> {
  ///  Local state fields for this component.

  List<SubCategoriasStruct> subCategoriasEdited = [];
  void addToSubCategoriasEdited(SubCategoriasStruct item) =>
      subCategoriasEdited.add(item);
  void removeFromSubCategoriasEdited(SubCategoriasStruct item) =>
      subCategoriasEdited.remove(item);
  void removeAtIndexFromSubCategoriasEdited(int index) =>
      subCategoriasEdited.removeAt(index);
  void insertAtIndexInSubCategoriasEdited(
          int index, SubCategoriasStruct item) =>
      subCategoriasEdited.insert(index, item);
  void updateSubCategoriasEditedAtIndex(
          int index, Function(SubCategoriasStruct) updateFn) =>
      subCategoriasEdited[index] = updateFn(subCategoriasEdited[index]);

  List<CategoriasStruct> categoriasEdited = [];
  void addToCategoriasEdited(CategoriasStruct item) =>
      categoriasEdited.add(item);
  void removeFromCategoriasEdited(CategoriasStruct item) =>
      categoriasEdited.remove(item);
  void removeAtIndexFromCategoriasEdited(int index) =>
      categoriasEdited.removeAt(index);
  void insertAtIndexInCategoriasEdited(int index, CategoriasStruct item) =>
      categoriasEdited.insert(index, item);
  void updateCategoriasEditedAtIndex(
          int index, Function(CategoriasStruct) updateFn) =>
      categoriasEdited[index] = updateFn(categoriasEdited[index]);

  int? qtd;

  ///  State fields for stateful widgets in this component.

  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;
  // State field(s) for dropCategoria widget.
  String? dropCategoriaValue;
  FormFieldController<String>? dropCategoriaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();
  }
}
