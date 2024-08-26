import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_experiencia1/card_experiencia1_widget.dart';
import '/main/pages/modais/card_modais/card_local1/card_local1_widget.dart';
import '/main/pages/modais/empty_list/empty_list_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'favoritos_model.dart';
export 'favoritos_model.dart';

class FavoritosWidget extends StatefulWidget {
  const FavoritosWidget({super.key});

  @override
  State<FavoritosWidget> createState() => _FavoritosWidgetState();
}

class _FavoritosWidgetState extends State<FavoritosWidget>
    with TickerProviderStateMixin {
  late FavoritosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'favoritos'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: true);
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false);
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
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
                              Icons.settings_rounded,
                              color: Colors.white,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              logFirebaseEvent(
                                  'FAVORITOS_settings_rounded_ICN_ON_TAP');

                              context.pushNamed('menu');

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
                              child: const AppbarTextWidget(
                                text: 'Favoritos',
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
            Container(
              decoration: const BoxDecoration(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Container(
                        width: double.infinity,
                        color: const Color(0x00000000),
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController1,
                          child: ExpandablePanel(
                            header: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Locais ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily),
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            '(${valueOrDefault<String>(
                                              FFAppState()
                                                  .favoritosLocais
                                                  .length
                                                  .toString(),
                                              '5',
                                            )})',
                                            '(5)',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                            collapsed: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Seus locais favoritos estão aqui',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                              ),
                            ),
                            expanded: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (valueOrDefault<bool>(
                                  FFAppState().favoritosLocais.isNotEmpty,
                                  false,
                                ))
                                  FutureBuilder<List<LocaisRecord>>(
                                    future: FFAppState().locais(
                                      uniqueQueryKey: 'favoritos',
                                      requestFn: () => queryLocaisRecordOnce(
                                        queryBuilder: (locaisRecord) =>
                                            locaisRecord
                                                .whereIn(
                                                    'id',
                                                    FFAppState()
                                                                .favoritosLocais
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList() !=
                                                            ''
                                                        ? FFAppState()
                                                            .favoritosLocais
                                                            .map((e) => e.id)
                                                            .toList()
                                                        : null)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<LocaisRecord>
                                          containerLocaisRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final locaisFsvoritos =
                                                containerLocaisRecordList
                                                    .toList();
                                            if (locaisFsvoritos.isEmpty) {
                                              return const EmptyListWidget();
                                            }

                                            return ListView.separated(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: locaisFsvoritos.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 12.0),
                                              itemBuilder: (context,
                                                  locaisFsvoritosIndex) {
                                                final locaisFsvoritosItem =
                                                    locaisFsvoritos[
                                                        locaisFsvoritosIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .cardLocal1Models
                                                        .getModel(
                                                      locaisFsvoritosItem
                                                          .reference.id,
                                                      locaisFsvoritosIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child: CardLocal1Widget(
                                                      key: Key(
                                                        'Key6p0_${locaisFsvoritosItem.reference.id}',
                                                      ),
                                                      local:
                                                          locaisFsvoritosItem,
                                                      distancia:
                                                          'a ${valueOrDefault<String>(
                                                        functions.getDistanceBetween(
                                                                    currentUserLocationValue!,
                                                                    locaisFsvoritosItem
                                                                        .localizacao!) >
                                                                1.0
                                                            ? formatNumber(
                                                                functions.getDistanceBetween(
                                                                    currentUserLocationValue!,
                                                                    locaisFsvoritosItem
                                                                        .localizacao!),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#',
                                                                locale: 'pt_BR',
                                                              )
                                                            : formatNumber(
                                                                functions.getDistanceBetween(
                                                                    currentUserLocationValue!,
                                                                    locaisFsvoritosItem
                                                                        .localizacao!),
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '#.0',
                                                                locale: 'pt_BR',
                                                              ),
                                                        '-',
                                                      )} Km',
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                if (valueOrDefault<bool>(
                                  FFAppState().favoritosLocais.isEmpty,
                                  true,
                                ))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      'Vazio! Adicione alguns favoritos aqui',
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: false,
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Container(
                        width: double.infinity,
                        color: const Color(0x00000000),
                        child: ExpandableNotifier(
                          controller: _model.expandableExpandableController2,
                          child: ExpandablePanel(
                            header: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    textScaler:
                                        MediaQuery.of(context).textScaler,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Experiências ',
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLargeFamily,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLargeFamily),
                                              ),
                                        ),
                                        TextSpan(
                                          text: valueOrDefault<String>(
                                            '(${valueOrDefault<String>(
                                              FFAppState()
                                                  .favoritosExperiencias
                                                  .length
                                                  .toString(),
                                              '0',
                                            )})',
                                            '(5)',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        )
                                      ],
                                      style: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily),
                                          ),
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: 2.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                            collapsed: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'Suas experiências favoritas estão aqui',
                                style: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                              ),
                            ),
                            expanded: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (valueOrDefault<bool>(
                                  FFAppState().favoritosExperiencias.isNotEmpty,
                                  false,
                                ))
                                  FutureBuilder<List<ExperienciasRecord>>(
                                    future: FFAppState().experiencias(
                                      uniqueQueryKey: 'favoritos',
                                      requestFn: () =>
                                          queryExperienciasRecordOnce(
                                        queryBuilder: (experienciasRecord) =>
                                            experienciasRecord
                                                .whereIn(
                                                    'id',
                                                    FFAppState()
                                                                .favoritosExperiencias
                                                                .map(
                                                                    (e) => e.id)
                                                                .toList() !=
                                                            ''
                                                        ? FFAppState()
                                                            .favoritosExperiencias
                                                            .map((e) => e.id)
                                                            .toList()
                                                        : null)
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 50.0,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ExperienciasRecord>
                                          containerExperienciasRecordList =
                                          snapshot.data!;

                                      return Container(
                                        decoration: const BoxDecoration(),
                                        child: Builder(
                                          builder: (context) {
                                            final experienciaFavoritos =
                                                containerExperienciasRecordList
                                                    .toList();
                                            if (experienciaFavoritos.isEmpty) {
                                              return const EmptyListWidget();
                                            }

                                            return ListView.separated(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 12.0),
                                              primary: false,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  experienciaFavoritos.length,
                                              separatorBuilder: (_, __) =>
                                                  const SizedBox(height: 12.0),
                                              itemBuilder: (context,
                                                  experienciaFavoritosIndex) {
                                                final experienciaFavoritosItem =
                                                    experienciaFavoritos[
                                                        experienciaFavoritosIndex];
                                                return Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .cardExperiencia1Models
                                                        .getModel(
                                                      experienciaFavoritosItem
                                                          .reference.id,
                                                      experienciaFavoritosIndex,
                                                    ),
                                                    updateCallback: () =>
                                                        setState(() {}),
                                                    child:
                                                        CardExperiencia1Widget(
                                                      key: Key(
                                                        'Keyys6_${experienciaFavoritosItem.reference.id}',
                                                      ),
                                                      experiencia:
                                                          experienciaFavoritosItem,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                if (valueOrDefault<bool>(
                                  FFAppState().favoritosExperiencias.isEmpty,
                                  true,
                                ))
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Text(
                                      'Vazio! Adicione alguns favoritos aqui',
                                      style: FlutterFlowTheme.of(context)
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
                                    ),
                                  ),
                              ],
                            ),
                            theme: const ExpandableThemeData(
                              tapHeaderToExpand: true,
                              tapBodyToExpand: true,
                              tapBodyToCollapse: false,
                              headerAlignment:
                                  ExpandablePanelHeaderAlignment.center,
                              hasIcon: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]
                      .divide(const SizedBox(height: 12.0))
                      .addToStart(const SizedBox(height: 12.0))
                      .addToEnd(const SizedBox(height: 150.0)),
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
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
        ),
      ),
    );
  }
}
