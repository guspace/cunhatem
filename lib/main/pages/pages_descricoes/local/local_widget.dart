import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/em_construcao/ler_qr_code/ler_qr_code_widget.dart';
import '/main/pages/modais/galeria/galeria_widget.dart';
import '/main/pages/modais/local_aberto/local_aberto_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:mapbox_search/mapbox_search.dart' as mapbox;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'local_model.dart';
export 'local_model.dart';

class LocalWidget extends StatefulWidget {
  const LocalWidget({
    super.key,
    required this.refLocal,
    this.planoRestricoes,
  });

  final DocumentReference? refLocal;
  final RestricoesLocalStruct? planoRestricoes;

  @override
  State<LocalWidget> createState() => _LocalWidgetState();
}

class _LocalWidgetState extends State<LocalWidget> {
  late LocalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'local'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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

    return FutureBuilder<LocaisRecord>(
      future: (_model.documentRequestCompleter2 ??= Completer<LocaisRecord>()
            ..complete(LocaisRecord.getDocumentOnce(widget.refLocal!)))
          .future,
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

        final localLocaisRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                FutureBuilder<PlanosRecord>(
                  future: (_model.documentRequestCompleter1 ??=
                          Completer<PlanosRecord>()
                            ..complete(PlanosRecord.getDocumentOnce(
                                localLocaisRecord.planoCunhatem!)))
                      .future,
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

                    final planoContainerPlanosRecord = snapshot.data!;

                    return Container(
                      decoration: const BoxDecoration(),
                      child: RefreshIndicator(
                        color: FlutterFlowTheme.of(context).primary,
                        backgroundColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        strokeWidth: 4.0,
                        onRefresh: () async {
                          logFirebaseEvent(
                              'LOCAL_Column_yln2qp5r_ON_PULL_TO_REFRESH');
                          FFAppState().clearLocaisCacheKey('pageLocal');
                          setState(
                              () => _model.documentRequestCompleter2 = null);
                          await _model.waitForDocumentRequestCompleted2(
                              maxWait: 2000);
                          setState(
                              () => _model.documentRequestCompleter1 = null);
                          await _model.waitForDocumentRequestCompleted1(
                              maxWait: 2000);
                          setState(() {
                            FFAppState().clearAppConfiguracoesCacheKey(
                                _model.firestoreRequestLastUniqueKey);
                            _model.firestoreRequestCompleted = false;
                          });
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 330.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Stack(
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        final fotosLocal =
                                            localLocaisRecord.galeriaFotos
                                                .take(valueOrDefault<int>(
                                                  planoContainerPlanosRecord
                                                              .restricoesLocal
                                                              .quantidadeFotos !=
                                                          null
                                                      ? valueOrDefault<int>(
                                                          planoContainerPlanosRecord
                                                              .restricoesLocal
                                                              .quantidadeFotos,
                                                          1,
                                                        )
                                                      : 20,
                                                  20,
                                                ))
                                                .toList();

                                        return SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              PageView.builder(
                                                controller: _model
                                                        .pageViewController ??=
                                                    PageController(
                                                        initialPage: max(
                                                            0,
                                                            min(
                                                                0,
                                                                fotosLocal
                                                                        .length -
                                                                    1))),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: fotosLocal.length,
                                                itemBuilder:
                                                    (context, fotosLocalIndex) {
                                                  final fotosLocalItem =
                                                      fotosLocal[
                                                          fotosLocalIndex];
                                                  return Visibility(
                                                    visible:
                                                        valueOrDefault<bool>(
                                                      fotosLocalItem
                                                                  .image !=
                                                              '',
                                                      false,
                                                    ),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'LOCAL_PAGE_Image_r008kclu_ON_TAP');
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          useSafeArea: true,
                                                          context: context,
                                                          builder: (context) {
                                                            return WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () =>
                                                                    FocusScope.of(
                                                                            context)
                                                                        .unfocus(),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      GaleriaWidget(
                                                                    fotosGaleria:
                                                                        localLocaisRecord
                                                                            .galeriaFotos,
                                                                    fotoInicial:
                                                                        valueOrDefault<
                                                                            int>(
                                                                      fotosLocalIndex,
                                                                      0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));

                                                        HapticFeedback
                                                            .lightImpact();
                                                      },
                                                      child: OctoImage(
                                                        placeholderBuilder:
                                                            (_) =>
                                                                SizedBox.expand(
                                                          child: Image(
                                                            image: BlurHashImage(
                                                                fotosLocalItem
                                                                    .blurHash),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          fotosLocalItem.image,
                                                        ),
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Align(
                                                alignment: const AlignmentDirectional(
                                                    0.0, 1.0),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 0.0, 12.0,
                                                          14.0),
                                                  child: smooth_page_indicator
                                                      .SmoothPageIndicator(
                                                    controller: _model
                                                            .pageViewController ??=
                                                        PageController(
                                                            initialPage: max(
                                                                0,
                                                                min(
                                                                    0,
                                                                    fotosLocal
                                                                            .length -
                                                                        1))),
                                                    count: fotosLocal.length,
                                                    axisDirection:
                                                        Axis.horizontal,
                                                    onDotClicked: (i) async {
                                                      await _model
                                                          .pageViewController!
                                                          .animateToPage(
                                                        i,
                                                        duration: const Duration(
                                                            milliseconds: 500),
                                                        curve: Curves.ease,
                                                      );
                                                      setState(() {});
                                                    },
                                                    effect: const smooth_page_indicator
                                                        .ExpandingDotsEffect(
                                                      expansionFactor: 3.0,
                                                      spacing: 8.0,
                                                      radius: 16.0,
                                                      dotWidth: 8.0,
                                                      dotHeight: 8.0,
                                                      dotColor:
                                                          Color(0x7FFFFFFF),
                                                      activeDotColor:
                                                          Colors.white,
                                                      paintStyle:
                                                          PaintingStyle.fill,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 12.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        child: Text(
                                                          localLocaisRecord
                                                                          .nome ==
                                                                      ''
                                                              ? 'Sem nome'
                                                              : localLocaisRecord
                                                                  .nome,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        if (valueOrDefault<
                                                            bool>(
                                                          (localLocaisRecord
                                                                      .funcionamento !=
                                                                  null) &&
                                                              valueOrDefault<
                                                                  bool>(
                                                                planoContainerPlanosRecord
                                                                        .restricoesLocal
                                                                        .funcionamento ==
                                                                    true,
                                                                false,
                                                              ),
                                                          false,
                                                        ))
                                                          wrapWithModel(
                                                            model: _model
                                                                .localAbertoModel1,
                                                            updateCallback:
                                                                () => setState(
                                                                    () {}),
                                                            child:
                                                                LocalAbertoWidget(
                                                              abre:
                                                                  valueOrDefault<
                                                                      String>(
                                                                () {
                                                                  if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '1') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .segundaAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '2') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .tercaAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '3') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .quartaAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '4') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .quintaAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '5') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .sextaAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '6') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .sabadoAbre;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '7') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .domingoAbre;
                                                                  } else {
                                                                    return '00:00';
                                                                  }
                                                                }(),
                                                                '00:00',
                                                              ),
                                                              fecha:
                                                                  valueOrDefault<
                                                                      String>(
                                                                () {
                                                                  if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '1') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .segundaFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '2') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .tercaFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '3') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .quartaFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '4') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .quintaFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '5') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .sextaFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '6') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .sabadoFecha;
                                                                  } else if (functions
                                                                          .weekDayNumber(
                                                                              getCurrentTimestamp) ==
                                                                      '7') {
                                                                    return localLocaisRecord
                                                                        .funcionamento
                                                                        .domingoFecha;
                                                                  } else {
                                                                    return '00:00';
                                                                  }
                                                                }(),
                                                                '00:00',
                                                              ),
                                                              aberto24h: () {
                                                                if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '1') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .segunda24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '2') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .terca24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '3') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quarta24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '4') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quinta24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '5') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sexta24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '6') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sabado24h;
                                                                } else if (functions
                                                                        .weekDayNumber(
                                                                            getCurrentTimestamp) ==
                                                                    '7') {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .domingo24h;
                                                                } else {
                                                                  return false;
                                                                }
                                                              }(),
                                                              tipo: 'page',
                                                            ),
                                                          ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .location_on_rounded,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 16.0,
                                                            ),
                                                            if (valueOrDefault<
                                                                bool>(
                                                              localLocaisRecord
                                                                      .localizacao !=
                                                                  null,
                                                              false,
                                                            ))
                                                              AutoSizeText(
                                                                'a ${valueOrDefault<String>(
                                                                  functions.getDistanceBetween(
                                                                              currentUserLocationValue!,
                                                                              localLocaisRecord.localizacao!) >
                                                                          1.0
                                                                      ? formatNumber(
                                                                          functions.getDistanceBetween(
                                                                              currentUserLocationValue!,
                                                                              localLocaisRecord.localizacao!),
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#',
                                                                          locale:
                                                                              'pt_BR',
                                                                        )
                                                                      : formatNumber(
                                                                          functions.getDistanceBetween(
                                                                              currentUserLocationValue!,
                                                                              localLocaisRecord.localizacao!),
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          format:
                                                                              '#.0',
                                                                          locale:
                                                                              'pt_BR',
                                                                        ),
                                                                  '-',
                                                                )}km',
                                                                minFontSize:
                                                                    10.0,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          12.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                          ].divide(const SizedBox(
                                                              width: 4.0)),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 12.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'LOCAL_PAGE_btnFavoritar_ON_TAP');
                                                            HapticFeedback
                                                                .lightImpact();
                                                            if (FFAppState()
                                                                .favoritosLocais
                                                                .contains(widget
                                                                    .refLocal)) {
                                                              FFAppState()
                                                                  .removeFromFavoritosLocais(
                                                                      widget
                                                                          .refLocal!);
                                                              setState(() {});
                                                            } else {
                                                              FFAppState()
                                                                  .addToFavoritosLocais(
                                                                      widget
                                                                          .refLocal!);
                                                              setState(() {});
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 38.0,
                                                                    height:
                                                                        38.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Stack(
                                                                      children: [
                                                                        if (FFAppState().favoritosLocais.contains(localLocaisRecord.reference)
                                                                            ? false
                                                                            : true)
                                                                          const Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_border,
                                                                              color: Colors.white,
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                        if (FFAppState().favoritosLocais.contains(localLocaisRecord.reference)
                                                                            ? true
                                                                            : false)
                                                                          const Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Icon(
                                                                              Icons.favorite_sharp,
                                                                              color: Colors.white,
                                                                              size: 22.0,
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      FFAppState()
                                                                              .favoritosLocais
                                                                              .contains(localLocaisRecord.reference)
                                                                          ? 'Salvo!'
                                                                          : 'Salvar',
                                                                      'Salvar',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'LOCAL_PAGE_btnCheckin_ON_TAP');
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              useSafeArea: true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return WebViewAware(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () =>
                                                                        FocusScope.of(context)
                                                                            .unfocus(),
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          const LerQrCodeWidget(),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                safeSetState(
                                                                    () {}));

                                                            HapticFeedback
                                                                .lightImpact();
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: 38.0,
                                                                    height:
                                                                        38.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .amarelo,
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              4.0,
                                                                          color:
                                                                              Color(0x33000000),
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            2.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        const Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .place_outlined,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'Estou aqui!',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                        ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(const SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                  planoContainerPlanosRecord
                                                      .restricoesLocal
                                                      .seloCunhatur,
                                                  false,
                                                ))
                                                  Image.asset(
                                                    'assets/images/cunhatem_logo_cunhatur.png',
                                                    height: 30.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  localLocaisRecord.selosStrings
                                                      .contains(
                                                          'festivalgastronomico2024'),
                                                  false,
                                                ))
                                                  Image.asset(
                                                    'assets/images/cunhatem_logo_festival.png',
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                              ].divide(const SizedBox(height: 8.0)),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 8.0)),
                                      ),
                                    ),
                                    Divider(
                                      height: 30.0,
                                      thickness: 1.0,
                                      indent: 12.0,
                                      endIndent: 12.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  minHeight: 100.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          if (valueOrDefault<bool>(
                                            planoContainerPlanosRecord
                                                    .restricoesLocal
                                                    .descricaoCompleta ==
                                                true,
                                            false,
                                          ))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 14.0, 0.0),
                                                child: Text(
                                                  localLocaisRecord.descricao,
                                                  textAlign: TextAlign.start,
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
                                            ),
                                          if (valueOrDefault<bool>(
                                            planoContainerPlanosRecord
                                                    .restricoesLocal
                                                    .descricaoCompleta ==
                                                false,
                                            true,
                                          ))
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 14.0, 0.0),
                                                child: Text(
                                                  localLocaisRecord
                                                      .descricaoReduzida,
                                                  textAlign: TextAlign.start,
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
                                            ),
                                          if (valueOrDefault<bool>(
                                            (localLocaisRecord.formasPagamento.isNotEmpty) &&
                                                valueOrDefault<bool>(
                                                  planoContainerPlanosRecord
                                                          .restricoesLocal
                                                          .descricaoCompleta ==
                                                      true,
                                                  false,
                                                ),
                                            false,
                                          ))
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                14.0,
                                                                30.0,
                                                                14.0,
                                                                0.0),
                                                    child: Text(
                                                      'Formas de Pagamento Aceitas:',
                                                      textAlign:
                                                          TextAlign.start,
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
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final formasPagamento =
                                                          localLocaisRecord
                                                              .formasPagamento
                                                              .toList();

                                                      return Wrap(
                                                        spacing: 8.0,
                                                        runSpacing: 8.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            formasPagamento
                                                                .length,
                                                            (formasPagamentoIndex) {
                                                          final formasPagamentoItem =
                                                              formasPagamento[
                                                                  formasPagamentoIndex];
                                                          return Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      8.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    0.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    formasPagamentoItem ==
                                                                        'Pix',
                                                                    false,
                                                                  ))
                                                                    const Icon(
                                                                      Icons.pix,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    formasPagamentoItem ==
                                                                        'Crédito',
                                                                    false,
                                                                  ))
                                                                    const Icon(
                                                                      Icons
                                                                          .credit_card,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    formasPagamentoItem ==
                                                                        'Débito',
                                                                    false,
                                                                  ))
                                                                    const Icon(
                                                                      Icons
                                                                          .credit_card,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    formasPagamentoItem ==
                                                                        'Dinheiro',
                                                                    false,
                                                                  ))
                                                                    const Icon(
                                                                      Icons
                                                                          .monetization_on_outlined,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                  Text(
                                                                    formasPagamentoItem,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          Divider(
                                            height: 50.0,
                                            thickness: 1.0,
                                            indent: 12.0,
                                            endIndent: 12.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    ),
                                    FutureBuilder<List<AppConfiguracoesRecord>>(
                                      future: FFAppState().appConfiguracoes(
                                        uniqueQueryKey: 'pageLocal',
                                        requestFn: () =>
                                            queryAppConfiguracoesRecordOnce(
                                          singleRecord: true,
                                        ).then((result) {
                                          try {
                                            _model.firestoreRequestCompleted =
                                                true;
                                            _model.firestoreRequestLastUniqueKey =
                                                'pageLocal';
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
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
                                          child: Visibility(
                                            visible: valueOrDefault<bool>(
                                              (localLocaisRecord
                                                          .comodidadesStrings.isNotEmpty) &&
                                                  valueOrDefault<bool>(
                                                    planoContainerPlanosRecord
                                                            .restricoesLocal
                                                            .comodidades ==
                                                        true,
                                                    false,
                                                  ),
                                              false,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Text(
                                                    'Comodidades',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily),
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final comodidadesLocal =
                                                          comodidadesContainerAppConfiguracoesRecord
                                                                  ?.comodidadesGeral
                                                                  .where((e) => localLocaisRecord
                                                                      .comodidadesStrings
                                                                      .contains(
                                                                          e.id))
                                                                  .toList()
                                                                  .map(
                                                                      (e) => e)
                                                                  .toList()
                                                                  .toList() ??
                                                              [];

                                                      return Wrap(
                                                        spacing: 8.0,
                                                        runSpacing: 8.0,
                                                        alignment:
                                                            WrapAlignment.start,
                                                        crossAxisAlignment:
                                                            WrapCrossAlignment
                                                                .start,
                                                        direction:
                                                            Axis.horizontal,
                                                        runAlignment:
                                                            WrapAlignment.start,
                                                        verticalDirection:
                                                            VerticalDirection
                                                                .down,
                                                        clipBehavior: Clip.none,
                                                        children: List.generate(
                                                            comodidadesLocal
                                                                .length,
                                                            (comodidadesLocalIndex) {
                                                          final comodidadesLocalItem =
                                                              comodidadesLocal[
                                                                  comodidadesLocalIndex];
                                                          return Container(
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              boxShadow: const [
                                                                BoxShadow(
                                                                  blurRadius:
                                                                      8.0,
                                                                  color: Color(
                                                                      0x33000000),
                                                                  offset:
                                                                      Offset(
                                                                    0.0,
                                                                    0.0,
                                                                  ),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 16.0,
                                                                    height:
                                                                        16.0,
                                                                    child: custom_widgets
                                                                        .ComodidadeIcon(
                                                                      width:
                                                                          16.0,
                                                                      height:
                                                                          16.0,
                                                                      iconName:
                                                                          comodidadesLocalItem
                                                                              .icon,
                                                                      iconSize:
                                                                          18.0,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    comodidadesLocalItem
                                                                        .nome,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Divider(
                                                  height: 50.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    if (valueOrDefault<bool>(
                                      () {
                                        if (valueOrDefault<bool>(
                                              localLocaisRecord.telefone1 ==
                                                      '',
                                              true,
                                            ) &&
                                            valueOrDefault<bool>(
                                              localLocaisRecord.instagram ==
                                                      '',
                                              true,
                                            ) &&
                                            valueOrDefault<bool>(
                                              localLocaisRecord.email == '',
                                              true,
                                            ) &&
                                            valueOrDefault<bool>(
                                              localLocaisRecord.website ==
                                                      '',
                                              true,
                                            ) &&
                                            valueOrDefault<bool>(
                                              localLocaisRecord
                                                          .tripadvisorLink ==
                                                      '',
                                              true,
                                            )) {
                                          return false;
                                        } else if (valueOrDefault<bool>(
                                          planoContainerPlanosRecord
                                                  .restricoesLocal.contatos ==
                                              false,
                                          false,
                                        )) {
                                          return false;
                                        } else {
                                          return true;
                                        }
                                      }(),
                                      false,
                                    ))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Text(
                                              'Contatos',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
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
                                                                    .titleLargeFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (valueOrDefault<bool>(
                                                      localLocaisRecord
                                                                  .telefone1 !=
                                                              '',
                                                      false,
                                                    ) &&
                                                    valueOrDefault<bool>(
                                                      localLocaisRecord
                                                              .whatsapp1 ==
                                                          false,
                                                      true,
                                                    ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnTelefone1_ON_TAP');
                                                      await launchUrl(Uri(
                                                        scheme: 'tel',
                                                        path: localLocaisRecord
                                                            .telefone1,
                                                      ));
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.phone,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  (localLocaisRecord
                                                              .whatsapp1 ==
                                                          true) &&
                                                      valueOrDefault<bool>(
                                                        localLocaisRecord
                                                                    .telefone1 !=
                                                                '',
                                                        false,
                                                      ),
                                                  false,
                                                ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnWhatsApp1_ON_TAP');
                                                      await launchURL(
                                                          'https://api.whatsapp.com/send?phone=${localLocaisRecord.telefone1}&text=Ol%C3%A1,%20te%20encontrei%20atrav%C3%A9s%20do%20app%20CunhaTem');
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .whatsapp,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  localLocaisRecord
                                                              .instagram !=
                                                          '',
                                                  false,
                                                ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnInstagram_ON_TAP');
                                                      await launchURL(
                                                          'https://www.instagram.com/${localLocaisRecord.instagram}');
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .instagram,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  localLocaisRecord.email !=
                                                          '',
                                                  false,
                                                ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnEmail_ON_TAP');
                                                      await launchUrl(Uri(
                                                          scheme: 'mailto',
                                                          path:
                                                              localLocaisRecord
                                                                  .email,
                                                          query: {
                                                            'subject':
                                                                'Te encontrei pelo CunhaTem',
                                                          }
                                                              .entries
                                                              .map((MapEntry<
                                                                          String,
                                                                          String>
                                                                      e) =>
                                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                              .join('&')));
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Icon(
                                                          Icons.mail_outlined,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  localLocaisRecord
                                                              .website !=
                                                          '',
                                                  false,
                                                ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnWebsite_ON_TAP');
                                                      await launchURL(
                                                          localLocaisRecord
                                                              .website);
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons
                                                              .globeAmericas,
                                                          color: Colors.white,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (valueOrDefault<bool>(
                                                  localLocaisRecord
                                                              .website !=
                                                          '',
                                                  false,
                                                ))
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      logFirebaseEvent(
                                                          'LOCAL_PAGE_btnTripadvisor_ON_TAP');
                                                      await launchURL(
                                                          localLocaisRecord
                                                              .tripadvisorLink);
                                                    },
                                                    child: Container(
                                                      width: 48.0,
                                                      height: 48.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            blurRadius: 4.0,
                                                            color: Color(
                                                                0x33000000),
                                                            offset: Offset(
                                                              0.0,
                                                              2.0,
                                                            ),
                                                          )
                                                        ],
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/tripadivsor.png',
                                                            width: 30.0,
                                                            height: 30.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ]
                                                  .divide(const SizedBox(width: 12.0))
                                                  .addToStart(
                                                      const SizedBox(width: 12.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 12.0)),
                                            ),
                                          ),
                                          Divider(
                                            height: 50.0,
                                            thickness: 1.0,
                                            indent: 12.0,
                                            endIndent: 12.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    if (valueOrDefault<bool>(
                                      (localLocaisRecord.funcionamento !=
                                              null) &&
                                          valueOrDefault<bool>(
                                            planoContainerPlanosRecord
                                                    .restricoesLocal
                                                    .funcionamento ==
                                                true,
                                            false,
                                          ),
                                      false,
                                    ))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Funcionamento',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
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
                                                                    .titleLargeFamily),
                                                      ),
                                                ),
                                                wrapWithModel(
                                                  model:
                                                      _model.localAbertoModel2,
                                                  updateCallback: () =>
                                                      setState(() {}),
                                                  child: LocalAbertoWidget(
                                                    abre:
                                                        valueOrDefault<String>(
                                                      () {
                                                        if (functions.weekDayNumber(
                                                                getCurrentTimestamp) ==
                                                            '1') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .segundaAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '2') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .tercaAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '3') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .quartaAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '4') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .quintaAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '5') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .sextaAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '6') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .sabadoAbre;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '7') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .domingoAbre;
                                                        } else {
                                                          return '00:00';
                                                        }
                                                      }(),
                                                      '00:00',
                                                    ),
                                                    fecha:
                                                        valueOrDefault<String>(
                                                      () {
                                                        if (functions.weekDayNumber(
                                                                getCurrentTimestamp) ==
                                                            '1') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .segundaFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '2') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .tercaFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '3') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .quartaFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '4') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .quintaFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '5') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .sextaFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '6') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .sabadoFecha;
                                                        } else if (functions
                                                                .weekDayNumber(
                                                                    getCurrentTimestamp) ==
                                                            '7') {
                                                          return localLocaisRecord
                                                              .funcionamento
                                                              .domingoFecha;
                                                        } else {
                                                          return '00:00';
                                                        }
                                                      }(),
                                                      '00:00',
                                                    ),
                                                    aberto24h: () {
                                                      if (functions.weekDayNumber(
                                                              getCurrentTimestamp) ==
                                                          '1') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .segunda24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '2') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .terca24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '3') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .quarta24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '4') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .quinta24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '5') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .sexta24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '6') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .sabado24h;
                                                      } else if (functions
                                                              .weekDayNumber(
                                                                  getCurrentTimestamp) ==
                                                          '7') {
                                                        return localLocaisRecord
                                                            .funcionamento
                                                            .domingo24h;
                                                      } else {
                                                        return false;
                                                      }
                                                    }(),
                                                    tipo: 'page',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Segunda-feira',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .segundaAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.segundaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .segunda24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .segundaFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Terça-feira',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .tercaAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.tercaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .terca24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .tercaFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Quarta-feira',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quartaAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quartaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quarta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quartaFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Quinta-feira',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quintaAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.quintaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .quinta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .quintaFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sexta-feira',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sextaAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sextaFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sexta24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sextaFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Sábado',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sabadoAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.sabadoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .sabado24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .sabadoFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  height: 6.0,
                                                  thickness: 1.0,
                                                  indent: 12.0,
                                                  endIndent: 12.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .linhasSeparadores,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Domingo',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                      RichText(
                                                        textScaler:
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler,
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return 'Fechado';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '24h';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .domingoAbre;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return ' às ';
                                                                }
                                                              }(),
                                                              style:
                                                                  const TextStyle(),
                                                            ),
                                                            TextSpan(
                                                              text: () {
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h !=
                                                                          true,
                                                                      true,
                                                                    )) {
                                                                  return '';
                                                                } else if (valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoAbre ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord.funcionamento.domingoFecha ==
                                                                              '',
                                                                      true,
                                                                    ) &&
                                                                    valueOrDefault<
                                                                        bool>(
                                                                      localLocaisRecord
                                                                              .funcionamento
                                                                              .domingo24h ==
                                                                          true,
                                                                      false,
                                                                    )) {
                                                                  return '';
                                                                } else {
                                                                  return localLocaisRecord
                                                                      .funcionamento
                                                                      .domingoFecha;
                                                                }
                                                              }(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
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
                                                            )
                                                          ],
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily),
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (valueOrDefault<bool>(
                                            localLocaisRecord
                                                        .observacoesFuncionamento !=
                                                    '',
                                            false,
                                          ))
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 12.0, 12.0, 0.0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Observações: ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    TextSpan(
                                                      text: localLocaisRecord
                                                          .observacoesFuncionamento,
                                                      style: const TextStyle(),
                                                    )
                                                  ],
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
                                            ),
                                          Divider(
                                            height: 50.0,
                                            thickness: 1.0,
                                            indent: 12.0,
                                            endIndent: 12.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                    if (valueOrDefault<bool>(
                                      localLocaisRecord.localizacao != null,
                                      false,
                                    ))
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Localização',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLargeFamily,
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
                                                                    .titleLargeFamily),
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 12.0, 14.0, 0.0),
                                            child: RichText(
                                              textScaler: MediaQuery.of(context)
                                                  .textScaler,
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Endereço: ',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                        ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '${localLocaisRecord.enderecoLogradouro}${localLocaisRecord.enderecoNumero != '' ? ', ${localLocaisRecord.enderecoNumero}' : ''}${localLocaisRecord.enderecoBairro != '' ? ' - ${localLocaisRecord.enderecoBairro}' : ' '}',
                                                    style: const TextStyle(),
                                                  )
                                                ],
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
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 16.0, 12.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'LOCAL_PAGE_mapContainer_ON_TAP');
                                                await launchMap(
                                                  mapType: $ml.MapType.google,
                                                  location: localLocaisRecord
                                                      .localizacao,
                                                  title: localLocaisRecord.nome,
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 220.0,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: FlutterFlowStaticMap(
                                                  location: localLocaisRecord
                                                      .localizacao!,
                                                  apiKey:
                                                      'pk.eyJ1IjoiZ3Vzb25iYWlhIiwiYSI6ImNsam5vb2x5czE4aHEzZHRndjZ0cWM4dHMifQ.Tydn_dYML6hea1So70wl8A',
                                                  style: mapbox.MapBoxStyle
                                                      .Satellite_Street_V11,
                                                  width: double.infinity,
                                                  height: 220.0,
                                                  fit: BoxFit.cover,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  markerColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  cached: true,
                                                  zoom: 14,
                                                  tilt: 0,
                                                  rotation: 0,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 16.0, 12.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'LOCAL_PAGE_btnAbrirRota_ON_TAP');
                                                HapticFeedback.lightImpact();
                                                await launchMap(
                                                  mapType: $ml.MapType.google,
                                                  location: localLocaisRecord
                                                      .localizacao,
                                                  title: localLocaisRecord.nome,
                                                );
                                              },
                                              text: 'Chegar até lá!',
                                              icon: const Icon(
                                                Icons.location_on_rounded,
                                                size: 18.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 50.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      useGoogleFonts:
                                                          GoogleFonts.asMap()
                                                              .containsKey(
                                                                  'Inter'),
                                                    ),
                                                elevation: 3.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ),
                                          Divider(
                                            height: 50.0,
                                            thickness: 1.0,
                                            indent: 12.0,
                                            endIndent: 12.0,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 80.0)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x58000000),
                        Color(0x32000000),
                        Colors.transparent
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent('LOCAL_PAGE_btnBack_ON_TAP');
                              context.safePop();
                            },
                            child: Container(
                              width: 60.0,
                              height: 60.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 8.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    shape: BoxShape.circle,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: FaIcon(
                                      FontAwesomeIcons.angleLeft,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (valueOrDefault<bool>(
                                (currentUserDocument?.tipoUser ==
                                        TipoUser.admin) ||
                                    valueOrDefault<bool>(
                                      currentUserDocument?.tipoUser ==
                                          TipoUser.colaborador,
                                      false,
                                    ),
                                false,
                              ))
                                AuthUserStreamWidget(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'LOCAL_PAGE_btnEditLocal_ON_TAP');
                                      HapticFeedback.lightImpact();

                                      context.pushNamed(
                                        'localEdit',
                                        queryParameters: {
                                          'refLocal': serializeParam(
                                            localLocaisRecord.reference,
                                            ParamType.DocumentReference,
                                          ),
                                          'novo': serializeParam(
                                            false,
                                            ParamType.bool,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                          ),
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: 60.0,
                                      height: 60.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: const [
                                              BoxShadow(
                                                blurRadius: 8.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.edit,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 28.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'LOCAL_PAGE_btnShare_ON_TAP');
                                    HapticFeedback.lightImpact();
                                    await Share.share(
                                      functions.gerarLink(
                                          'local/${localLocaisRecord.reference.id}')!,
                                      sharePositionOrigin:
                                          getWidgetBoundingBox(context),
                                    );
                                  },
                                  child: Container(
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.rectangle,
                                    ),
                                    child: Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 40.0,
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 8.0,
                                              color: Color(0x33000000),
                                              offset: Offset(
                                                0.0,
                                                2.0,
                                              ),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Icon(
                                            Icons.ios_share_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 28.0,
                                          ),
                                        ),
                                      ),
                                    ),
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
                                      'LOCAL_PAGE_btnOpenMap_ON_TAP');
                                  HapticFeedback.lightImpact();
                                  await launchMap(
                                    mapType: $ml.MapType.google,
                                    location: localLocaisRecord.localizacao,
                                    title: localLocaisRecord.nome,
                                  );
                                },
                                child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.rectangle,
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: const [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: Color(0x33000000),
                                            offset: Offset(
                                              0.0,
                                              2.0,
                                            ),
                                          )
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Align(
                                        alignment:
                                            const AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          Icons.location_on_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
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
