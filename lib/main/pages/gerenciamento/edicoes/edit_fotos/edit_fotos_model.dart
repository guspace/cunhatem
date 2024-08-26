import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_fotos_widget.dart' show EditFotosWidget;
import 'package:flutter/material.dart';

class EditFotosModel extends FlutterFlowModel<EditFotosWidget> {
  ///  Local state fields for this component.

  String? excluirUrl;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - reorderGaleria] action in ListView widget.
  List<FotosStruct>? galeriaReordenada;
  // Stores action output result for [Bottom Sheet - addFotos] action in adicionarFotos widget.
  List<FotosStruct>? fotosSubir;
  // Stores action output result for [Bottom Sheet - addFotos] action in adicionarFotos widget.
  List<FotosStruct>? fotosEvento;
  // Stores action output result for [Bottom Sheet - addFotos] action in adicionarFotos widget.
  List<FotosStruct>? fotosExperiencia;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
