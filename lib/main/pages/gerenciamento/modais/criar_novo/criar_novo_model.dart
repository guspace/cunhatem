import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'criar_novo_widget.dart' show CriarNovoWidget;
import 'package:flutter/material.dart';

class CriarNovoModel extends FlutterFlowModel<CriarNovoWidget> {
  ///  Local state fields for this component.

  String? randomID;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;
  String? _textNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in buttonComecar widget.
  LocaisRecord? localCriar;
  // Stores action output result for [Backend Call - Create Document] action in buttonComecar widget.
  EventosRecord? eventoCriar;
  // Stores action output result for [Backend Call - Create Document] action in buttonComecar widget.
  ExperienciasRecord? experienciaCriar;

  @override
  void initState(BuildContext context) {
    textNomeTextControllerValidator = _textNomeTextControllerValidator;
  }

  @override
  void dispose() {
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();
  }
}
