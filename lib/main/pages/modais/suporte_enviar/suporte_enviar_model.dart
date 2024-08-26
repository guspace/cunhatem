import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'suporte_enviar_widget.dart' show SuporteEnviarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SuporteEnviarModel extends FlutterFlowModel<SuporteEnviarWidget> {
  ///  Local state fields for this component.

  String? id;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  String? _textEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  // State field(s) for textTelefone1 widget.
  FocusNode? textTelefone1FocusNode;
  TextEditingController? textTelefone1TextController;
  final textTelefone1Mask = MaskTextInputFormatter(mask: '+55 ## #####-####');
  String? Function(BuildContext, String?)? textTelefone1TextControllerValidator;
  // State field(s) for textRequisicao widget.
  FocusNode? textRequisicaoFocusNode;
  TextEditingController? textRequisicaoTextController;
  String? Function(BuildContext, String?)?
      textRequisicaoTextControllerValidator;
  String? _textRequisicaoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 40) {
      return 'Insira mais informações sobre sua solicitação';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SuporteRecord? requisicaoCriada;

  @override
  void initState(BuildContext context) {
    textEmailTextControllerValidator = _textEmailTextControllerValidator;
    textRequisicaoTextControllerValidator =
        _textRequisicaoTextControllerValidator;
  }

  @override
  void dispose() {
    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();

    textTelefone1FocusNode?.dispose();
    textTelefone1TextController?.dispose();

    textRequisicaoFocusNode?.dispose();
    textRequisicaoTextController?.dispose();
  }
}
