import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/edicoes/edit_fotos/edit_fotos_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'evento_edit_widget.dart' show EventoEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EventoEditModel extends FlutterFlowModel<EventoEditWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Model for editFotos component.
  late EditFotosModel editFotosModel;
  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;
  // State field(s) for switchDiaTodo widget.
  bool? switchDiaTodoValue;
  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
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
  // State field(s) for switchEventoPago widget.
  bool? switchEventoPagoValue;
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
  // State field(s) for switchAntecipado widget.
  bool? switchAntecipadoValue;
  // Stores action output result for [Bottom Sheet - descricaoEdit] action in Container widget.
  String? novaDescricao;
  // State field(s) for switchSemEndereco widget.
  bool? switchSemEnderecoValue;
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

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    editFotosModel = createModel(context, () => EditFotosModel());
    textDescricaoValorTextControllerValidator =
        _textDescricaoValorTextControllerValidator;
    textValorTextControllerValidator = _textValorTextControllerValidator;
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    editFotosModel.dispose();
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();

    vinculoLocalFocusNode?.dispose();

    textDescricaoValorFocusNode?.dispose();
    textDescricaoValorTextController?.dispose();

    textValorFocusNode?.dispose();
    textValorTextController?.dispose();

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
  }
}
