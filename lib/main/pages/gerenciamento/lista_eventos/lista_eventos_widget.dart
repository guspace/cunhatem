import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/gerenciamento/modais/botao_adicionar/botao_adicionar_widget.dart';
import '/main/pages/gerenciamento/modais/detalhes/detalhes_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/empty_list/empty_list_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lista_eventos_model.dart';
export 'lista_eventos_model.dart';

class ListaEventosWidget extends StatefulWidget {
  const ListaEventosWidget({super.key});

  @override
  State<ListaEventosWidget> createState() => _ListaEventosWidgetState();
}

class _ListaEventosWidgetState extends State<ListaEventosWidget> {
  late ListaEventosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaEventosModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listaEventos'});
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
                                  'LISTA_EVENTOS_chevron_left_ICN_ON_TAP');
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
                              text: 'Eventos',
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
                                  'LISTA_EVENTOS_PAGE_btnReload_ON_TAP');
                              FFAppState().clearEventosCache();
                              setState(() {
                                FFAppState().clearEventosCacheKey(
                                    _model.firestoreRequestLastUniqueKey);
                                _model.firestoreRequestCompleted = false;
                              });
                              await _model.waitForFirestoreRequestCompleted();
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
        body: FutureBuilder<List<EventosRecord>>(
          future: FFAppState().eventos(
            uniqueQueryKey: 'listaEventos',
            requestFn: () => queryEventosRecordOnce(
              queryBuilder: (eventosRecord) => eventosRecord.where(
                'lixeira',
                isEqualTo: false,
              ),
            ).then((result) {
              try {
                _model.firestoreRequestCompleted = true;
                _model.firestoreRequestLastUniqueKey = 'listaEventos';
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
            List<EventosRecord> containerEventosRecordList = snapshot.data!;

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
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    controller: _model.pesquisar1TextController,
                                    focusNode: _model.pesquisar1FocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.pesquisar1TextController',
                                      const Duration(milliseconds: 2000),
                                      () => setState(() {}),
                                    ),
                                    onFieldSubmitted: (_) async {
                                      logFirebaseEvent(
                                          'LISTA_EVENTOS_pesquisar1_ON_TEXTFIELD_SU');
                                      safeSetState(() {
                                        _model.simpleSearchResults = TextSearch(
                                          containerEventosRecordList
                                              .map(
                                                (record) =>
                                                    TextSearchItem.fromTerms(
                                                        record, [record.nome]),
                                              )
                                              .toList(),
                                        )
                                            .search(_model
                                                .pesquisar1TextController.text)
                                            .map((r) => r.object)
                                            .toList();
                                      });
                                    },
                                    autofocus: false,
                                    textInputAction: TextInputAction.search,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: false,
                                      labelStyle: FlutterFlowTheme.of(context)
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
                                      hintText: 'Pesquisar...',
                                      hintStyle: FlutterFlowTheme.of(context)
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
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
                                                _model.pesquisar1TextController
                                                    ?.clear();
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                color:
                                                    FlutterFlowTheme.of(context)
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
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                    validator: _model
                                        .pesquisar1TextControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderRadius: 20.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: valueOrDefault<Color>(
                                    _model.verVisiveis
                                        ? FlutterFlowTheme.of(context).secondary
                                        : FlutterFlowTheme.of(context).tertiary,
                                    FlutterFlowTheme.of(context).secondary,
                                  ),
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LISTA_EVENTOS_PAGE_btnVisiveis_ON_TAP');
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
                        child: SafeArea(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final eventosLista = (_model.pesquisar1TextController
                                                    .text !=
                                                ''
                                        ? _model.simpleSearchResults
                                            .where((e) => valueOrDefault<bool>(
                                                  e.visivel ==
                                                      _model.verVisiveis,
                                                  false,
                                                ))
                                            .toList()
                                        : containerEventosRecordList
                                            .where((e) => valueOrDefault<bool>(
                                                  e.visivel ==
                                                      _model.verVisiveis,
                                                  false,
                                                ))
                                            .toList())
                                    .toList();
                                if (eventosLista.isEmpty) {
                                  return const Center(
                                    child: SizedBox(
                                      width: 200.0,
                                      height: 200.0,
                                      child: EmptyListWidget(),
                                    ),
                                  );
                                }

                                return FlutterFlowDataTable<EventosRecord>(
                                  controller:
                                      _model.paginatedDataTableController,
                                  data: eventosLista,
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
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'Datas',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      fixedWidth: 120.0,
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
                                                            : containerEventosRecordList
                                                                .where((e) =>
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      e.visivel ==
                                                                          _model
                                                                              .verVisiveis,
                                                                      false,
                                                                    ))
                                                                .toList())
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
                                  dataRowBuilder: (eventosListaItem,
                                          eventosListaIndex,
                                          selected,
                                          onSelectChanged) =>
                                      DataRow(
                                    color: WidgetStateProperty.all(
                                      eventosListaIndex % 2 == 0
                                          ? FlutterFlowTheme.of(context)
                                              .primaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                    ),
                                    cells: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                eventosListaItem.nome !=
                                                            ''
                                                    ? eventosListaItem.nome
                                                    : 'Sem nome',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                valueOrDefault<bool>(
                                                          eventosListaItem
                                                                  .comecaEm !=
                                                              null,
                                                          false,
                                                        ) &&
                                                        valueOrDefault<bool>(
                                                          eventosListaItem
                                                                  .terminaEm !=
                                                              null,
                                                          false,
                                                        )
                                                    ? '${dateTimeFormat(
                                                        "d/MM",
                                                        eventosListaItem
                                                            .comecaEm,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )} a ${dateTimeFormat(
                                                        "d/MM/y",
                                                        eventosListaItem
                                                            .terminaEm,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}'
                                                    : 'Sem data',
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 4.0),
                                        child: Row(
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
                                                color: eventosListaItem.visivel
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .secondary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary,
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'LISTA_EVENTOS_PAGE_ver_ON_TAP');
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
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child: DetalhesWidget(
                                                            evento:
                                                                eventosListaItem,
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
                                      ),
                                    ].map((c) => DataCell(c)).toList(),
                                  ),
                                  emptyBuilder: () => const Center(
                                    child: SizedBox(
                                      width: 200.0,
                                      height: 200.0,
                                      child: EmptyListWidget(),
                                    ),
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
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                      child: wrapWithModel(
                        model: _model.botaoAdicionarModel,
                        updateCallback: () => setState(() {}),
                        child: const BotaoAdicionarWidget(
                          tipoGerenciar: TipoGerenciar.evento,
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
  }
}
