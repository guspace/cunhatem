import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'comodidades_edit_widget.dart' show ComodidadesEditWidget;
import 'package:flutter/material.dart';

class ComodidadesEditModel extends FlutterFlowModel<ComodidadesEditWidget> {
  ///  Local state fields for this component.

  List<ComodidadesStruct> comodidadesSelecionadas = [];
  void addToComodidadesSelecionadas(ComodidadesStruct item) =>
      comodidadesSelecionadas.add(item);
  void removeFromComodidadesSelecionadas(ComodidadesStruct item) =>
      comodidadesSelecionadas.remove(item);
  void removeAtIndexFromComodidadesSelecionadas(int index) =>
      comodidadesSelecionadas.removeAt(index);
  void insertAtIndexInComodidadesSelecionadas(
          int index, ComodidadesStruct item) =>
      comodidadesSelecionadas.insert(index, item);
  void updateComodidadesSelecionadasAtIndex(
          int index, Function(ComodidadesStruct) updateFn) =>
      comodidadesSelecionadas[index] = updateFn(comodidadesSelecionadas[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
