import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/edicoes/edit_fotos/edit_fotos_widget.dart';
import '/main/pages/gerenciamento/modais/comodidades_edit/comodidades_edit_widget.dart';
import '/main/pages/gerenciamento/modais/descricao_edit/descricao_edit_widget.dart';
import '/main/pages/gerenciamento/modais/funcionamento_edit/funcionamento_edit_widget.dart';
import '/main/pages/gerenciamento/modais/localizacao_edit/localizacao_edit_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'local_edit_model.dart';
export 'local_edit_model.dart';

class LocalEditWidget extends StatefulWidget {
  const LocalEditWidget({
    super.key,
    required this.refLocal,
    bool? novo,
  }) : novo = novo ?? false;

  final DocumentReference? refLocal;
  final bool novo;

  @override
  State<LocalEditWidget> createState() => _LocalEditWidgetState();
}

class _LocalEditWidgetState extends State<LocalEditWidget> {
  late LocalEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalEditModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'localEdit'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textNomeFocusNode ??= FocusNode();

    _model.textDescricaoValorTextController ??= TextEditingController();
    _model.textDescricaoValorFocusNode ??= FocusNode();

    _model.textValorTextController ??= TextEditingController();
    _model.textValorFocusNode ??= FocusNode();

    _model.textWebsiteFocusNode1 ??= FocusNode();

    _model.textObservacoesFocusNode ??= FocusNode();

    _model.textLogradouroFocusNode ??= FocusNode();

    _model.textNumeroFocusNode ??= FocusNode();

    _model.textBairroFocusNode ??= FocusNode();

    _model.textCidadeFocusNode ??= FocusNode();

    _model.textUFFocusNode ??= FocusNode();

    _model.textTelefone1FocusNode ??= FocusNode();

    _model.textInstagramFocusNode ??= FocusNode();

    _model.textEmailFocusNode ??= FocusNode();

    _model.textWebsiteFocusNode2 ??= FocusNode();

