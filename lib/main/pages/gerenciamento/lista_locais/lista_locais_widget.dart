import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/main/pages/gerenciamento/modais/botao_adicionar/botao_adicionar_widget.dart';
import '/main/pages/gerenciamento/modais/detalhes/detalhes_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/empty_list/empty_list_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lista_locais_model.dart';
export 'lista_locais_model.dart';

class ListaLocaisWidget extends StatefulWidget {
  const ListaLocaisWidget({super.key});

  @override
  State<ListaLocaisWidget> createState() => _ListaLocaisWidgetState();
}

class _ListaLocaisWidgetState extends State<ListaLocaisWidget> {
  late ListaLocaisModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaLocaisModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'listaLocais'});
    _model.pesquisar1TextController ??= TextEditingController();
    _model.pesquisar1FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LocaisRecord>>(
      future: FFAppState().locais(
        uniqueQueryKey: 'listaLocais',
        requestFn: () => queryLocaisRecordOnce(
          queryBuilder: (locaisRecord) => locaisRecord.where(
            'lixeira',
            isEqualTo: false,
          ),
        ).then((result) {
          try {
            _model.firestoreRequestCompleted2 = true;
            _model.firestoreRequestLastUniqueKey2 = 'listaLocais';
          } finally {}
          return result;
        }),
      ),
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
        List<LocaisRecord> listaLocaisLocaisRecordList = snapshot.data!;

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
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 50.0,
                                buttonSize: 60.0,
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LISTA_LOCAIS_PAGE_back_ON_TAP');
                                  context.safePop();
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.appbarTextModel,
                                updateCallback: () => setState(() {}),
                                child: const AppbarTextWidget(
                                  text: 'Locais',
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 50.0,
                                buttonSize: 60.0,
                                icon: const Icon(
                                  Icons.restart_alt_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LISTA_LOCAIS_PAGE_btnReload_ON_TAP');
                                  FFAppState()
                                      .clearLocaisCacheKey('listaLocais');
                                  setState(() {
                                    FFAppState().clearLocaisCacheKey(
                                        _model.firestoreRequestLastUniqueKey2);
                                    _model.firestoreRequestCompleted2 = false;
                                  });
                                  await _model
                                      .waitForFirestoreRequestCompleted2();
                                  setState(() {
                                    FFAppState().clearAppConfiguracoesCacheKey(
                                        _model.firestoreRequestLastUniqueKey1);
                                    _model.firestoreRequestCompleted1 = false;
                                  });
                                  await _model
                                      .waitForFirestoreRequestCompleted1();
                                },
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
            body: FutureBuilder<List<AppConfiguracoesRecord>>(
              future: FFAppState().appConfiguracoes(
                uniqueQueryKey: 'listaLocais',
                requestFn: () => queryAppConfiguracoesRecordOnce(
                  singleRecord: true,
                ).then((result) {
                  try {
                    _model.firestoreRequestCompleted1 = true;
                    _model.firestoreRequestLastUniqueKey1 = 'listaLocais';
                  } finally {}
                  return result;
                }),
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
                    appConfigContainerAppConfiguracoesRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final appConfigContainerAppConfiguracoesRecord =
                    appConfigContainerAppConfiguracoesRecordList.isNotEmpty
                        ? appConfigContainerAppConfiguracoesRecordList.first
                        : null;

                return Container(
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 12.0, 12.0, 6.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller:
                                            _model.pesquisar1TextController,
                                        focusNode: _model.pesquisar1FocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.pesquisar1TextController',
                                          const Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        onFieldSubmitted: (_) async {
                                          logFirebaseEvent(
                                              'LISTA_LOCAIS_pesquisar1_ON_TEXTFIELD_SUB');
                                          safeSetState(() {
                                            _model.simpleSearchResults =
                                                TextSearch(
                                              listaLocaisLocaisRecordList
                                                  .map(
                                                    (record) => TextSearchItem
                                                        .fromTerms(record,
                                                            [record.nome]),
                                                  )
                                                  .toList(),
                                            )
                                                    .search(_model
                                                        .pesquisar1TextController
                                                        .text)
                                                    .map((r) => r.object)
                                                    .toList();
                                          });
                                        },
                                        autofocus: false,
                                        textInputAction: TextInputAction.search,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          hintText: 'Pesquisar...',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
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
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          contentPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 4.0, 12.0, 4.0),
                                          suffixIcon: _model
                                                  .pesquisar1TextController!
                                                  .text
                                                  .isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model
                                                        .pesquisar1TextController
                                                        ?.clear();
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                )
                                              : null,
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
                                            .pesquisar1TextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: valueOrDefault<Color>(
                                        _model.verVisiveis
                                            ? FlutterFlowTheme.of(context)
                                                .secondary
                                            : FlutterFlowTheme.of(context)
                                                .tertiary,
                                        FlutterFlowTheme.of(context).secondary,
                                      ),
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'LISTA_LOCAIS_PAGE_btnVisiveis_ON_TAP');
                                      _model.verVisiveis = !_model.verVisiveis;
                                      setState(() {});
                                      HapticFeedback.lightImpact();
                                    },
                                  ),
                                ].divide(const SizedBox(width: 12.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                final locaisGerenciar1 = (_model.pesquisar1TextController
                                                    .text !=
                                                ''
                                        ? _model.simpleSearchResults
                                            .where((e) => valueOrDefault<bool>(
                                                  e.visivel ==
                                                      _model.verVisiveis,
                                                  false,
                                                ))
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.nome,
                                                desc: false)
                                        : listaLocaisLocaisRecordList
                                            .where((e) =>
                                                _model.filtroCategoria1Value !=
                                                            null &&
                                                        _model.filtroCategoria1Value !=
                                                            ''
                                                    ? (valueOrDefault<bool>(
                                                          e.visivel ==
                                                              _model
                                                                  .verVisiveis,
                                                          false,
                                                        ) &&
                                                        valueOrDefault<bool>(
                                                          e.categoriasStrings
                                                              .contains(_model
                                                                  .filtroCategoria1Value),
                                                          true,
                                                        ))
                                                    : valueOrDefault<bool>(
                                                        e.visivel ==
                                                            _model.verVisiveis,
                                                        false,
                                                      ))
                                            .toList()
                                            .sortedList(
                                                keyOf: (e) => e.nome,
                                                desc: false))
                                    .toList();
                                if (locaisGerenciar1.isEmpty) {
                                  return const Center(
                                    child: EmptyListWidget(),
                                  );
                                }

                                return FlutterFlowDataTable<LocaisRecord>(
                                  controller:
                                      _model.paginatedDataTableController,
                                  data: locaisGerenciar1,
                                  columnsBuilder: (onSortChanged) => [
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: const BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'Nome',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 7.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .filtroCategoria1ValueController ??=
                                              FormFieldController<String>(
                                            _model.filtroCategoria1Value ??= '',
                                          ),
                                          options: List<String>.from(
                                              appConfigContainerAppConfiguracoesRecord!
                                                  .categorias
                                                  .map((e) => e.id)
                                                  .toList()),
                                          optionLabels:
                                              appConfigContainerAppConfiguracoesRecord
                                                  .categorias
                                                  .map((e) => e.nome)
                                                  .toList(),
                                          onChanged: (val) => setState(() =>
                                              _model.filtroCategoria1Value =
                                                  val),
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 13.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          hintText: 'Todas Categorias',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 18.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 1.0,
                                          borderRadius: 8.0,
                                          margin:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          hidesUnderline: true,
                                          disabled: _model.pesquisar1TextController
                                                      .text !=
                                                  '',
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                      ),
                                    ),
                                    DataColumn2(
                                      label: DefaultTextStyle.merge(
                                        softWrap: true,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: AutoSizeText(
                                                'Ações',
                                                minFontSize: 12.0,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.remove_red_eye,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  size: 12.0,
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    (_model.pesquisar1TextController
                                                                        .text !=
                                                                    ''
                                                            ? _model
                                                                .simpleSearchResults
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      e.visivel ==
                                                                          _model
                                                                              .verVisiveis,
                                                                      false,
                                                                    ))
                                                                .toList()
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.nome,
                                                                    desc: false)
                                                            : listaLocaisLocaisRecordList
                                                                .where((e) => _model.filtroCategoria1Value !=
                                                                            null &&
                                                                        _model.filtroCategoria1Value !=
                                                                            ''
                                                                    ? (valueOrDefault<
                                                                            bool>(
                                                                          e.visivel ==
                                                                              _model.verVisiveis,
                                                                          false,
                                                                        ) &&
                                                                        valueOrDefault<
                                                                            bool>(
                                                                          e.categoriasStrings
                                                                              .contains(_model.filtroCategoria1Value),
                                                                          true,
                                                                        ))
                                                                    : valueOrDefault<bool>(
                                                                        e.visivel ==
                                                                            _model.verVisiveis,
                                                                        false,
                                                                      ))
                                                                .toList()
                                                                .sortedList(keyOf: (e) => e.nome, desc: false))
                                                        .length
                                                        .toString(),
                                                    '0',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                ),
                                              ].divide(const SizedBox(width: 4.0)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      fixedWidth: 64.0,
                                    ),
                                  ],
                                  dataRowBuilder: (locaisGerenciar1Item,
                                          locaisGerenciar1Index,
                                          selected,
                                          onSelectChanged) =>
                                      DataRow(
                                    color: WidgetStateProperty.all(
                                      locaisGerenciar1Index % 2 == 0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                    cells: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 4.0, 0.0, 4.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  locaisGerenciar1Item
                                                                  .nome !=
                                                              ''
                                                      ? locaisGerenciar1Item
                                                          .nome
                                                      : 'Sem nome',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily),
                                                      ),
                                                ),
                                              ),
                                            ].divide(const SizedBox(width: 7.0)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                valueOrDefault<String>(
                                                  functions.listaVirgula(
                                                      appConfigContainerAppConfiguracoesRecord
                                                          ?.categorias
                                                          .where((e) =>
                                                              valueOrDefault<
                                                                  bool>(
                                                                locaisGerenciar1Item
                                                                    .categoriasStrings
                                                                    .contains(
                                                                        e.id),
                                                                false,
                                                              ))
                                                          .toList()
                                                          .map((e) => e.nome)
                                                          .toList()
                                                          .toList()),
                                                  'Categorias',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily),
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 38.0,
                                            icon: Icon(
                                              Icons.remove_red_eye,
                                              color: valueOrDefault<Color>(
                                                locaisGerenciar1Item.visivel
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                              ),
                                              size: 18.0,
                                            ),
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'LISTA_LOCAIS_PAGE_ver_ON_TAP');
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                useSafeArea: true,
                                                context: context,
                                                builder: (context) {
                                                  return WebViewAware(
                                                    child: GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: DetalhesWidget(
                                                          local:
                                                              locaisGerenciar1Item,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));

                                              HapticFeedback.lightImpact();
                                            },
                                          ),
                                        ],
                                      ),
                                    ].map((c) => DataCell(c)).toList(),
                                  ),
                                  emptyBuilder: () => const Center(
                                    child: EmptyListWidget(),
                                  ),
                                  paginated: false,
                                  selectable: false,
                                  height: double.infinity,
                                  headingRowHeight: 56.0,
                                  dataRowHeight: 60.0,
                                  columnSpacing: 8.0,
                                  headingRowColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(0.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  addHorizontalDivider: false,
                                  addTopAndBottomDivider: false,
                                  hideDefaultHorizontalDivider: true,
                                  addVerticalDivider: false,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 12.0, 12.0),
                          child: wrapWithModel(
                            model: _model.botaoAdicionarModel,
                            updateCallback: () => setState(() {}),
                            child: const BotaoAdicionarWidget(
                              tipoGerenciar: TipoGerenciar.local,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
