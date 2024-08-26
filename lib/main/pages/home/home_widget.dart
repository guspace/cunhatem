import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_home_ON_INIT_STATE');
      if (isWeb) {
        if (FFAppState().ativacoes.isEmpty) {
          context.pushNamed('boasVindas');
        }
      } else {
        if (FFAppState().ativacoes.isEmpty) {
          context.pushNamed('boasVindas');
        }
        await requestPermission(locationPermission);
        await requestPermission(notificationsPermission);
      }

      _model.configuracoesIniciais = await queryAppConfiguracoesRecordOnce(
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      FFAppState().categoriaSelecionada =
          _model.configuracoesIniciais!.categorias.first;
      FFAppState().addToAtivacoes(getCurrentTimestamp);
      setState(() {});
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 5000),
        callback: (timer) async {
          FFAppState().currentTime = getCurrentTimestamp;
          setState(() {});
        },
        startImmediately: true,
      );
    });

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primary,
            automaticallyImplyLeading: false,
            actions: const [],
            centerTitle: false,
            toolbarHeight: 0.0,
            elevation: 0.0,
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder<List<AppConfiguracoesRecord>>(
              future: FFAppState().appConfiguracoes(
                uniqueQueryKey: 'home',
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
                    carrosselAppConfiguracoesRecordList = snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final carrosselAppConfiguracoesRecord =
                    carrosselAppConfiguracoesRecordList.isNotEmpty
                        ? carrosselAppConfiguracoesRecordList.first
                        : null;

                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Stack(
                      children: [
                        if (valueOrDefault<bool>(
                          carrosselAppConfiguracoesRecord!.storiesHome.isNotEmpty,
                          false,
                        ))
                          Builder(
                            builder: (context) {
                              final stories = carrosselAppConfiguracoesRecord
                                      .storiesHome
                                      .toList() ??
                                  [];

                              return SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: CarouselSlider.builder(
                                  itemCount: stories.length,
                                  itemBuilder: (context, storiesIndex, _) {
                                    final storiesItem = stories[storiesIndex];
                                    return Stack(
                                      children: [
                                        if (valueOrDefault<bool>(
                                          storiesItem.image != '',
                                          false,
                                        ))
                                          Hero(
                                            tag: storiesItem.image,
                                            transitionOnUserGestures: true,
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  const Duration(milliseconds: 200),
                                              fadeOutDuration:
                                                  const Duration(milliseconds: 200),
                                              imageUrl: storiesItem.image,
                                              width: double.infinity,
                                              height: double.infinity,
                                              fit: BoxFit.cover,
                                              errorWidget: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                'assets/images/error_image.png',
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.3,
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.transparent,
                                                  Color(0x1E000000),
                                                  Color(0x34000000),
                                                  Color(0x48000000),
                                                  Color(0x5C000000),
                                                  Color(0x72000000),
                                                  Color(0x89000000),
                                                  Color(0x9E000000),
                                                  Color(0xC7000000),
                                                  Color(0xDC000000)
                                                ],
                                                stops: [
                                                  0.0,
                                                  0.1,
                                                  0.2,
                                                  0.3,
                                                  0.4,
                                                  0.5,
                                                  0.6,
                                                  0.8,
                                                  0.9,
                                                  1.0
                                                ],
                                                begin: AlignmentDirectional(
                                                    0.0, -1.0),
                                                end: AlignmentDirectional(
                                                    0, 1.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 34.0, 100.0),
                                            child: SafeArea(
                                              child: AnimatedContainer(
                                                duration:
                                                    const Duration(milliseconds: 350),
                                                curve: Curves.easeIn,
                                                width: double.infinity,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (valueOrDefault<bool>(
                                                      storiesItem.titulo !=
                                                              '',
                                                      false,
                                                    ))
                                                      Text(
                                                        storiesItem.titulo,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: Colors
                                                                      .white,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      offset: const Offset(
                                                                          1.0,
                                                                          1.0),
                                                                      blurRadius:
                                                                          8.0,
                                                                    )
                                                                  ],
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                      storiesItem.legenda !=
                                                              '',
                                                      false,
                                                    ))
                                                      Text(
                                                        storiesItem.legenda,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      offset: const Offset(
                                                                          1.0,
                                                                          1.0),
                                                                      blurRadius:
                                                                          6.0,
                                                                    )
                                                                  ],
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily),
                                                                ),
                                                      ),
                                                    if (valueOrDefault<bool>(
                                                      storiesItem.refLocal
                                                                  ?.id !=
                                                              null &&
                                                          storiesItem.refLocal
                                                                  ?.id !=
                                                              '',
                                                      false,
                                                    ))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            logFirebaseEvent(
                                                                'HOME_PAGE_verLocal_ON_TAP');
                                                            HapticFeedback
                                                                .lightImpact();

                                                            context.pushNamed(
                                                              'local',
                                                              pathParameters: {
                                                                'refLocal':
                                                                    serializeParam(
                                                                  storiesItem
                                                                      .refLocal,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          text:
                                                              'Quero conhecer',
                                                          options:
                                                              FFButtonOptions(
                                                            height: 34.0,
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                            iconPadding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          13.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 4.0,
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselController(),
                                  options: CarouselOptions(
                                    initialPage:
                                        max(0, min(1, stories.length - 1)),
                                    viewportFraction: 1.0,
                                    disableCenter: true,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.25,
                                    enableInfiniteScroll: true,
                                    scrollDirection: Axis.vertical,
                                    autoPlay: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 600),
                                    autoPlayInterval:
                                        const Duration(milliseconds: (600 + 5000)),
                                    autoPlayCurve: Curves.linear,
                                    pauseAutoPlayInFiniteScroll: true,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.sizeOf(context).height * 0.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).primary,
                                const Color(0xF23D4DAA),
                                const Color(0xCD3D4DAA),
                                const Color(0xB33D4DAA),
                                const Color(0x7F3D4DAA),
                                const Color(0x5A3D4DAA),
                                const Color(0x26673AB7),
                                const Color(0x0E3D4DAA),
                                const Color(0x003D4DAA)
                              ],
                              stops: const [
                                0.0,
                                0.1,
                                0.2,
                                0.3,
                                0.4,
                                0.5,
                                0.6,
                                0.8,
                                0.9,
                                1.0
                              ],
                              begin: const AlignmentDirectional(0.0, -1.0),
                              end: const AlignmentDirectional(0, 1.0),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, -1.0),
                          child: SafeArea(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 12.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  6.0, 20.0, 0.0, 0.0),
                                          child: Text(
                                            '${dateTimeFormat(
                                              "EE",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )} ${dateTimeFormat(
                                              "d",
                                              getCurrentTimestamp,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            )}',
                                            style: FlutterFlowTheme.of(context)
                                                .titleMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily,
                                                  fontSize: 24.0,
                                                  letterSpacing: 0.0,
                                                  shadows: [
                                                    const Shadow(
                                                      color: Color(0x9815161E),
                                                      offset: Offset(0.0, 0.0),
                                                      blurRadius: 8.0,
                                                    )
                                                  ],
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily),
                                                ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/logo-deitado-appbar.png',
                                            width: 173.0,
                                            height: 64.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ],
                                    ),
                                    AnimatedDefaultTextStyle(
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Comfortaa',
                                            color: Colors.white,
                                            fontSize: 100.0,
                                            letterSpacing: 0.0,
                                            shadows: [
                                              const Shadow(
                                                color: Color(0x9A15161E),
                                                offset: Offset(0.0, 0.0),
                                                blurRadius: 8.0,
                                              )
                                            ],
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey('Comfortaa'),
                                          ),
                                      duration: const Duration(milliseconds: 600),
                                      curve: Curves.easeIn,
                                      child: Text(
                                        valueOrDefault<String>(
                                          dateTimeFormat(
                                            "Hm",
                                            FFAppState().currentTime,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          '09:00',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                child: const MenuBarWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
