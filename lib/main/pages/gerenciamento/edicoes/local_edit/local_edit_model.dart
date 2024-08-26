import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/edicoes/edit_fotos/edit_fotos_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'local_edit_widget.dart' show LocalEditWidget;
import 'package:flutter/material.dart';

class LocalEditModel extends FlutterFlowModel<LocalEditWidget> {
  ///  Local state fields for this page.

  List<CategoriasStruct> categoriasSelecionadas = [];
  void addToCategoriasSelecionadas(CategoriasStruct item) =>
      categoriasSelecionadas.add(item);
  void removeFromCategoriasSelecionadas(CategoriasStruct item) =>
      categoriasSelecionadas.remove(item);
  void removeAtIndexFromCategoriasSelecionadas(int index) =>
      categoriasSelecionadas.removeAt(index);
  void insertAtIndexInCategoriasSelecionadas(
          int index, CategoriasStruct item) =>
      categoriasSelecionadas.insert(index, item);
  void updateCategoriasSelecionadasAtIndex(
          int index, Function(CategoriasStruct) updateFn) =>
      categoriasSelecionadas[index] = updateFn(categoriasSelecionadas[index]);

  List<SubCategoriasStruct> subCategoriasSelecionadas = [];
  void addToSubCategoriasSelecionadas(SubCategoriasStruct item) =>
      subCategoriasSelecionadas.add(item);
  void removeFromSubCategoriasSelecionadas(SubCategoriasStruct item) =>
      subCategoriasSelecionadas.remove(item);
  void removeAtIndexFromSubCategoriasSelecionadas(int index) =>
      subCategoriasSelecionadas.removeAt(index);
  void insertAtIndexInSubCategoriasSelecionadas(
          int index, SubCategoriasStruct item) =>
      subCategoriasSelecionadas.insert(index, item);
  void updateSubCategoriasSelecionadasAtIndex(
          int index, Function(SubCategoriasStruct) updateFn) =>
      subCategoriasSelecionadas[index] =
          updateFn(subCategoriasSelecionadas[index]);

  List<String> categoriasStrings = [];
  void addToCategoriasStrings(String item) => categoriasStrings.add(item);
  void removeFromCategoriasStrings(String item) =>
      categoriasStrings.remove(item);
  void removeAtIndexFromCategoriasStrings(int index) =>
      categoriasStrings.removeAt(index);
  void insertAtIndexInCategoriasStrings(int index, String item) =>
      categoriasStrings.insert(index, item);
  void updateCategoriasStringsAtIndex(int index, Function(String) updateFn) =>
      categoriasStrings[index] = updateFn(categoriasStrings[index]);

  List<String> subcategoriasStrings = [];
  void addToSubcategoriasStrings(String item) => subcategoriasStrings.add(item);
  void removeFromSubcategoriasStrings(String item) =>
      subcategoriasStrings.remove(item);
  void removeAtIndexFromSubcategoriasStrings(int index) =>
      subcategoriasStrings.removeAt(index);
  void insertAtIndexInSubcategoriasStrings(int index, String item) =>
      subcategoriasStrings.insert(index, item);
  void updateSubcategoriasStringsAtIndex(
          int index, Function(String) updateFn) =>
      subcategoriasStrings[index] = updateFn(subcategoriasStrings[index]);

  ///  State fields for stateful widgets in this page.

  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Model for editFotos component.
  late EditFotosModel editFotosModel;
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

  // State field(s) for dropCategoria widget.
  List<String>? dropCategoriaValue;
  FormFieldController<List<String>>? dropCategoriaValueController;
  // State field(s) for dropSubcategoria widget.
  List<String>? dropSubcategoriaValue;
  FormFieldController<List<String>>? dropSubcategoriaValueController;
  // State field(s) for switchAgendamento widget.
  bool? switchAgendamentoValue;
  // State field(s) for switchEntradaPaga widget.
  bool? switchEntradaPagaValue;
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

