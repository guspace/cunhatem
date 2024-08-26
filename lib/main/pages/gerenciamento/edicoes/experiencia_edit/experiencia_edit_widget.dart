import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/edicoes/edit_fotos/edit_fotos_widget.dart';
import '/main/pages/gerenciamento/modais/descricao_edit/descricao_edit_widget.dart';
import '/main/pages/gerenciamento/modais/localizacao_edit/localizacao_edit_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'experiencia_edit_model.dart';
export 'experiencia_edit_model.dart';

class ExperienciaEditWidget extends StatefulWidget {
  const ExperienciaEditWidget({
    super.key,
    required this.refExperiencia,
    bool? novo,
  }) : novo = novo ?? false;

  final DocumentReference? refExperiencia;
  final bool novo;

  @override
  State<ExperienciaEditWidget> createState() => _ExperienciaEditWidgetState();
}

class _ExperienciaEditWidgetState extends State<ExperienciaEditWidget> {
  late ExperienciaEditModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExperienciaEditModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'experienciaEdit'});
    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        setState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.nomeFocusNode ??= FocusNode();

    _model.vinculoLocalTextController ??= TextEditingController();

    _model.textDescricaoValorTextController ??= TextEditingController();
    _model.textDescricaoValorFocusNode ??= FocusNode();

    _model.textValorTextController ??= TextEditingController();
    _model.textValorFocusNode ??= FocusNode();

    _model.duracaoFocusNode ??= FocusNode();

    _model.textLogradouroFocusNode ??= FocusNode();

    _model.textNumeroFocusNode ??= FocusNode();

    _model.textBairroFocusNode ??= FocusNode();

    _model.textCidadeTextController ??= TextEditingController();
    _model.textCidadeFocusNode ??= FocusNode();

    _model.textUFTextController ??= TextEditingController();
    _model.textUFFocusNode ??= FocusNode();

    _model.telefone1FocusNode ??= FocusNode();

    _model.instagramFocusNode ??= FocusNode();

    _model.emailFocusNode ??= FocusNode();

    _model.websiteFocusNode ??= FocusNode();

    _model.tripadvisorFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.textCidadeTextController?.text = 'Cunha';
          _model.textUFTextController?.text = 'SP';
        }));
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
    return StreamBuilder<ExperienciasRecord>(
      stream: ExperienciasRecord.getDocument(widget.refExperiencia!),
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

        final experienciaEditExperienciasRecord = snapshot.data!;

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
                                      'EXPERIENCIA_EDIT_PAGE_close_ICN_ON_TAP');
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
                                        ? 'Nova Experiência'
                                        : 'Editar Experiência',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        wrapWithModel(
                          model: _model.editFotosModel,
                          updateCallback: () => setState(() {}),
                          child: EditFotosWidget(
                            refExperiencia: widget.refExperiencia,
                            listaFotos:
                                experienciaEditExperienciasRecord.galeriaFotos,
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
                                  'Informações básicas',
                                  style: GoogleFonts.getFont(
                                    'Comfortaa',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _model.nomeTextController ??=
                                    TextEditingController(
                                  text: experienciaEditExperienciasRecord.nome,
                                ),
                                focusNode: _model.nomeFocusNode,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelText: 'Nome da Experiência',
                                  labelStyle: FlutterFlowTheme.of(context)
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
                                  alignLabelWithHint: false,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
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
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                                validator: _model.nomeTextControllerValidator
                                    .asValidator(context),
                              ),
                              SwitchListTile.adaptive(
                                value: _model.switchVincularLocalValue ??=
                                    experienciaEditExperienciasRecord
                                        .vinculadoLocal,
                                onChanged: (newValue) async {
                                  setState(() => _model
                                      .switchVincularLocalValue = newValue);
                                },
                                title: Text(
                                  'Vincular 1 ou mais Locais',
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
                                subtitle: Text(
                                  'Esta experiência está relacionada com um ou mais locais cadastrados',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily),
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
                              if (valueOrDefault<bool>(
                                _model.switchVincularLocalValue,
                                false,
                              ))
                                FutureBuilder<List<LocaisRecord>>(
                                  future: FFAppState().locais(
                                    uniqueQueryKey: 'eventoEdit',
                                    requestFn: () => queryLocaisRecordOnce(
                                      queryBuilder: (locaisRecord) =>
                                          locaisRecord
                                              .where(
                                                'visivel',
                                                isEqualTo: true,
                                              )
                                              .where(
                                                'lixeira',
                                                isEqualTo: false,
                                              ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<LocaisRecord>
                                        locaisVinculadosLocaisRecordList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: const BoxDecoration(),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Locais Vinculados',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily: 'Comfortaa',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts:
                                                            GoogleFonts.asMap()
                                                                .containsKey(
                                                                    'Comfortaa'),
                                                      ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Form(
                                                    key: _model.formKey3,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .disabled,
                                                    child: SizedBox(
                                                      width: double.infinity,
                                                      child:
                                                          Autocomplete<String>(
                                                        initialValue:
                                                            const TextEditingValue(),
                                                        optionsBuilder:
                                                            (textEditingValue) {
                                                          if (textEditingValue
                                                                  .text ==
                                                              '') {
                                                            return const Iterable<
                                                                String>.empty();
                                                          }
                                                          return locaisVinculadosLocaisRecordList
                                                              .map(
                                                                  (e) => e.nome)
                                                              .toList()
                                                              .where((option) {
                                                            final lowercaseOption =
                                                                option
                                                                    .toLowerCase();
                                                            return lowercaseOption
                                                                .contains(
                                                                    textEditingValue
                                                                        .text
                                                                        .toLowerCase());
                                                          });
                                                        },
                                                        optionsViewBuilder:
                                                            (context,
                                                                onSelected,
                                                                options) {
                                                          return AutocompleteOptionsList(
                                                            textFieldKey: _model
                                                                .vinculoLocalKey,
                                                            textController: _model
                                                                .vinculoLocalTextController!,
                                                            options: options
                                                                .toList(),
                                                            onSelected:
                                                                onSelected,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            textHighlightStyle:
                                                                const TextStyle(),
                                                            elevation: 4.0,
                                                            optionBackgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            optionHighlightColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            maxHeight: 200.0,
                                                          );
                                                        },
                                                        onSelected:
                                                            (String selection) {
                                                          setState(() => _model
                                                                  .vinculoLocalSelectedOption =
                                                              selection);
                                                          FocusScope.of(context)
                                                              .unfocus();
                                                        },
                                                        fieldViewBuilder: (
                                                          context,
                                                          textEditingController,
                                                          focusNode,
                                                          onEditingComplete,
                                                        ) {
                                                          _model.vinculoLocalFocusNode =
                                                              focusNode;

                                                          _model.vinculoLocalTextController =
                                                              textEditingController;
                                                          return TextFormField(
                                                            key: _model
                                                                .vinculoLocalKey,
                                                            controller:
                                                                textEditingController,
                                                            focusNode:
                                                                focusNode,
                                                            onEditingComplete:
                                                                onEditingComplete,
                                                            textCapitalization:
                                                                TextCapitalization
                                                                    .words,
                                                            textInputAction:
                                                                TextInputAction
                                                                    .done,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              labelText:
                                                                  'Insira um Local',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                              alignLabelWithHint:
                                                                  true,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
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
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          16.0,
                                                                          16.0,
                                                                          16.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
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
                                                                .vinculoLocalTextControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      borderRadius: 40.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 44.0,
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
                                                            'EXPERIENCIA_EDIT_PAGE_btnAddLocal_ON_TAP');
                                                        if (_model.formKey3
                                                                    .currentState ==
                                                                null ||
                                                            !_model.formKey3
                                                                .currentState!
                                                                .validate()) {
                                                          return;
                                                        }
                                                        _model.vincularLocal =
                                                            await queryLocaisRecordOnce(
                                                          queryBuilder:
                                                              (locaisRecord) =>
                                                                  locaisRecord
                                                                      .where(
                                                            'nome',
                                                            isEqualTo: _model
                                                                .vinculoLocalTextController
                                                                .text,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);

                                                        await widget
                                                            .refExperiencia!
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'vinculo_locais':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                _model
                                                                    .vincularLocal
                                                                    ?.reference
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        setState(() {
                                                          _model
                                                              .vinculoLocalTextController
                                                              ?.clear();
                                                        });

                                                        setState(() {});
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 10.0)),
                                            ),
                                            if (valueOrDefault<bool>(
                                              experienciaEditExperienciasRecord
                                                      .vinculoLocais.isNotEmpty,
                                              false,
                                            ))
                                              Builder(
                                                builder: (context) {
                                                  final valorExperiencia =
                                                      locaisVinculadosLocaisRecordList
                                                          .where((e) =>
                                                              valueOrDefault<
                                                                  bool>(
                                                                experienciaEditExperienciasRecord
                                                                    .vinculoLocais
                                                                    .contains(e
                                                                        .reference),
                                                                false,
                                                              ))
                                                          .toList();

                                                  return ListView.builder(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        valorExperiencia.length,
                                                    itemBuilder: (context,
                                                        valorExperienciaIndex) {
                                                      final valorExperienciaItem =
                                                          valorExperiencia[
                                                              valorExperienciaIndex];
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    valorExperienciaItem
                                                                        .nome,
                                                                    'Nome do local Vinculado',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                                ),
                                                              ),
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    38.0,
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
                                                                      'EXPERIENCIA_EDIT_delete_outline_ICN_ON_T');

                                                                  await widget
                                                                      .refExperiencia!
                                                                      .update({
                                                                    ...mapToFirestore(
                                                                      {
                                                                        'vinculo_locais':
                                                                            FieldValue.arrayRemove([
                                                                          valorExperienciaItem
                                                                              .reference
                                                                        ]),
                                                                      },
                                                                    ),
                                                                  });
                                                                },
                                                              ),
                                                            ]
                                                                .divide(const SizedBox(
                                                                    width:
                                                                        10.0))
                                                                .addToStart(
                                                                    const SizedBox(
                                                                        width:
                                                                            4.0)),
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
                                      ),
                                    );
                                  },
                                ),
                              SwitchListTile.adaptive(
                                value: _model.switchExperienciaPagaValue ??=
                                    experienciaEditExperienciasRecord
                                        .experienciaPaga,
                                onChanged: (newValue) async {
                                  setState(() => _model
                                      .switchExperienciaPagaValue = newValue);
                                },
                                title: Text(
                                  'Experiência Paga',
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
                                subtitle: Text(
                                  'Esta experiência é oferecida mediante pagamento',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily),
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
                              if (valueOrDefault<bool>(
                                _model.switchExperienciaPagaValue,
                                false,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Valor por pessoa',
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
                                      key: _model.formKey2,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                                    TextCapitalization.words,
                                                textInputAction:
                                                    TextInputAction.next,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  labelText: 'Descrição',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
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
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  contentPadding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(16.0, 10.0,
                                                              16.0, 10.0),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                              focusNode:
                                                  _model.textValorFocusNode,
                                              textCapitalization:
                                                  TextCapitalization.none,
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelText: 'Valor',
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          14.0),
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
                                                      BorderRadius.circular(
                                                          14.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                contentPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(16.0, 10.0,
                                                            16.0, 10.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(
                                                  decimal: true),
                                              validator: _model
                                                  .textValorTextControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 4.0, 0.0, 0.0),
                                              child: FlutterFlowIconButton(
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                borderRadius: 40.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 24.0,
                                                ),
                                                onPressed: () async {
                                                  logFirebaseEvent(
                                                      'EXPERIENCIA_EDIT_PAGE_btnAddValor_ON_TAP');
                                                  if (_model.formKey2
                                                              .currentState ==
                                                          null ||
                                                      !_model.formKey2
                                                          .currentState!
                                                          .validate()) {
                                                    return;
                                                  }

                                                  await widget.refExperiencia!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'valores': FieldValue
                                                            .arrayUnion([
                                                          getEntradaPagaFirestoreData(
                                                            createEntradaPagaStruct(
                                                              descricao: _model
                                                                  .textDescricaoValorTextController
                                                                  .text,
                                                              valor:
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.formatCurrency(
                                                                    _model
                                                                        .textValorTextController
                                                                        .text),
                                                                0.0,
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
                                                        .textValorTextController
                                                        ?.clear();
                                                    _model
                                                        .textDescricaoValorTextController
                                                        ?.clear();
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 10.0)),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      experienciaEditExperienciasRecord
                                              .valores.isNotEmpty,
                                      false,
                                    ))
                                      Builder(
                                        builder: (context) {
                                          final valorExperiencia =
                                              experienciaEditExperienciasRecord
                                                  .valores
                                                  .toList();

                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: valorExperiencia.length,
                                            itemBuilder: (context,
                                                valorExperienciaIndex) {
                                              final valorExperienciaItem =
                                                  valorExperiencia[
                                                      valorExperienciaIndex];
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
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
                                                          valorExperienciaItem
                                                              .descricao,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          valorExperienciaItem
                                                              .valor,
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .automatic,
                                                          currency: 'R\$',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 20.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 38.0,
                                                        icon: Icon(
                                                          Icons.delete_outline,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          logFirebaseEvent(
                                                              'EXPERIENCIA_EDIT_delete_outline_ICN_ON_T');

                                                          await widget
                                                              .refExperiencia!
                                                              .update({
                                                            ...mapToFirestore(
                                                              {
                                                                'valores':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  getEntradaPagaFirestoreData(
                                                                    updateEntradaPagaStruct(
                                                                      valorExperienciaItem,
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
                                                        .addToStart(const SizedBox(
                                                            width: 12.0)),
                                                  ),
                                                  Divider(
                                                    height: 10.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .linhasSeparadores,
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
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
                                        experienciaEditExperienciasRecord
                                            .formasPagamento,
                                      ),
                                      wrapped: true,
                                    ),
                                  ].divide(const SizedBox(height: 12.0)),
                                ),
                              SwitchListTile.adaptive(
                                value: _model.switchAgendamentoValue ??=
                                    experienciaEditExperienciasRecord
                                        .sobAgendamento,
                                onChanged: (newValue) async {
                                  setState(() => _model.switchAgendamentoValue =
                                      newValue);
                                },
                                title: Text(
                                  'Somente sob reserva/agendamento',
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
                                subtitle: Text(
                                  'Se o cliente já puder chegar no local e realizar a experiência, deixe essa opção desmarcada',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .labelSmallFamily,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily),
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
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'EXPERIENCIA_EDIT_Container_2lbvis8e_ON_T');
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
                                            child: DescricaoEditWidget(
                                              descricaoAtual:
                                                  experienciaEditExperienciasRecord
                                                      .descricao,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.novaDescricao = value));

                                  await widget.refExperiencia!
                                      .update(createExperienciasRecordData(
                                    descricao: _model.novaDescricao,
                                  ));
                                  HapticFeedback.lightImpact();

                                  setState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 250.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(14.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
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
                                              valueOrDefault<String>(
                                                experienciaEditExperienciasRecord
                                                    .descricao,
                                                'Sem descrição',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tempo de Duração',
                                    style: GoogleFonts.getFont(
                                      'Comfortaa',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    'Duração da experiência em média',
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Form(
                                      key: _model.formKey1,
                                      autovalidateMode:
                                          AutovalidateMode.disabled,
                                      child: SizedBox(
                                        width: 180.0,
                                        child: TextFormField(
                                          controller:
                                              _model.duracaoTextController ??=
                                                  TextEditingController(
                                            text:
                                                experienciaEditExperienciasRecord
                                                    .duracaoHoras,
                                          ),
                                          focusNode: _model.duracaoFocusNode,
                                          textCapitalization:
                                              TextCapitalization.none,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelText: 'Duração em Horas',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .duracaoTextControllerValidator
                                              .asValidator(context),
                                          inputFormatters: [_model.duracaoMask],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                                'Endereço',
                                style: GoogleFonts.getFont(
                                  'Comfortaa',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: TextFormField(
                                      controller: _model
                                              .textLogradouroTextController ??=
                                          TextEditingController(
                                        text: experienciaEditExperienciasRecord
                                            .enderecoLogradouro,
                                      ),
                                      focusNode: _model.textLogradouroFocusNode,
                                      textCapitalization:
                                          TextCapitalization.words,
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
                                          controller: _model
                                                  .textNumeroTextController ??=
                                              TextEditingController(
                                            text:
                                                experienciaEditExperienciasRecord
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                          controller: _model
                                                  .textBairroTextController ??=
                                              TextEditingController(
                                            text:
                                                experienciaEditExperienciasRecord
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                              _model.textCidadeTextController,
                                          focusNode: _model.textCidadeFocusNode,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelText: 'Cidade',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                              _model.textUFTextController,
                                          focusNode: _model.textUFFocusNode,
                                          textCapitalization:
                                              TextCapitalization.words,
                                          textInputAction: TextInputAction.next,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelText: 'Estado',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(14.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                          'EXPERIENCIA_EDIT_buttonLocalizacao_ON_TA');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
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
                                                child: LocalizacaoEditWidget(
                                                  localizacaoAtual:
                                                      experienciaEditExperienciasRecord
                                                          .localizacao,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() =>
                                          _model.novaLocalizacao = value));

                                      await widget.refExperiencia!
                                          .update(createExperienciasRecordData(
                                        localizacao: _model.novaLocalizacao,
                                      ));

                                      setState(() {});
                                    },
                                    text: 'Selecionar Localização no Mapa',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 44.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
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
                                          experienciaEditExperienciasRecord
                                              .localizacao!,
                                      apiKey:
                                          'pk.eyJ1IjoiZ3Vzb25iYWlhIiwiYSI6ImNsam5vb2x5czE4aHEzZHRndjZ0cWM4dHMifQ.Tydn_dYML6hea1So70wl8A',
                                      style: mapbox
                                          .MapBoxStyle.Satellite_Street_V11,
                                      width: double.infinity,
                                      height: 250.0,
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
                                'Contatos',
                                style: GoogleFonts.getFont(
                                  'Comfortaa',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  TextFormField(
                                    controller:
                                        _model.telefone1TextController ??=
                                            TextEditingController(
                                      text: experienciaEditExperienciasRecord
                                          .telefone1,
                                    ),
                                    focusNode: _model.telefone1FocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Telefone/WhatsApp 1',
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
                                        .telefone1TextControllerValidator
                                        .asValidator(context),
                                    inputFormatters: [_model.telefone1Mask],
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
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily),
                                            ),
                                      ),
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                          value: _model.whatsApp1Value ??=
                                              experienciaEditExperienciasRecord
                                                  .whatsapp1,
                                          onChanged: (newValue) async {
                                            setState(() => _model
                                                .whatsApp1Value = newValue!);
                                          },
                                          side: BorderSide(
                                            width: 2,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.instagramTextController ??=
                                            TextEditingController(
                                      text: experienciaEditExperienciasRecord
                                          .instagram,
                                    ),
                                    focusNode: _model.instagramFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Instagram',
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
                                        .instagramTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller: _model.emailTextController ??=
                                        TextEditingController(
                                      text: experienciaEditExperienciasRecord
                                          .email,
                                    ),
                                    focusNode: _model.emailFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'E-mail',
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
                                    keyboardType: TextInputType.emailAddress,
                                    validator: _model
                                        .emailTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller: _model.websiteTextController ??=
                                        TextEditingController(
                                      text: experienciaEditExperienciasRecord
                                          .website,
                                    ),
                                    focusNode: _model.websiteFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Website',
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
                                    keyboardType: TextInputType.url,
                                    validator: _model
                                        .websiteTextControllerValidator
                                        .asValidator(context),
                                  ),
                                  TextFormField(
                                    controller:
                                        _model.tripadvisorTextController ??=
                                            TextEditingController(
                                      text: experienciaEditExperienciasRecord
                                          .tripadvisor,
                                    ),
                                    focusNode: _model.tripadvisorFocusNode,
                                    textCapitalization: TextCapitalization.none,
                                    textInputAction: TextInputAction.next,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelText: 'Link TripAdvisor',
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
                                    keyboardType: TextInputType.url,
                                    validator: _model
                                        .tripadvisorTextControllerValidator
                                        .asValidator(context),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
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
                if (!(isWeb
                    ? MediaQuery.viewInsetsOf(context).bottom > 0
                    : _isKeyboardVisible))
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: SafeArea(
                      child: Container(
                        decoration: const BoxDecoration(),
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
                                          'EXPERIENCIA_EDIT_excluirExperiencia_ON_T');
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return WebViewAware(
                                                    child: AlertDialog(
                                                      title: const Text(
                                                          'Deseja mesmo excluir?'),
                                                      content: const Text(
                                                          'Esta experiência será arquivada e excluído em 30 dias.'),
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
                                                              const Text('Excluir'),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await widget.refExperiencia!.update(
                                            createExperienciasRecordData(
                                          visivel: false,
                                          lixeira: true,
                                          deletadoEm: functions.dataFutura(
                                              getCurrentTimestamp, 30),
                                          deletadoPor: currentUserReference,
                                        ));
                                        context.safePop();
                                        Navigator.pop(context);
                                        FFAppState().clearExperienciasCacheKey(
                                            'listaExperiencias');
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${experienciaEditExperienciasRecord.nome} foi arquivado e será excluído em  30 dias',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
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
                                        'EXPERIENCIA_EDIT_saveExperiencia_ON_TAP');

                                    await widget.refExperiencia!.update({
                                      ...createExperienciasRecordData(
                                        sobAgendamento:
                                            _model.switchAgendamentoValue,
                                        experienciaPaga:
                                            _model.switchExperienciaPagaValue,
                                        nome: _model.nomeTextController.text,
                                        duracaoHoras:
                                            _model.duracaoTextController.text,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'formasPagamento':
                                              _model.chipsFormasPagamentoValues,
                                        },
                                      ),
                                    });

                                    await widget.refExperiencia!
                                        .update(createExperienciasRecordData(
                                      enderecoLogradouro: _model
                                          .textLogradouroTextController.text,
                                      enderecoNumero:
                                          _model.textNumeroTextController.text,
                                      enderecoBairro:
                                          _model.textBairroTextController.text,
                                      enderecoCidade:
                                          _model.textCidadeTextController.text,
                                      enderecoUf:
                                          _model.textUFTextController.text,
                                    ));

                                    await widget.refExperiencia!
                                        .update(createExperienciasRecordData(
                                      telefone1:
                                          functions.extrairNumeroTelefone(_model
                                              .telefone1TextController.text),
                                      whatsapp1: _model.whatsApp1Value,
                                      instagram:
                                          _model.instagramTextController.text,
                                      website:
                                          _model.websiteTextController.text,
                                      tripadvisor:
                                          _model.tripadvisorTextController.text,
                                      email: _model.emailTextController.text,
                                    ));
                                    context.safePop();
                                    Navigator.pop(context);
                                  },
                                  text: 'Confirmar',
                                  options: FFButtonOptions(
                                    width: double.infinity,
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
              ],
            ),
          ),
        );
      },
    );
  }
}
