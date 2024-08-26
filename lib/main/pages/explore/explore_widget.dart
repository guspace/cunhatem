import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/list_experiencias/list_experiencias_widget.dart';
import '/main/pages/modais/card_modais/list_locais/list_locais_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'explore_model.dart';
export 'explore_model.dart';

class ExploreWidget extends StatefulWidget {
  const ExploreWidget({super.key});

  @override
  State<ExploreWidget> createState() => _ExploreWidgetState();
}

class _ExploreWidgetState extends State<ExploreWidget>
    with TickerProviderStateMixin {
  late ExploreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExploreModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'explore'});
    _model.locaisTabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: min(
          valueOrDefault<int>(
            FFAppState().explorarTab,
            0,
          ),
          4),
    )..addListener(() => setState(() {}));
    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.5,
            end: 1.0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 90.0,
              pinned: true,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              actions: const [],
              flexibleSpace: FlexibleSpaceBar(
                title: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(1.0, -1.0),
                          child: wrapWithModel(
                            model: _model.iconPesquisarModel,
                            updateCallback: () => setState(() {}),
                            child: const IconPesquisarWidget(),
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
                              child: const AppbarTextWidget(
                                text: 'Explorar',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return Stack(
                children: [
                  FutureBuilder<List<AppConfiguracoesRecord>>(
                    future: FFAppState().appConfiguracoes(
                      uniqueQueryKey: 'explore',
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
                          categoriasAppConfiguracoesRecordList = snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final categoriasAppConfiguracoesRecord =
                          categoriasAppConfiguracoesRecordList.isNotEmpty
                              ? categoriasAppConfiguracoesRecordList.first
                              : null;

                      return Container(
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<LocaisRecord>>(
                          future: FFAppState().locais(
                            uniqueQueryKey: 'explorar',
                            requestFn: () => queryLocaisRecordOnce(
                              queryBuilder: (locaisRecord) => locaisRecord
                                  .where(
                                    'visivel',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'lixeira',
                                    isEqualTo: false,
                                  ),
                            ).then((result) {
                              try {
                                _model.firestoreRequestCompleted2 = true;
                                _model.firestoreRequestLastUniqueKey2 =
                                    'explorar';
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
                            List<LocaisRecord> locaisTabBarLocaisRecordList =
                                snapshot.data!;

                            return Column(
                              children: [
                                Align(
                                  alignment: const Alignment(-1.0, 0),
                                  child: FlutterFlowButtonTabBar(
                                    useToggleButtonStyle: false,
                                    isScrollable: true,
                                    labelStyle: GoogleFonts.getFont(
                                      'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    unselectedLabelStyle: GoogleFonts.getFont(
                                      'Comfortaa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    unselectedBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    borderWidth: 2.0,
                                    borderRadius: 50.0,
                                    elevation: 1.0,
                                    labelPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                    buttonMargin:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                    padding: const EdgeInsets.all(12.0),
                                    tabs: const [
                                      Tab(
                                        text: 'O que fazer',
                                      ),
                                      Tab(
                                        text: 'Gastronomia',
                                      ),
                                      Tab(
                                        text: 'Hospedagem',
                                      ),
                                      Tab(
                                        text: 'Lojas e Ateliês',
                                      ),
                                      Tab(
                                        text: 'Comércio e Serviços',
                                      ),
                                    ],
                                    controller: _model.locaisTabBarController,
                                    onTap: (i) async {
                                      [
                                        () async {
                                          logFirebaseEvent(
                                              'EXPLORE_PAGE_Tab_zuv8uyph_ON_TAP');
                                          FFAppState().categoriaSelecionada =
                                              categoriasAppConfiguracoesRecord!
                                                      .categorias[
                                                  _model
                                                      .locaisTabBarCurrentIndex];
                                          FFAppState().explorarTab =
                                              _model.locaisTabBarCurrentIndex;
                                          setState(() {});
                                          HapticFeedback.lightImpact();
                                        },
                                        () async {
                                          logFirebaseEvent(
                                              'EXPLORE_PAGE_Tab_mhrji78p_ON_TAP');
                                          FFAppState().categoriaSelecionada =
                                              categoriasAppConfiguracoesRecord!
                                                      .categorias[
                                                  _model
                                                      .locaisTabBarCurrentIndex];
                                          FFAppState().explorarTab =
                                              _model.locaisTabBarCurrentIndex;
                                          setState(() {});
                                          HapticFeedback.lightImpact();
                                        },
                                        () async {
                                          logFirebaseEvent(
                                              'EXPLORE_PAGE_Tab_m5ut4tru_ON_TAP');
                                          FFAppState().categoriaSelecionada =
                                              categoriasAppConfiguracoesRecord!
                                                      .categorias[
                                                  _model
                                                      .locaisTabBarCurrentIndex];
                                          FFAppState().explorarTab =
                                              _model.locaisTabBarCurrentIndex;
                                          setState(() {});
                                          HapticFeedback.lightImpact();
                                        },
                                        () async {
                                          logFirebaseEvent(
                                              'EXPLORE_PAGE_Tab_l1m1ka9m_ON_TAP');
                                          FFAppState().categoriaSelecionada =
                                              categoriasAppConfiguracoesRecord!
                                                      .categorias[
                                                  _model
                                                      .locaisTabBarCurrentIndex];
                                          FFAppState().explorarTab =
                                              _model.locaisTabBarCurrentIndex;
                                          setState(() {});
                                          HapticFeedback.lightImpact();
                                        },
                                        () async {
                                          logFirebaseEvent(
                                              'EXPLORE_PAGE_Tab_v32g5lo7_ON_TAP');
                                          FFAppState().categoriaSelecionada =
                                              categoriasAppConfiguracoesRecord!
                                                      .categorias[
                                                  _model
                                                      .locaisTabBarCurrentIndex];
                                          FFAppState().explorarTab =
                                              _model.locaisTabBarCurrentIndex;
                                          setState(() {});
                                          HapticFeedback.lightImpact();
                                        }
                                      ][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.locaisTabBarController,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Container(
                                          decoration: const BoxDecoration(),
                                          child: RefreshIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            strokeWidth: 4.0,
                                            onRefresh: () async {
                                              logFirebaseEvent(
                                                  'EXPLORE_Column_nqnsedym_ON_PULL_TO_REFRE');
                                              FFAppState().clearLocaisCacheKey(
                                                  'explorar');
                                              FFAppState()
                                                  .clearExperienciasCacheKey(
                                                      'explore');
                                              setState(() {
                                                FFAppState()
                                                    .clearLocaisCacheKey(_model
                                                        .firestoreRequestLastUniqueKey2);
                                                _model.firestoreRequestCompleted2 =
                                                    false;
                                              });
                                              await _model
                                                  .waitForFirestoreRequestCompleted2();
                                              setState(() {
                                                FFAppState()
                                                    .clearExperienciasCacheKey(
                                                        _model
                                                            .firestoreRequestLastUniqueKey1);
                                                _model.firestoreRequestCompleted1 =
                                                    false;
                                              });
                                              await _model
                                                  .waitForFirestoreRequestCompleted1();
                                              setState(() {
                                                FFAppState()
                                                    .clearLocaisCacheKey(_model
                                                        .firestoreRequestLastUniqueKey2);
                                                _model.firestoreRequestCompleted2 =
                                                    false;
                                              });
                                              await _model
                                                  .waitForFirestoreRequestCompleted2();
                                            },
                                            child: SingleChildScrollView(
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final subCategorias =
                                                          categoriasAppConfiguracoesRecord
                                                                  ?.subCategorias
                                                                  .where((e) =>
                                                                      e
                                                                          .refCategoria ==
                                                                      valueOrDefault<
                                                                          String>(
                                                                        (categoriasAppConfiguracoesRecord.categorias[0])
                                                                            .id,
                                                                        '0',
                                                                      ))
                                                                  .toList()
                                                                  .toList() ??
                                                              [];

                                                      return ListView.separated(
                                                        padding:
                                                            const EdgeInsets.fromLTRB(
                                                          0,
                                                          0,
                                                          0,
                                                          24.0,
                                                        ),
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: subCategorias
                                                            .length,
                                                        separatorBuilder:
                                                            (_, __) => const SizedBox(
                                                                height: 24.0),
                                                        itemBuilder: (context,
                                                            subCategoriasIndex) {
                                                          final subCategoriasItem =
                                                              subCategorias[
                                                                  subCategoriasIndex];
                                                          return Container(
                                                            child:
                                                                wrapWithModel(
                                                              model: _model
                                                                  .listLocaisModels1
                                                                  .getModel(
                                                                subCategoriasItem
                                                                    .id,
                                                                subCategoriasIndex,
                                                              ),
                                                              updateCallback:
                                                                  () => setState(
                                                                      () {}),
                                                              updateOnChange:
                                                                  true,
                                                              child:
                                                                  ListLocaisWidget(
                                                                key: Key(
                                                                  'Keysem_${subCategoriasItem.id}',
                                                                ),
                                                                texto:
                                                                    subCategoriasItem
                                                                        .nome,
                                                                categoria:
                                                                    FFAppState()
                                                                        .categoriaSelecionada,
                                                                subcategoria:
                                                                    subCategoriasItem,
                                                                locais: locaisTabBarLocaisRecordList
                                                                    .where((e) => e
                                                                        .subcategoriasStrings
                                                                        .contains(
                                                                            subCategoriasItem.id))
                                                                    .toList(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                  FutureBuilder<
                                                      List<ExperienciasRecord>>(
                                                    future: FFAppState()
                                                        .experiencias(
                                                      uniqueQueryKey: 'explore',
                                                      requestFn: () =>
                                                          queryExperienciasRecordOnce(
                                                        queryBuilder:
                                                            (experienciasRecord) =>
                                                                experienciasRecord
                                                                    .where(
                                                                      'lixeira',
                                                                      isEqualTo:
                                                                          false,
                                                                    )
                                                                    .where(
                                                                      'visivel',
                                                                      isEqualTo:
                                                                          true,
                                                                    ),
                                                      ).then((result) {
                                                        try {
                                                          _model.firestoreRequestCompleted1 =
                                                              true;
                                                          _model.firestoreRequestLastUniqueKey1 =
                                                              'explore';
                                                        } finally {}
                                                        return result;
                                                      }),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ExperienciasRecord>
                                                          experienciasContainerExperienciasRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: 100.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Visibility(
                                                          visible:
                                                              valueOrDefault<
                                                                  bool>(
                                                            experienciasContainerExperienciasRecordList.isNotEmpty,
                                                            false,
                                                          ),
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .listExperienciasModel,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                ListExperienciasWidget(
                                                              texto:
                                                                  'Experiências e Vivências',
                                                              experiencias:
                                                                  experienciasContainerExperienciasRecordList,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ].addToEnd(
                                                    const SizedBox(height: 150.0)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final subCategorias =
                                                categoriasAppConfiguracoesRecord
                                                        ?.subCategorias
                                                        .where((e) =>
                                                            e.refCategoria ==
                                                            valueOrDefault<
                                                                String>(
                                                              (categoriasAppConfiguracoesRecord
                                                                      .categorias[1])
                                                                  .id,
                                                              '1',
                                                            ))
                                                        .toList()
                                                        .toList() ??
                                                    [];

                                            return RefreshIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              strokeWidth: 4.0,
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_ListView_fday8a6j_ON_PULL_TO_REF');
                                                FFAppState()
                                                    .clearLocaisCacheKey(
                                                        'explorar');
                                                setState(() {
                                                  FFAppState()
                                                      .clearLocaisCacheKey(_model
                                                          .firestoreRequestLastUniqueKey2);
                                                  _model.firestoreRequestCompleted2 =
                                                      false;
                                                });
                                                await _model
                                                    .waitForFirestoreRequestCompleted2();
                                              },
                                              child: ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  150.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: subCategorias.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 24.0),
                                                itemBuilder: (context,
                                                    subCategoriasIndex) {
                                                  final subCategoriasItem =
                                                      subCategorias[
                                                          subCategoriasIndex];
                                                  return Container(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listLocaisModels2
                                                          .getModel(
                                                        subCategoriasItem.id,
                                                        subCategoriasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ListLocaisWidget(
                                                        key: Key(
                                                          'Keyzfy_${subCategoriasItem.id}',
                                                        ),
                                                        texto: subCategoriasItem
                                                            .nome,
                                                        categoria: FFAppState()
                                                            .categoriaSelecionada,
                                                        subcategoria:
                                                            subCategoriasItem,
                                                        locais: locaisTabBarLocaisRecordList
                                                            .where((e) => e
                                                                .subcategoriasStrings
                                                                .contains(
                                                                    subCategoriasItem
                                                                        .id))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final subCategorias =
                                                categoriasAppConfiguracoesRecord
                                                        ?.subCategorias
                                                        .where((e) =>
                                                            e.refCategoria ==
                                                            valueOrDefault<
                                                                String>(
                                                              (categoriasAppConfiguracoesRecord
                                                                      .categorias[2])
                                                                  .id,
                                                              '2',
                                                            ))
                                                        .toList()
                                                        .toList() ??
                                                    [];

                                            return RefreshIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              strokeWidth: 4.0,
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_ListView_kv0jz6no_ON_PULL_TO_REF');
                                                FFAppState()
                                                    .clearLocaisCacheKey(
                                                        'explorar');
                                                setState(() {
                                                  FFAppState()
                                                      .clearLocaisCacheKey(_model
                                                          .firestoreRequestLastUniqueKey2);
                                                  _model.firestoreRequestCompleted2 =
                                                      false;
                                                });
                                                await _model
                                                    .waitForFirestoreRequestCompleted2();
                                              },
                                              child: ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  150.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: subCategorias.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 24.0),
                                                itemBuilder: (context,
                                                    subCategoriasIndex) {
                                                  final subCategoriasItem =
                                                      subCategorias[
                                                          subCategoriasIndex];
                                                  return Container(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listLocaisModels3
                                                          .getModel(
                                                        subCategoriasItem.id,
                                                        subCategoriasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ListLocaisWidget(
                                                        key: Key(
                                                          'Keyc7j_${subCategoriasItem.id}',
                                                        ),
                                                        texto: subCategoriasItem
                                                            .nome,
                                                        categoria: FFAppState()
                                                            .categoriaSelecionada,
                                                        subcategoria:
                                                            subCategoriasItem,
                                                        locais: locaisTabBarLocaisRecordList
                                                            .where((e) => e
                                                                .subcategoriasStrings
                                                                .contains(
                                                                    subCategoriasItem
                                                                        .id))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final subCategorias =
                                                categoriasAppConfiguracoesRecord
                                                        ?.subCategorias
                                                        .where((e) =>
                                                            e.refCategoria ==
                                                            valueOrDefault<
                                                                String>(
                                                              (categoriasAppConfiguracoesRecord
                                                                      .categorias[3])
                                                                  .id,
                                                              '3',
                                                            ))
                                                        .toList()
                                                        .toList() ??
                                                    [];

                                            return RefreshIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              strokeWidth: 4.0,
                                              onRefresh: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_ListView_q7hy93uw_ON_PULL_TO_REF');
                                                FFAppState()
                                                    .clearLocaisCacheKey(
                                                        'explorar');
                                                setState(() {
                                                  FFAppState()
                                                      .clearLocaisCacheKey(_model
                                                          .firestoreRequestLastUniqueKey2);
                                                  _model.firestoreRequestCompleted2 =
                                                      false;
                                                });
                                                await _model
                                                    .waitForFirestoreRequestCompleted2();
                                              },
                                              child: ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  150.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: subCategorias.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 24.0),
                                                itemBuilder: (context,
                                                    subCategoriasIndex) {
                                                  final subCategoriasItem =
                                                      subCategorias[
                                                          subCategoriasIndex];
                                                  return Container(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listLocaisModels4
                                                          .getModel(
                                                        subCategoriasItem.id,
                                                        subCategoriasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ListLocaisWidget(
                                                        key: Key(
                                                          'Keym5c_${subCategoriasItem.id}',
                                                        ),
                                                        texto: subCategoriasItem
                                                            .nome,
                                                        categoria: FFAppState()
                                                            .categoriaSelecionada,
                                                        subcategoria:
                                                            subCategoriasItem,
                                                        locais: locaisTabBarLocaisRecordList
                                                            .where((e) => e
                                                                .subcategoriasStrings
                                                                .contains(
                                                                    subCategoriasItem
                                                                        .id))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      KeepAliveWidgetWrapper(
                                        builder: (context) => Builder(
                                          builder: (context) {
                                            final subCategorias =
                                                categoriasAppConfiguracoesRecord
                                                        ?.subCategorias
                                                        .where((e) =>
                                                            e.refCategoria ==
                                                            valueOrDefault<
                                                                String>(
                                                              (categoriasAppConfiguracoesRecord
                                                                      .categorias[4])
                                                                  .id,
                                                              '4',
                                                            ))
                                                        .toList()
                                                        .toList() ??
                                                    [];

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EXPLORE_PAGE_ListView_zqwiywxy_ON_TAP');
                                                FFAppState()
                                                    .clearLocaisCacheKey(
                                                        'explorar');
                                                setState(() {
                                                  FFAppState()
                                                      .clearLocaisCacheKey(_model
                                                          .firestoreRequestLastUniqueKey2);
                                                  _model.firestoreRequestCompleted2 =
                                                      false;
                                                });
                                                await _model
                                                    .waitForFirestoreRequestCompleted2();
                                              },
                                              child: ListView.separated(
                                                padding: const EdgeInsets.fromLTRB(
                                                  0,
                                                  0,
                                                  0,
                                                  150.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                itemCount: subCategorias.length,
                                                separatorBuilder: (_, __) =>
                                                    const SizedBox(height: 24.0),
                                                itemBuilder: (context,
                                                    subCategoriasIndex) {
                                                  final subCategoriasItem =
                                                      subCategorias[
                                                          subCategoriasIndex];
                                                  return Container(
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .listLocaisModels5
                                                          .getModel(
                                                        subCategoriasItem.id,
                                                        subCategoriasIndex,
                                                      ),
                                                      updateCallback: () =>
                                                          setState(() {}),
                                                      child: ListLocaisWidget(
                                                        key: Key(
                                                          'Keyo34_${subCategoriasItem.id}',
                                                        ),
                                                        texto: subCategoriasItem
                                                            .nome,
                                                        categoria: FFAppState()
                                                            .categoriaSelecionada,
                                                        subcategoria:
                                                            subCategoriasItem,
                                                        locais: locaisTabBarLocaisRecordList
                                                            .where((e) => e
                                                                .subcategoriasStrings
                                                                .contains(
                                                                    subCategoriasItem
                                                                        .id))
                                                            .toList(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!);
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.menuBarModel,
                      updateCallback: () => setState(() {}),
                      updateOnChange: true,
                      child: const MenuBarWidget(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
