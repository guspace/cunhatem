import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_perguntas_freq_widget.dart' show EditPerguntasFreqWidget;
import 'package:flutter/material.dart';

class EditPerguntasFreqModel extends FlutterFlowModel<EditPerguntasFreqWidget> {
  ///  Local state fields for this component.

  List<FaqStruct> salvarFaqs = [];
  void addToSalvarFaqs(FaqStruct item) => salvarFaqs.add(item);
  void removeFromSalvarFaqs(FaqStruct item) => salvarFaqs.remove(item);
  void removeAtIndexFromSalvarFaqs(int index) => salvarFaqs.removeAt(index);
  void insertAtIndexInSalvarFaqs(int index, FaqStruct item) =>
      salvarFaqs.insert(index, item);
  void updateSalvarFaqsAtIndex(int index, Function(FaqStruct) updateFn) =>
      salvarFaqs[index] = updateFn(salvarFaqs[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for textPergunta widget.
  FocusNode? textPerguntaFocusNode;
  TextEditingController? textPerguntaTextController;
  String? Function(BuildContext, String?)? textPerguntaTextControllerValidator;
  String? _textPerguntaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for textResposta widget.
  FocusNode? textRespostaFocusNode;
  TextEditingController? textRespostaTextController;
  String? Function(BuildContext, String?)? textRespostaTextControllerValidator;
  String? _textRespostaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for textLink widget.
  FocusNode? textLinkFocusNode;
  TextEditingController? textLinkTextController;
  String? Function(BuildContext, String?)? textLinkTextControllerValidator;

  @override
  void initState(BuildContext context) {
    textPerguntaTextControllerValidator = _textPerguntaTextControllerValidator;
    textRespostaTextControllerValidator = _textRespostaTextControllerValidator;
  }

  @override
  void dispose() {
    textPerguntaFocusNode?.dispose();
    textPerguntaTextController?.dispose();

    textRespostaFocusNode?.dispose();
    textRespostaTextController?.dispose();

    textLinkFocusNode?.dispose();
    textLinkTextController?.dispose();
  }
}