    _model.textWebsiteFocusNode3 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitPulse(
              color: FlutterFlowTheme.of(context).primary,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<LocaisRecord>(
      stream: LocaisRecord.getDocument(widget.refLocal!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }

        final localEditLocaisRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 50.0,
                                buttonSize: 60.0,
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOCAL_EDIT_PAGE_close_ICN_ON_TAP');
                                  context.safePop();
                                  HapticFeedback.lightImpact();
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(-1.0, 1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.appbarTextModel,
                                  updateCallback: () => setState(() {}),
                                  child: AppbarTextWidget(
                                    text: widget.novo
                                        ? 'Novo Local'
                                        : 'Editar Local',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0.0,
              ),
            ),
            body: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        wrapWithModel(
                          model: _model.editFotosModel,
                          updateCallback: () => setState(() {}),
                          updateOnChange: true,
                          child: EditFotosWidget(
                            refLocais: widget.refLocal,
                            listaFotos: localEditLocaisRecord.galeriaFotos,
                          ),
                        ),
                        StreamBuilder<List<AppConfiguracoesRecord>>(
                          stream: queryAppConfiguracoesRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<AppConfiguracoesRecord>
                                containerAppConfiguracoesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final containerAppConfiguracoesRecord =
                                containerAppConfiguracoesRecordList.isNotEmpty
                                    ? containerAppConfiguracoesRecordList.first
                                    : null;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Informações básicas',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Comfortaa'),
                                            ),
                                      ),
                                    ),
                                    Form(
                                      key: _model.formKey4,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          TextFormField(
                                            controller: _model
                                                    .textNomeTextController ??=
                                                TextEditingController(
                                              text: localEditLocaisRecord.nome,
                                            ),
                                            focusNode: _model.textNomeFocusNode,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText:
                                                  'Nome do Estabelecimento',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 20.0,
                                                          16.0, 20.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            validator: _model
                                                .textNomeTextControllerValidator
                                                .asValidator(context),
                                          ),
                                          FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .dropCategoriaValueController ??=
                                                FormListFieldController<
                                                    String>(_model
                                                        .dropCategoriaValue ??=
                                                    List<String>.from(
                                              localEditLocaisRecord
                                                          .categoriasStrings.isNotEmpty
                                                  ? localEditLocaisRecord
                                                      .categoriasStrings
                                                  : List.generate(
                                                          random_data
                                                              .randomInteger(
                                                                  5, 5),
                                                          (index) => random_data
                                                                  .randomString(
                                                                0,
                                                                0,
                                                                true,
                                                                false,
                                                                false,
                                                              )) ??
                                                      [],
                                            )),
                                            options: List<String>.from(
                                                containerAppConfiguracoesRecord!
                                                    .categorias
                                                    .where((e) =>
                                                        !valueOrDefault<bool>(
                                                          e.arquivado,
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) => e.order,
                                                        desc: false)
                                                    .map((e) => e.id)
                                                    .toList()),
                                            optionLabels:
                                                containerAppConfiguracoesRecord
                                                    .categorias
                                                    .where((e) =>
                                                        !valueOrDefault<bool>(
                                                          e.arquivado,
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) => e.order,
                                                        desc: false)
                                                    .map((e) => e.nome)
                                                    .toList(),
                                            width: double.infinity,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            hintText: 'Categoria Principal',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 14.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) async {
                                              setState(() => _model
                                                  .dropCategoriaValue = val);
                                              logFirebaseEvent(
                                                  'LOCAL_EDIT_dropCategoria_ON_FORM_WIDGET_');
                                              setState(() {
                                                _model
                                                    .dropSubcategoriaValueController
                                                    ?.reset();
                                              });
                                            },
                                            labelText: '',
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                          ),
                                          FlutterFlowDropDown<String>(
                                            multiSelectController: _model
                                                    .dropSubcategoriaValueController ??=
                                                FormListFieldController<
                                                    String>(_model
                                                        .dropSubcategoriaValue ??=
                                                    List<String>.from(
                                              localEditLocaisRecord
                                                          .subcategoriasStrings.isNotEmpty
                                                  ? localEditLocaisRecord
                                                      .subcategoriasStrings
                                                  : List.generate(
                                                          random_data
                                                              .randomInteger(
                                                                  5, 5),
                                                          (index) => random_data
                                                                  .randomString(
                                                                0,
                                                                0,
                                                                true,
                                                                false,
                                                                false,
                                                              )) ??
                                                      [],
                                            )),
                                            options: List<String>.from(
                                                containerAppConfiguracoesRecord
                                                    .subCategorias
                                                    .where((e) =>
                                                        !valueOrDefault<bool>(
                                                          e.arquivado,
                                                          false,
                                                        ) &&
                                                        valueOrDefault<bool>(
                                                          _model
                                                              .dropCategoriaValue
                                                              ?.contains(e
                                                                  .refCategoria),
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.refCategoria,
                                                        desc: false)
                                                    .map((e) => e.id)
                                                    .toList()),
                                            optionLabels:
                                                containerAppConfiguracoesRecord
                                                    .subCategorias
                                                    .where((e) =>
                                                        !valueOrDefault<bool>(
                                                          e.arquivado,
                                                          false,
                                                        ) &&
                                                        valueOrDefault<bool>(
                                                          _model
                                                              .dropCategoriaValue
                                                              ?.contains(e
                                                                  .refCategoria),
                                                          false,
                                                        ))
                                                    .toList()
                                                    .sortedList(
                                                        keyOf: (e) =>
                                                            e.refCategoria,
                                                        desc: false)
                                                    .map((e) => e.nome)
                                                    .toList(),
                                            width: double.infinity,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            hintText: 'Sub-Categorias',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 14.0,
                                            margin:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 16.0, 8.0),
                                            hidesUnderline: true,
                                            disabled: _model.dropCategoriaValue
                                                    ?.length ==
                                                0,
                                            isOverButton: true,
                                            isSearchable: false,
                                            isMultiSelect: true,
                                            onMultiSelectChanged: (val) =>
                                                setState(() => _model
                                                        .dropSubcategoriaValue =
                                                    val),
                                            labelText: '',
                                            labelTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMediumFamily),
                                                    ),
                                          ),
                                          SwitchListTile.adaptive(
                                            value: _model
                                                    .switchAgendamentoValue ??=
                                                localEditLocaisRecord
                                                    .sobAgendamento,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchAgendamentoValue =
                                                  newValue);
                                            },
                                            title: Text(
                                              'Somente sob reserva/agendamento',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                            ),
                                            subtitle: Text(
                                              'Este local somente recebe clientes mediante agendamento prévio',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            dense: true,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 8.0, 4.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          SwitchListTile.adaptive(
                                            value: _model
                                                    .switchEntradaPagaValue ??=
                                                localEditLocaisRecord
                                                    .entradaPaga,
                                            onChanged: (newValue) async {
                                              setState(() => _model
                                                      .switchEntradaPagaValue =
                                                  newValue);
                                            },
                                            title: Text(
                                              'Entrada Paga',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                            ),
                                            subtitle: Text(
                                              'É preciso pagar para entrar neste local',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                            tileColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            dense: true,
                                            controlAffinity:
                                                ListTileControlAffinity
                                                    .trailing,
                                            contentPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 8.0, 4.0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      _model.switchEntradaPagaValue,
                                      false,
                                    ))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Form(
                                            key: _model.formKey3,
                                            autovalidateMode:
                                                AutovalidateMode.disabled,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  child: SizedBox(
                                                    width: double.infinity,
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textDescricaoValorTextController,
                                                      focusNode: _model
                                                          .textDescricaoValorFocusNode,
                                                      textCapitalization:
                                                          TextCapitalization
                                                              .words,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelText: 'Descrição',
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                        alignLabelWithHint:
                                                            true,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 2.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      14.0),
                                                        ),
                                                        filled: true,
                                                        fillColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBackground,
                                                        contentPadding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    10.0,
                                                                    16.0,
                                                                    10.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      validator: _model
                                                          .textDescricaoValorTextControllerValidator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 100.0,
                                                  child: TextFormField(
                                                    controller: _model
                                                        .textValorTextController,
                                                    focusNode: _model
                                                        .textValorFocusNode,
                                                    textCapitalization:
                                                        TextCapitalization.none,
                                                    textInputAction:
                                                        TextInputAction.done,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: false,
                                                      labelText: 'Valor',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                      alignLabelWithHint: true,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14.0),
                                                      ),
                                                      filled: true,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                      contentPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  10.0,
                                                                  16.0,
                                                                  10.0),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    validator: _model
                                                        .textValorTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    borderRadius: 40.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 48.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_EDIT_PAGE_btnAddValor_ON_TAP');
                                                      if (_model.formKey3
                                                                  .currentState ==
                                                              null ||
                                                          !_model.formKey3
                                                              .currentState!
                                                              .validate()) {
                                                        return;
                                                      }

                                                      await localEditLocaisRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'entradaValores':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              getEntradaPagaFirestoreData(
                                                                updateEntradaPagaStruct(
                                                                  EntradaPagaStruct(
                                                                    descricao: _model
                                                                        .textDescricaoValorTextController
                                                                        .text,
                                                                    valor: functions
                                                                        .formatCurrency(_model
                                                                            .textValorTextController
                                                                            .text),
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                                true,
                                                              )
                                                            ]),
                                                          },
                                                        ),
                                                      });
                                                      setState(() {
                                                        _model
                                                            .textDescricaoValorTextController
                                                            ?.clear();
                                                        _model
                                                            .textValorTextController
                                                            ?.clear();
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                          ),
                                          if (localEditLocaisRecord
                                                  .entradaValores.isNotEmpty)
                                            Builder(
                                              builder: (context) {
                                                final valorEntradas =
                                                    localEditLocaisRecord
                                                        .entradaValores
                                                        .toList();

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      valorEntradas.length,
                                                  itemBuilder: (context,
                                                      valorEntradasIndex) {
                                                    final valorEntradasItem =
                                                        valorEntradas[
                                                            valorEntradasIndex];
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                valorEntradasItem
                                                                    .descricao,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                valorEntradasItem
                                                                    .valor,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                                currency: 'R\$',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius:
                                                                  20.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 38.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .delete_outline,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                logFirebaseEvent(
                                                                    'LOCAL_EDIT_delete_outline_ICN_ON_TAP');

                                                                await localEditLocaisRecord
                                                                    .reference
                                                                    .update({
                                                                  ...mapToFirestore(
                                                                    {
                                                                      'entradaValores':
                                                                          FieldValue
                                                                              .arrayRemove([
                                                                        getEntradaPagaFirestoreData(
                                                                          updateEntradaPagaStruct(
                                                                            valorEntradasItem,
                                                                            clearUnsetFields:
                                                                                false,
                                                                          ),
                                                                          true,
                                                                        )
                                                                      ]),
                                                                    },
                                                                  ),
                                                                });
                                                              },
                                                            ),
                                                          ]
                                                              .divide(const SizedBox(
                                                                  width: 10.0))
                                                              .addToStart(
                                                                  const SizedBox(
                                                                      width:
                                                                          12.0)),
                                                        ),
                                                        Divider(
                                                          height: 10.0,
                                                          thickness: 1.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .linhasSeparadores,
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Descrição do Local',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Comfortaa'),
                                            ),
                                      ),
                                    ),
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'LOCAL_EDIT_Container_w5h2656p_ON_TAP');
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return WebViewAware(
                                              child: GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .unfocus(),
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: DescricaoEditWidget(
                                                    descricaoAtual:
                                                        localEditLocaisRecord
                                                            .descricao,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() =>
                                            _model.novaDescricao = value));

                                        await widget.refLocal!
                                            .update(createLocaisRecordData(
                                          descricao: _model.novaDescricao,
                                        ));
                                        HapticFeedback.lightImpact();

                                        setState(() {});
                                      },
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                        child: Container(
                                          width: double.infinity,
                                          height: 250.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: SingleChildScrollView(
                                            primary: false,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Text(
                                                    localEditLocaisRecord
                                                        .descricao,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Formas de Pagamento Aceitas',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Comfortaa'),
                                            ),
                                      ),
                                    ),
                                    FlutterFlowChoiceChips(
                                      options: const [
                                        ChipData('Pix', Icons.pix),
                                        ChipData('Crédito', Icons.credit_card),
                                        ChipData(
                                            'Débito', Icons.credit_score_sharp),
                                        ChipData('Dinheiro',
                                            Icons.monetization_on_outlined)
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .chipsFormasPagamentoValues = val),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      chipSpacing: 12.0,
                                      rowSpacing: 12.0,
                                      multiselect: true,
                                      initialized:
                                          _model.chipsFormasPagamentoValues !=
                                              null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .chipsFormasPagamentoValueController ??=
                                          FormFieldController<List<String>>(
                                        localEditLocaisRecord.formasPagamento,
                                      ),
                                      wrapped: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Link para cardápio',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Comfortaa'),
                                            ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.textWebsiteTextController1 ??=
                                              TextEditingController(
                                        text:
                                            localEditLocaisRecord.linkCardapio,
                                      ),
                                      focusNode: _model.textWebsiteFocusNode1,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Link Cardápio (se houver)',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textWebsiteTextController1Validator
                                          .asValidator(context),
                                    ),
                                  ].divide(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        ),
                        FutureBuilder<List<AppConfiguracoesRecord>>(
                          future: FFAppState().appConfiguracoes(
                            uniqueQueryKey: 'editLocal',
                            requestFn: () => queryAppConfiguracoesRecordOnce(
                              singleRecord: true,
                            ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<AppConfiguracoesRecord>
                                comodidadesContainerAppConfiguracoesRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final comodidadesContainerAppConfiguracoesRecord =
                                comodidadesContainerAppConfiguracoesRecordList
                                        .isNotEmpty
                                    ? comodidadesContainerAppConfiguracoesRecordList
                                        .first
                                    : null;

                            return Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Comodidades do local',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily: 'Comfortaa',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey('Comfortaa'),
                                            ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      localEditLocaisRecord
                                              .comodidadesStrings.isEmpty,
                                      true,
                                    ))
                                      AnimatedContainer(
                                        duration: const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                        height: 34.0,
                                        constraints: const BoxConstraints(
                                          minWidth: 80.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const Icon(
                                                Icons.cancel,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
                                              const Text(
                                                'Sem comodidades selecionadas',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14.0,
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 4.0)),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      localEditLocaisRecord
                                              .comodidadesStrings.isNotEmpty,
                                      false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              final comodidades =
                                                  comodidadesContainerAppConfiguracoesRecord
                                                          ?.comodidadesGeral
                                                          .where((e) =>
                                                              valueOrDefault<
                                                                  bool>(
                                                                localEditLocaisRecord
                                                                    .comodidadesStrings
                                                                    .contains(
                                                                        e.id),
                                                                false,
                                                              ))
                                                          .toList()
                                                          .toList() ??
                                                      [];

                                              return Wrap(
                                                spacing: 8.0,
                                                runSpacing: 10.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.none,
                                                children: List.generate(
                                                    comodidades.length,
                                                    (comodidadesIndex) {
                                                  final comodidadesItem =
                                                      comodidades[
                                                          comodidadesIndex];
                                                  return AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 200),
                                                    curve: Curves.easeIn,
                                                    height: 34.0,
                                                    constraints: const BoxConstraints(
                                                      minWidth: 80.0,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              18.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const Icon(
                                                            Icons.wifi,
                                                            color: Colors.white,
                                                            size: 18.0,
                                                          ),
                                                          Text(
                                                            comodidadesItem
                                                                .nome,
                                                            style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 14.0,
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    Align(
                                      alignment: const AlignmentDirectional(1.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 50.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'LOCAL_EDIT_btnEditComodidades_ON_TAP');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child:
                                                        ComodidadesEditWidget(
                                                      jaSelecionados:
                                                          comodidadesContainerAppConfiguracoesRecord
                                                              ?.comodidadesGeral
                                                              .where((e) =>
                                                                  valueOrDefault<
                                                                      bool>(
                                                                    localEditLocaisRecord
                                                                        .comodidadesStrings
                                                                        .contains(
                                                                            e.id),
                                                                    false,
                                                                  ))
                                                              .toList(),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => safeSetState(() =>
                                              _model.novasComodidades = value));

                                          await widget.refLocal!.update({
                                            ...mapToFirestore(
                                              {
                                                'comodidades_strings': _model
                                                    .novasComodidades
                                                    ?.map((e) => e.id)
                                                    .toList(),
                                              },
                                            ),
                                          });
                                          HapticFeedback.lightImpact();

                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 12.0)),
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  'Funcionamento',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Comfortaa'),
                                      ),
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Segunda-feira',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .segundaAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .segundaFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .segunda24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.segundaAbre} às ${localEditLocaisRecord.funcionamento.segundaFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .segundaAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .segundaFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .segunda24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.segunda24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Terça-feira',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .tercaAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .tercaFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .terca24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.tercaAbre} às ${localEditLocaisRecord.funcionamento.tercaFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .tercaAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .tercaFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .terca24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.terca24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quarta-feira',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quartaAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quartaFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .quarta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.quartaAbre} às ${localEditLocaisRecord.funcionamento.quartaFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quartaAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quartaFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .quarta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.quarta24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Quinta-feira',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quintaAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quintaFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .quinta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.quintaAbre} às ${localEditLocaisRecord.funcionamento.quintaFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quintaAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .quintaFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .quinta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.quinta24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sexta-feira',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sextaAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sextaFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .sexta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.sextaAbre} às ${localEditLocaisRecord.funcionamento.sextaFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sextaAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sextaFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .sexta24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.sexta24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Sábado',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sabadoAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sabadoFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .sabado24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.sabadoAbre} às ${localEditLocaisRecord.funcionamento.sabadoFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sabadoAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .sabadoFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .sabado24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.sabado24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Domingo',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                      Text(
                                        () {
                                          if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .domingoAbre !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .domingoFecha !=
                                                        '',
                                                false,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .domingo24h !=
                                                    true,
                                                true,
                                              )) {
                                            return '${localEditLocaisRecord.funcionamento.domingoAbre} às ${localEditLocaisRecord.funcionamento.domingoFecha}';
                                          } else if (valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .domingoAbre ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                            .funcionamento
                                                            .domingoFecha ==
                                                        '',
                                                true,
                                              ) &&
                                              valueOrDefault<bool>(
                                                localEditLocaisRecord
                                                        .funcionamento
                                                        .domingo24h !=
                                                    true,
                                                true,
                                              )) {
                                            return 'Fechado';
                                          } else if (localEditLocaisRecord
                                                  .funcionamento.domingo24h ==
                                              true) {
                                            return '24h';
                                          } else {
                                            return 'Sem horário';
                                          }
                                        }(),
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 8.0,
                                    thickness: 1.0,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ].divide(const SizedBox(height: 2.0)),
                              ),
                              TextFormField(
                                controller:
                                    _model.textObservacoesTextController ??=
                                        TextEditingController(
                                  text: localEditLocaisRecord
                                      .observacoesFuncionamento,
                                ),
                                focusNode: _model.textObservacoesFocusNode,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Observações sobre Funcionamento',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  hintText:
                                      'Insira informações sobre o funcionamento em temporada e dias especiais',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                maxLines: null,
                                minLines: 2,
                                validator: _model
                                    .textObservacoesTextControllerValidator
                                    .asValidator(context),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 50.0,
                                  borderWidth: 1.0,
                                  buttonSize: 48.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LOCAL_EDIT_PAGE_edit_ICN_ON_TAP');
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) {
                                        return WebViewAware(
                                          child: GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FuncionamentoEditWidget(
                                                funcionamento:
                                                    localEditLocaisRecord
                                                        .funcionamento,
                                                observacoesFuncionamento:
                                                    localEditLocaisRecord
                                                        .observacoesFuncionamento,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() =>
                                        _model.novoFuncionamento = value));

                                    await widget.refLocal!
                                        .update(createLocaisRecordData(
                                      funcionamento:
                                          updateFuncionamentoLocalStruct(
                                        _model.novoFuncionamento,
                                        clearUnsetFields: false,
                                      ),
                                    ));
                                    HapticFeedback.lightImpact();

                                    setState(() {});
                                  },
                                ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  'Endereço ',
                                  style: GoogleFonts.getFont(
                                    'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: TextFormField(
                                  controller:
                                      _model.textLogradouroTextController ??=
                                          TextEditingController(
                                    text: localEditLocaisRecord
                                        .enderecoLogradouro,
                                  ),
                                  focusNode: _model.textLogradouroFocusNode,
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Logradouro',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    alignLabelWithHint: true,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 20.0, 16.0, 20.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  validator: _model
                                      .textLogradouroTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      controller:
                                          _model.textNumeroTextController ??=
                                              TextEditingController(
                                        text: localEditLocaisRecord
                                            .enderecoNumero,
                                      ),
                                      focusNode: _model.textNumeroFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Nº',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textNumeroTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 10,
                                    child: TextFormField(
                                      controller:
                                          _model.textBairroTextController ??=
                                              TextEditingController(
                                        text: localEditLocaisRecord
                                            .enderecoBairro,
                                      ),
                                      focusNode: _model.textBairroFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Bairro',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textBairroTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: TextFormField(
                                      controller:
                                          _model.textCidadeTextController ??=
                                              TextEditingController(
                                        text: localEditLocaisRecord
                                                        .enderecoCidade !=
                                                    ''
                                            ? localEditLocaisRecord
                                                .enderecoCidade
                                            : 'Cunha',
                                      ),
                                      focusNode: _model.textCidadeFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Cidade',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textCidadeTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      controller:
                                          _model.textUFTextController ??=
                                              TextEditingController(
                                        text: localEditLocaisRecord
                                                        .enderecoUf !=
                                                    ''
                                            ? localEditLocaisRecord.enderecoUf
                                            : 'SP',
                                      ),
                                      focusNode: _model.textUFFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: false,
                                        labelText: 'Estado',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                16.0, 20.0, 16.0, 20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      validator: _model
                                          .textUFTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 10.0)),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOCAL_EDIT_PAGE_buttonLocalizacao_ON_TAP');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: LocalizacaoEditWidget(
                                              localizacaoAtual:
                                                  localEditLocaisRecord
                                                      .localizacao,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.localizacaoLatLong = value));

                                  await widget.refLocal!
                                      .update(createLocaisRecordData(
                                    localizacao: _model.localizacaoLatLong,
                                  ));

                                  setState(() {});
                                },
                                text: 'Selecionar Localização no Mapa',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: FlutterFlowStaticMap(
                                  location:
                                      localEditLocaisRecord.localizacao != null
                                          ? localEditLocaisRecord.localizacao!
                                          : currentUserLocationValue!,
                                  apiKey:
                                      'pk.eyJ1IjoiZ3Vzb25iYWlhIiwiYSI6ImNsam5vb2x5czE4aHEzZHRndjZ0cWM4dHMifQ.Tydn_dYML6hea1So70wl8A',
                                  style:
                                      mapbox.MapBoxStyle.Satellite_Street_V11,
                                  width: double.infinity,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                  borderRadius: BorderRadius.circular(24.0),
                                  markerColor:
                                      FlutterFlowTheme.of(context).primary,
                                  cached: true,
                                  zoom: 16,
                                  tilt: 0,
                                  rotation: 0,
                                ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: Text(
                                  'Contatos',
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Comfortaa',
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey('Comfortaa'),
                                      ),
                                ),
                              ),
                              TextFormField(
                                controller:
                                    _model.textTelefone1TextController ??=
                                        TextEditingController(
                                  text: localEditLocaisRecord.telefone1,
                                ),
                                focusNode: _model.textTelefone1FocusNode,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Telefone/WhatsApp 1',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .textTelefone1TextControllerValidator
                                    .asValidator(context),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Este número possui WhatsApp',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkWhatsApp1Value ??=
                                          localEditLocaisRecord.whatsapp1,
                                      onChanged: (newValue) async {
                                        setState(() => _model
                                            .checkWhatsApp1Value = newValue!);
                                      },
                                      side: BorderSide(
                                        width: 2,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ],
                              ),
                              TextFormField(
                                controller:
                                    _model.textInstagramTextController ??=
                                        TextEditingController(
                                  text: localEditLocaisRecord.instagram,
                                ),
                                focusNode: _model.textInstagramFocusNode,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Instagram',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .textInstagramTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller: _model.textEmailTextController ??=
                                    TextEditingController(
                                  text: localEditLocaisRecord.email,
                                ),
                                focusNode: _model.textEmailFocusNode,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'E-mail',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .textEmailTextControllerValidator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller:
                                    _model.textWebsiteTextController2 ??=
                                        TextEditingController(
                                  text: localEditLocaisRecord.website,
                                ),
                                focusNode: _model.textWebsiteFocusNode2,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Website',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .textWebsiteTextController2Validator
                                    .asValidator(context),
                              ),
                              TextFormField(
                                controller:
                                    _model.textWebsiteTextController3 ??=
                                        TextEditingController(
                                  text: localEditLocaisRecord.tripadvisorLink,
                                ),
                                focusNode: _model.textWebsiteFocusNode3,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Link TripAdvisor',
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  alignLabelWithHint: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(14.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 20.0, 16.0, 20.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model
                                    .textWebsiteTextController3Validator
                                    .asValidator(context),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Plano CunhaTEM',
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Comfortaa',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey('Comfortaa'),
                                    ),
                              ),
                              Form(
                                key: _model.formKey1,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: StreamBuilder<List<PlanosRecord>>(
                                  stream: queryPlanosRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitPulse(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PlanosRecord>
                                        dropPlanoPlanosRecordList =
                                        snapshot.data!;

                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropPlanoValueController ??=
                                              FormFieldController<String>(
                                        _model.dropPlanoValue ??=
                                            localEditLocaisRecord.planoCunhatem
                                                            ?.id !=
                                                        null &&
                                                    localEditLocaisRecord
                                                            .planoCunhatem
                                                            ?.id !=
                                                        ''
                                                ? dropPlanoPlanosRecordList
                                                    .where((e) =>
                                                        localEditLocaisRecord
                                                            .planoCunhatem
                                                            ?.id ==
                                                        e.reference.id)
                                                    .toList()
                                                    .first
                                                    .id
                                                : '',
                                      ),
                                      options: List<String>.from(
                                          dropPlanoPlanosRecordList
                                              .map((e) => e.id)
                                              .toList()),
                                      optionLabels: dropPlanoPlanosRecordList
                                          .map((e) => e.nome)
                                          .toList(),
                                      onChanged: (val) => setState(
                                          () => _model.dropPlanoValue = val),
                                      width: double.infinity,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 14.0,
                                      margin: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 8.0, 16.0, 8.0),
                                      hidesUnderline: true,
                                      isOverButton: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                      labelText: 'Plano CunhaTem',
                                      labelTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .labelMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelMediumFamily),
                                          ),
                                    );
                                  },
                                ),
                              ),
                              SwitchListTile.adaptive(
                                value: _model.switchFestivalValue ??=
                                    localEditLocaisRecord.selosStrings.contains(
                                            'festivalgastronomico2024')
                                        ? true
                                        : false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.switchFestivalValue = newValue);
                                },
                                title: Text(
                                  'Selo Festival Gastronômico 2024',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyLargeFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily),
                                      ),
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                activeTrackColor:
                                    FlutterFlowTheme.of(context).primary,
                                dense: true,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 8.0, 4.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
                          ),
                        ),
                      ]
                          .divide(const SizedBox(height: 20.0))
                          .addToStart(const SizedBox(height: 16.0))
                          .addToEnd(const SizedBox(height: 150.0)),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Visibility(
                        visible: !(isWeb
                            ? MediaQuery.viewInsetsOf(context).bottom > 0
                            : _isKeyboardVisible),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 6.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: const CircleBorder(),
                                child: Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 60.0,
                                    buttonSize: 50.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).tertiary,
                                    icon: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.white,
                                      size: 28.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'LOCAL_EDIT_PAGE_deleteLocal_ON_TAP');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Deseja excluir este local?'),
                                                      content: const Text(
                                                          'Este local será arquivado e excluído em 30 dias.'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child:
                                                              const Text('Cancelar'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child:
                                                              const Text('Confirmar'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await widget.refLocal!.update({
                                          ...createLocaisRecordData(
                                            deletadoPor: currentUserReference,
                                            visivel: false,
                                            lixeira: true,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'deletado_em':
                                                  FieldValue.serverTimestamp(),
                                            },
                                          ),
                                        });
                                        context.pop();
                                        Navigator.pop(context);
                                        FFAppState()
                                            .clearLocaisCacheKey('listaLocais');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${localEditLocaisRecord.nome} foi arquivado e será excluído em  30 dias',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 3000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'LOCAL_EDIT_PAGE_buttonSalvar_ON_TAP');
                                    var shouldSetState = false;
                                    if (_model.formKey4.currentState == null ||
                                        !_model.formKey4.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.dropCategoriaValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            'Categoria é obrigatória',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.dropSubcategoriaValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            'Sub-Categorias são obrigatórios',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.formKey1.currentState == null ||
                                        !_model.formKey1.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    if (_model.dropPlanoValue == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Plano é obrigatório',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          duration:
                                              const Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .tertiary,
                                        ),
                                      );
                                      return;
                                    }
                                    if (_model.formKey2.currentState == null ||
                                        !_model.formKey2.currentState!
                                            .validate()) {
                                      return;
                                    }
                                    _model.categorias =
                                        await queryAppConfiguracoesRecordOnce(
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    shouldSetState = true;
                                    _model.planoSelecionado =
                                        await queryPlanosRecordOnce(
                                      queryBuilder: (planosRecord) =>
                                          planosRecord.where(
                                        'id',
                                        isEqualTo: _model.dropPlanoValue,
                                      ),
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    shouldSetState = true;
                                    _model.categoriasSelecionadas =
                                        _model.categorias!.categorias
                                            .where((e) => valueOrDefault<bool>(
                                                  _model.dropCategoriaValue
                                                      ?.contains(e.id),
                                                  false,
                                                ))
                                            .toList()
                                            .cast<CategoriasStruct>();
                                    _model.categoriasStrings =
                                        _model.categorias!.categorias
                                            .where((e) => valueOrDefault<bool>(
                                                  _model.dropCategoriaValue
                                                      ?.contains(e.id),
                                                  false,
                                                ))
                                            .toList()
                                            .map((e) => e.id)
                                            .toList()
                                            .cast<String>();
                                    setState(() {});
                                    _model.subCategoriasSelecionadas =
                                        _model.categorias!.subCategorias
                                            .where((e) => valueOrDefault<bool>(
                                                  _model.dropSubcategoriaValue
                                                      ?.contains(e.id),
                                                  false,
                                                ))
                                            .toList()
                                            .cast<SubCategoriasStruct>();
                                    _model.subcategoriasStrings =
                                        _model.categorias!.subCategorias
                                            .where((e) =>
                                                valueOrDefault<bool>(
                                                  _model.dropSubcategoriaValue
                                                      ?.contains(e.id),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  _model.categoriasStrings
                                                      .contains(e.refCategoria),
                                                  false,
                                                ))
                                            .toList()
                                            .map((e) => e.id)
                                            .toList()
                                            .cast<String>();
                                    setState(() {});
                                    if (functions.conferirCategoriasSubs(
                                        _model.categoriasSelecionadas
                                            .map((e) => e.id)
                                            .toList(),
                                        _model.subCategoriasSelecionadas
                                            .map((e) => e.refCategoria)
                                            .toList())) {
                                      await widget.refLocal!.update({
                                        ...createLocaisRecordData(
                                          nome: _model
                                              .textNomeTextController.text,
                                          enderecoLogradouro: _model
                                              .textLogradouroTextController
                                              .text,
                                          enderecoNumero: _model
                                              .textNumeroTextController.text,
                                          enderecoCidade: _model
                                              .textCidadeTextController.text,
                                          enderecoUf:
                                              _model.textUFTextController.text,
                                          telefone1: _model
                                              .textTelefone1TextController.text,
                                          whatsapp1: _model.checkWhatsApp1Value,
                                          instagram: _model
                                              .textInstagramTextController.text,
                                          email: _model
                                              .textEmailTextController.text,
                                          website: _model
                                              .textWebsiteTextController2.text,
                                          planoCunhatem: _model
                                              .planoSelecionado?.reference,
                                          enderecoBairro: _model
                                              .textBairroTextController.text,
                                          linkCardapio: _model
                                              .textWebsiteTextController1.text,
                                          sobAgendamento:
                                              _model.switchAgendamentoValue,
                                          entradaPaga:
                                              _model.switchEntradaPagaValue,
                                          observacoesFuncionamento: _model
                                              .textObservacoesTextController
                                              .text,
                                          tripadvisorLink: _model
                                              .textWebsiteTextController3.text,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'formas_pagamento': _model
                                                .chipsFormasPagamentoValues,
                                            'categorias_strings':
                                                _model.categoriasStrings,
                                            'subcategorias_strings':
                                                _model.subcategoriasStrings,
                                          },
                                        ),
                                      });
                                      if (_model.switchFestivalValue!) {
                                        await widget.refLocal!.update({
                                          ...mapToFirestore(
                                            {
                                              'selos_strings':
                                                  FieldValue.arrayUnion([
                                                'festivalgastronomico2024'
                                              ]),
                                            },
                                          ),
                                        });
                                      } else {
                                        await widget.refLocal!.update({
                                          ...mapToFirestore(
                                            {
                                              'selos_strings':
                                                  FieldValue.delete(),
                                            },
                                          ),
                                        });
                                      }

                                      FFAppState()
                                          .clearLocaisCacheKey('listaLocais');
                                      HapticFeedback.lightImpact();
                                      context.safePop();
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: const Text('Erro!'),
                                              content: const Text(
                                                  'Você deve escolher pelo menos uma Sub-Categoria para cada Categoria selecionada'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: const Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (shouldSetState) setState(() {});
                                      return;
                                    }

                                    if (shouldSetState) setState(() {});
                                  },
                                  text: 'Salvar',
                                  options: FFButtonOptions(
                                    height: 50.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).success,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                    elevation: 4.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(50.0),
                                    hoverColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                              ),
                            ]
                                .divide(const SizedBox(width: 10.0))
                                .addToStart(const SizedBox(width: 12.0))
                                .addToEnd(const SizedBox(width: 12.0)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
