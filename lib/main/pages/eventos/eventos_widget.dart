import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_event/card_event_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'eventos_model.dart';
export 'eventos_model.dart';

class EventosWidget extends StatefulWidget {
  const EventosWidget({super.key});

  @override
  State<EventosWidget> createState() => _EventosWidgetState();
}

class _EventosWidgetState extends State<EventosWidget>
    with TickerProviderStateMixin {
  late EventosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventosModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'eventos'});
    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.appbarTextModel,
                            updateCallback: () => setState(() {}),
                            child: const AppbarTextWidget(
                              text: 'Eventos',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: wrapWithModel(
                          model: _model.iconPesquisarModel,
                          updateCallback: () => setState(() {}),
                          child: const IconPesquisarWidget(),
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
          ),
        ),
        body: FutureBuilder<List<EventosRecord>>(
          future: FFAppState().eventos(
            uniqueQueryKey: 'eventos',
            requestFn: () => queryEventosRecordOnce(
              queryBuilder: (eventosRecord) => eventosRecord
                  .where(
                    'lixeira',
                    isEqualTo: false,
                  )
                  .where(
                    'visivel',
                    isEqualTo: true,
                  )
                  .where(
                    'termina_em',
                    isGreaterThan: getCurrentTimestamp,
                  ),
            ).then((result) {
              try {
                _model.firestoreRequestCompleted = true;
                _model.firestoreRequestLastUniqueKey = 'eventos';
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
                  RefreshIndicator(
                    color: FlutterFlowTheme.of(context).primary,
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    strokeWidth: 4.0,
                    onRefresh: () async {
                      logFirebaseEvent(
                          'EVENTOS_Column_pevtcisq_ON_PULL_TO_REFRE');
                      FFAppState().clearEventosCacheKey('eventos');
                      setState(() {
                        FFAppState().clearEventosCacheKey(
                            _model.firestoreRequestLastUniqueKey);
                        _model.firestoreRequestCompleted = false;
                      });
                      await _model.waitForFirestoreRequestCompleted();
                    },
                    child: SingleChildScrollView(
                      primary: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (valueOrDefault<bool>(
                            containerEventosRecordList.isNotEmpty,
                            false,
                          ))
                            Container(
                              decoration: const BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  final datas = containerEventosRecordList
                                      .map((e) => e)
                                      .toList()
                                      .sortedList(
                                          keyOf: (e) => e.comecaEm!,
                                          desc: false)
                                      .unique((e) => dateTimeFormat(
                                            "d/M/y",
                                            e.comecaEm!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ))
                                      .toList();

                                  return RefreshIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                    backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    strokeWidth: 4.0,
                                    onRefresh: () async {
                                      logFirebaseEvent(
                                          'EVENTOS_Column_4ziotsvy_ON_PULL_TO_REFRE');
                                      FFAppState()
                                          .clearEventosCacheKey('eventos');
                                      setState(() {
                                        FFAppState().clearEventosCacheKey(_model
                                            .firestoreRequestLastUniqueKey);
                                        _model.firestoreRequestCompleted =
                                            false;
                                      });
                                      await _model
                                          .waitForFirestoreRequestCompleted();
                                    },
                                    child: ListView.builder(
                                      padding: const EdgeInsets.fromLTRB(
                                        0,
                                        0,
                                        0,
                                        150.0,
                                      ),
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: datas.length,
                                      itemBuilder: (context, datasIndex) {
                                        final datasItem = datas[datasIndex];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    valueOrDefault<String>(
                                                      datasItem.comecaEm! <
                                                              FFAppState()
                                                                  .currentTime!
                                                          ? 'Acontecendo'
                                                          : valueOrDefault<
                                                              String>(
                                                              dateTimeFormat(
                                                                "MMMMEEEEd",
                                                                datasItem
                                                                    .comecaEm,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              'Agora',
                                                            ),
                                                      'Datas',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                  ),
                                                ]
                                                    .addToStart(
                                                        const SizedBox(width: 12.0))
                                                    .addToEnd(
                                                        const SizedBox(width: 12.0)),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                final eventos =
                                                    containerEventosRecordList
                                                        .map((e) => e)
                                                        .toList()
                                                        .where(
                                                            (e) =>
                                                                valueOrDefault<
                                                                    bool>(
                                                                  dateTimeFormat(
                                                                        "d/M/y",
                                                                        e.comecaEm,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ) ==
                                                                      dateTimeFormat(
                                                                        "d/M/y",
                                                                        datasItem
                                                                            .comecaEm,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                  false,
                                                                ))
                                                        .toList();

                                                return ListView.separated(
                                                  padding: const EdgeInsets.fromLTRB(
                                                    0,
                                                    12.0,
                                                    0,
                                                    12.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: eventos.length,
                                                  separatorBuilder: (_, __) =>
                                                      const SizedBox(height: 12.0),
                                                  itemBuilder:
                                                      (context, eventosIndex) {
                                                    final eventosItem =
                                                        eventos[eventosIndex];
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: CardEventWidget(
                                                        key: Key(
                                                            'Keyt3j_${eventosIndex}_of_${eventos.length}'),
                                                        evento: eventosItem,
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          if (valueOrDefault<bool>(
                            containerEventosRecordList.isEmpty,
                            true,
                          ))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 150.0),
                                  child: Container(
                                    decoration: const BoxDecoration(),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                'assets/images/no-event.png',
                                                width: 120.0,
                                                height: 120.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Oops!\n',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
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
                                                  const TextSpan(
                                                    text:
                                                        'Parece que estamos sem\neventos por aqui',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                    ),
                                                  )
                                                ],
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLargeFamily),
                                                        ),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ].divide(const SizedBox(height: 12.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
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
            );
          },
        ),
      ),
    );
  }
}
