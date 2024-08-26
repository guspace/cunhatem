import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/edicoes/edit_fotos/edit_fotos_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'experiencia_edit_widget.dart' show ExperienciaEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ExperienciaEditModel extends FlutterFlowModel<ExperienciaEditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Model for editFotos component.
  late EditFotosModel editFotosModel;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeTextController;
  String? Function(BuildContext, String?)? nomeTextControllerValidator;
  // State field(s) for switchVincularLocal widget.
  bool? switchVincularLocalValue;
  // State field(s) for vinculoLocal widget.
  final vinculoLocalKey = GlobalKey();
  FocusNode? vinculoLocalFocusNode;
  TextEditingController? vinculoLocalTextController;
  String? vinculoLocalSelectedOption;
  String? Function(BuildContext, String?)? vinculoLocalTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in btnAddLocal widget.
  LocaisRecord? vincularLocal;
  // State field(s) for switchExperienciaPaga widget.
  bool? switchExperienciaPagaValue;
  // State field(s) for textDescricaoValor widget.
  FocusNode? textDescricaoValorFocusNode;
  TextEditingController? textDescricaoValorTextController;
  String? Function(BuildContext, String?)?
      textDescricaoValorTextControllerValidator;
  String? _textDescricaoValorTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for textValor widget.
  FocusNode? textValorFocusNode;
  TextEditingController? textValorTextController;
  String? Function(BuildContext, String?)? textValorTextControllerValidator;
  String? _textValorTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for chipsFormasPagamento widget.
  FormFieldController<List<String>>? chipsFormasPagamentoValueController;
  List<String>? get chipsFormasPagamentoValues =>
      chipsFormasPagamentoValueController?.value;
  set chipsFormasPagamentoValues(List<String>? val) =>
      chipsFormasPagamentoValueController?.value = val;
  // State field(s) for switchAgendamento widget.
  bool? switchAgendamentoValue;
  // Stores action output result for [Bottom Sheet - descricaoEdit] action in Container widget.
  String? novaDescricao;
  // State field(s) for duracao widget.
  FocusNode? duracaoFocusNode;
  TextEditingController? duracaoTextController;
  final duracaoMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? duracaoTextControllerValidator;
  String? _duracaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Duração inválida, insira no formato hh:mm';
    }
    return null;
  }

  // State field(s) for textLogradouro widget.
  FocusNode? textLogradouroFocusNode;
  TextEditingController? textLogradouroTextController;
  String? Function(BuildContext, String?)?
      textLogradouroTextControllerValidator;
  // State field(s) for textNumero widget.
  FocusNode? textNumeroFocusNode;
  TextEditingController? textNumeroTextController;
  String? Function(BuildContext, String?)? textNumeroTextControllerValidator;
  // State field(s) for textBairro widget.
  FocusNode? textBairroFocusNode;
  TextEditingController? textBairroTextController;
  String? Function(BuildContext, String?)? textBairroTextControllerValidator;
  // State field(s) for textCidade widget.
  FocusNode? textCidadeFocusNode;
  TextEditingController? textCidadeTextController;
  String? Function(BuildContext, String?)? textCidadeTextControllerValidator;
  // State field(s) for textUF widget.
  FocusNode? textUFFocusNode;
  TextEditingController? textUFTextController;
  String? Function(BuildContext, String?)? textUFTextControllerValidator;
  // Stores action output result for [Bottom Sheet - localizacaoEdit] action in buttonLocalizacao widget.
  LatLng? novaLocalizacao;
  // State field(s) for telefone1 widget.
  FocusNode? telefone1FocusNode;
  TextEditingController? telefone1TextController;
  final telefone1Mask = MaskTextInputFormatter(mask: '+55 (##) #####-####');
  String? Function(BuildContext, String?)? telefone1TextControllerValidator;
  // State field(s) for whatsApp1 widget.
  bool? whatsApp1Value;
  // State field(s) for instagram widget.
  FocusNode? instagramFocusNode;
  TextEditingController? instagramTextController;
  String? Function(BuildContext, String?)? instagramTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for website widget.
  FocusNode? websiteFocusNode;
  TextEditingController? websiteTextController;
  String? Function(BuildContext, String?)? websiteTextControllerValidator;
  // State field(s) for tripadvisor widget.
  FocusNode? tripadvisorFocusNode;
  TextEditingController? tripadvisorTextController;
  String? Function(BuildContext, String?)? tripadvisorTextControllerValidator;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    editFotosModel = createModel(context, () => EditFotosModel());
    textDescricaoValorTextControllerValidator =
        _textDescricaoValorTextControllerValidator;
    textValorTextControllerValidator = _textValorTextControllerValidator;
    duracaoTextControllerValidator = _duracaoTextControllerValidator;
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    editFotosModel.dispose();
    nomeFocusNode?.dispose();
    nomeTextController?.dispose();

    vinculoLocalFocusNode?.dispose();

    textDescricaoValorFocusNode?.dispose();
    textDescricaoValorTextController?.dispose();

    textValorFocusNode?.dispose();
    textValorTextController?.dispose();

    duracaoFocusNode?.dispose();
    duracaoTextController?.dispose();

    textLogradouroFocusNode?.dispose();
    textLogradouroTextController?.dispose();

    textNumeroFocusNode?.dispose();
    textNumeroTextController?.dispose();

    textBairroFocusNode?.dispose();
    textBairroTextController?.dispose();

    textCidadeFocusNode?.dispose();
    textCidadeTextController?.dispose();

    textUFFocusNode?.dispose();
    textUFTextController?.dispose();

    telefone1FocusNode?.dispose();
    telefone1TextController?.dispose();

    instagramFocusNode?.dispose();
    instagramTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    websiteFocusNode?.dispose();
    websiteTextController?.dispose();

    tripadvisorFocusNode?.dispose();
    tripadvisorTextController?.dispose();
  }
}