  // Stores action output result for [Bottom Sheet - descricaoEdit] action in Container widget.
  String? novaDescricao;
  // State field(s) for chipsFormasPagamento widget.
  FormFieldController<List<String>>? chipsFormasPagamentoValueController;
  List<String>? get chipsFormasPagamentoValues =>
      chipsFormasPagamentoValueController?.value;
  set chipsFormasPagamentoValues(List<String>? val) =>
      chipsFormasPagamentoValueController?.value = val;
  // State field(s) for textWebsite widget.
  FocusNode? textWebsiteFocusNode1;
  TextEditingController? textWebsiteTextController1;
  String? Function(BuildContext, String?)? textWebsiteTextController1Validator;
  // Stores action output result for [Bottom Sheet - comodidadesEdit] action in btnEditComodidades widget.
  List<ComodidadesStruct>? novasComodidades;
  // State field(s) for textObservacoes widget.
  FocusNode? textObservacoesFocusNode;
  TextEditingController? textObservacoesTextController;
  String? Function(BuildContext, String?)?
      textObservacoesTextControllerValidator;
  // Stores action output result for [Bottom Sheet - funcionamentoEdit] action in IconButton widget.
  FuncionamentoLocalStruct? novoFuncionamento;
  // State field(s) for textLogradouro widget.
  FocusNode? textLogradouroFocusNode;
  TextEditingController? textLogradouroTextController;
  String? Function(BuildContext, String?)?
      textLogradouroTextControllerValidator;
  String? _textLogradouroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

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
  LatLng? localizacaoLatLong;
  // State field(s) for textTelefone1 widget.
  FocusNode? textTelefone1FocusNode;
  TextEditingController? textTelefone1TextController;
  String? Function(BuildContext, String?)? textTelefone1TextControllerValidator;
  // State field(s) for checkWhatsApp1 widget.
  bool? checkWhatsApp1Value;
  // State field(s) for textInstagram widget.
  FocusNode? textInstagramFocusNode;
  TextEditingController? textInstagramTextController;
  String? Function(BuildContext, String?)? textInstagramTextControllerValidator;
  // State field(s) for textEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  // State field(s) for textWebsite widget.
  FocusNode? textWebsiteFocusNode2;
  TextEditingController? textWebsiteTextController2;
  String? Function(BuildContext, String?)? textWebsiteTextController2Validator;
  // State field(s) for textWebsite widget.
  FocusNode? textWebsiteFocusNode3;
  TextEditingController? textWebsiteTextController3;
  String? Function(BuildContext, String?)? textWebsiteTextController3Validator;
  // State field(s) for dropPlano widget.
  String? dropPlanoValue;
  FormFieldController<String>? dropPlanoValueController;
  // State field(s) for switchFestival widget.
  bool? switchFestivalValue;
  // Stores action output result for [Firestore Query - Query a collection] action in buttonSalvar widget.
  AppConfiguracoesRecord? categorias;
  // Stores action output result for [Firestore Query - Query a collection] action in buttonSalvar widget.
  PlanosRecord? planoSelecionado;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    editFotosModel = createModel(context, () => EditFotosModel());
    textNomeTextControllerValidator = _textNomeTextControllerValidator;
    textDescricaoValorTextControllerValidator =
        _textDescricaoValorTextControllerValidator;
    textValorTextControllerValidator = _textValorTextControllerValidator;
    textLogradouroTextControllerValidator =
        _textLogradouroTextControllerValidator;
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    editFotosModel.dispose();
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();

    textDescricaoValorFocusNode?.dispose();
    textDescricaoValorTextController?.dispose();

    textValorFocusNode?.dispose();
    textValorTextController?.dispose();

    textWebsiteFocusNode1?.dispose();
    textWebsiteTextController1?.dispose();

    textObservacoesFocusNode?.dispose();
    textObservacoesTextController?.dispose();

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

    textTelefone1FocusNode?.dispose();
    textTelefone1TextController?.dispose();

    textInstagramFocusNode?.dispose();
    textInstagramTextController?.dispose();

    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();

    textWebsiteFocusNode2?.dispose();
    textWebsiteTextController2?.dispose();

    textWebsiteFocusNode3?.dispose();
    textWebsiteTextController3?.dispose();
  }
}
