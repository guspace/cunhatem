import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_static_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/em_construcao/ler_qr_code/ler_qr_code_widget.dart';
import '/main/pages/modais/card_modais/card_local2/card_local2_widget.dart';
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
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'evento_model.dart';
export 'evento_model.dart';

class EventoWidget extends StatefulWidget {
  const EventoWidget({
    super.key,
    required this.refEvento,
  });

  final DocumentReference? refEvento;

  @override
  State<EventoWidget> createState() => _EventoWidgetState();
}

class _EventoWidgetState extends State<EventoWidget> {
  late EventoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'evento'});
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

    return FutureBuilder<EventosRecord>(
      future: (_model.documentRequestCompleter ??= Completer<EventosRecord>()
            ..complete(EventosRecord.getDocumentOnce(widget.refEvento!)))
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

        final eventoEventosRecord = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                RefreshIndicator(
                  color: FlutterFlowTheme.of(context).primary,
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  strokeWidth: 4.0,
                  onRefresh: () async {
                    logFirebaseEvent(
                        'EVENTO_Column_ycli4nry_ON_PULL_TO_REFRES');
                    FFAppState().clearEventosCache();
                    setState(() => _model.documentRequestCompleter = null);
                    await _model.waitForDocumentRequestCompleted();
                  },
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                  final fotosEvento =
                                      eventoEventosRecord.galeriaFotos.toList();

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
                                                          fotosEvento.length -
                                                              1))),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: fotosEvento.length,
                                          itemBuilder:
                                              (context, fotosEventoIndex) {
                                            final fotosEventoItem =
                                                fotosEvento[fotosEventoIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_Image_6g3ymdnh_ON_TAP');
                                                await Navigator.push(
                                                  context,
                                                  PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    child:
                                                        FlutterFlowExpandedImageView(
                                                      image: OctoImage(
                                                        placeholderBuilder:
                                                            (_) =>
                                                                SizedBox.expand(
                                                          child: Image(
                                                            image: BlurHashImage(
                                                                fotosEventoItem
                                                                    .blurHash),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        image:
                                                            CachedNetworkImageProvider(
                                                          fotosEventoItem.image,
                                                        ),
                                                        fit: BoxFit.contain,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.png',
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                      allowRotation: false,
                                                      tag:
                                                          fotosEventoItem.image,
                                                      useHeroAnimation: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Hero(
                                                tag: fotosEventoItem.image,
                                                transitionOnUserGestures: true,
                                                child: OctoImage(
                                                  placeholderBuilder: (_) =>
                                                      SizedBox.expand(
                                                    child: Image(
                                                      image: BlurHashImage(
                                                          fotosEventoItem
                                                              .blurHash),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  image:
                                                      CachedNetworkImageProvider(
                                                    fotosEventoItem.image,
                                                  ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 14.0),
                                            child: smooth_page_indicator
                                                .SmoothPageIndicator(
                                              controller: _model
                                                      .pageViewController ??=
                                                  PageController(
                                                      initialPage: max(
                                                          0,
                                                          min(
                                                              0,
                                                              fotosEvento
                                                                      .length -
                                                                  1))),
                                              count: fotosEvento.length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) async {
                                                await _model.pageViewController!
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
                                                dotColor: Color(0x80FFFFFF),
                                                activeDotColor: Colors.white,
                                                paintStyle: PaintingStyle.fill,
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
                          width: double.infinity,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        valueOrDefault<String>(
                                          eventoEventosRecord.nome,
                                          'Nome do Evento',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
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
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 20.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      valueOrDefault<String>(
                                        '${dateTimeFormat(
                                          "MMMMEEEEd",
                                          eventoEventosRecord.comecaEm,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )} até ${dateTimeFormat(
                                          "MMMMEEEEd",
                                          eventoEventosRecord.terminaEm,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        'Datas do Evento',
                                      ),
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        color: FlutterFlowTheme.of(context)
                                            .textDescription,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(const SizedBox(width: 6.0))
                                    .addToStart(const SizedBox(width: 12.0))
                                    .addToEnd(const SizedBox(width: 12.0)),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 12.0, 12.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EVENTO_PAGE_btnCheckin_ON_TAP');
                                        HapticFeedback.lightImpact();
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
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
                                                  child: const LerQrCodeWidget(),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 6.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 38.0,
                                                height: 38.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .amarelo,
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
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    Icons.place_outlined,
                                                    color: Colors.white,
                                                    size: 22.0,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Estou aqui!',
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
                                            ].divide(const SizedBox(width: 8.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 24.0)),
                                ),
                              ),
                              Divider(
                                height: 30.0,
                                thickness: 1.0,
                                indent: 12.0,
                                endIndent: 12.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ].divide(const SizedBox(height: 6.0)),
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
                              if (valueOrDefault<bool>(
                                eventoEventosRecord.descricao != '',
                                false,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          14.0, 0.0, 14.0, 0.0),
                                      child: Text(
                                        eventoEventosRecord.descricao,
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
                                valueOrDefault<bool>(
                                          eventoEventosRecord.telefone1 ==
                                                  '',
                                          true,
                                        ) &&
                                        valueOrDefault<bool>(
                                          eventoEventosRecord.instagram ==
                                                  '',
                                          true,
                                        ) &&
                                        valueOrDefault<bool>(
                                          eventoEventosRecord.email == '',
                                          true,
                                        ) &&
                                        valueOrDefault<bool>(
                                          eventoEventosRecord.website == '',
                                          true,
                                        )
                                    ? false
                                    : true,
                                false,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      child: Text(
                                        'Mais informações',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (valueOrDefault<bool>(
                                            eventoEventosRecord.telefone1 !=
                                                    '',
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_btnTelefone_ON_TAP');
                                                await launchUrl(Uri(
                                                  scheme: 'tel',
                                                  path: eventoEventosRecord
                                                      .telefone1,
                                                ));
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                            valueOrDefault<bool>(
                                                  eventoEventosRecord
                                                              .telefone1 !=
                                                          '',
                                                  false,
                                                ) &&
                                                eventoEventosRecord.whatsapp1,
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_btnWhatsApp_ON_TAP');
                                                await launchURL(
                                                    'https://api.whatsapp.com/send?phone=${eventoEventosRecord.telefone1}&text=Ol%C3%A1,%20te%20encontrei%20atrav%C3%A9s%20do%20app%20CunhaTem');
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.whatsapp,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            eventoEventosRecord.instagram !=
                                                    '',
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_btnInstagram_ON_TAP');
                                                await launchURL(
                                                    'https://www.instagram.com/${eventoEventosRecord.instagram}');
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.instagram,
                                                    color: Colors.white,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          if (valueOrDefault<bool>(
                                            eventoEventosRecord.email != '',
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_btnEmail_ON_TAP');
                                                await launchUrl(Uri(
                                                    scheme: 'mailto',
                                                    path: eventoEventosRecord
                                                        .email,
                                                    query: {
                                                      'subject':
                                                          'Te encontrei pelo CunhaTem',
                                                    }
                                                        .entries
                                                        .map((MapEntry<String,
                                                                    String>
                                                                e) =>
                                                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                        .join('&')));
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                            eventoEventosRecord.website !=
                                                    '',
                                            false,
                                          ))
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'EVENTO_PAGE_btnWebsite_ON_TAP');
                                                await launchURL(
                                                    eventoEventosRecord
                                                        .website);
                                              },
                                              child: Container(
                                                width: 48.0,
                                                height: 48.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
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
                                        ]
                                            .divide(const SizedBox(width: 14.0))
                                            .addToStart(const SizedBox(width: 12.0))
                                            .addToEnd(const SizedBox(width: 12.0)),
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
                                eventoEventosRecord.semEndereco ? false : true,
                                true,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Localização',
                                        style: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          14.0, 12.0, 14.0, 0.0),
                                      child: RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Endereço: ',
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
                                                  '${eventoEventosRecord.enderecoLogradouro}${eventoEventosRecord.enderecoNumero != '' ? ', ${eventoEventosRecord.enderecoNumero}' : ''}${eventoEventosRecord.enderecoBairro != '' ? ' - ${eventoEventosRecord.enderecoBairro}' : ' '}',
                                              style: const TextStyle(),
                                            )
                                          ],
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
                                        ),
                                      ),
                                    ),
                                    if (valueOrDefault<bool>(
                                      eventoEventosRecord.localizacao != null,
                                      false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 16.0, 12.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'EVENTO_PAGE_mapContainer_ON_TAP');
                                            await launchMap(
                                              mapType: $ml.MapType.google,
                                              location: eventoEventosRecord
                                                  .localizacao,
                                              title: eventoEventosRecord.nome,
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
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: FlutterFlowStaticMap(
                                              location: eventoEventosRecord
                                                  .localizacao!,
                                              apiKey:
                                                  'pk.eyJ1IjoiZ3Vzb25iYWlhIiwiYSI6ImNsam5vb2x5czE4aHEzZHRndjZ0cWM4dHMifQ.Tydn_dYML6hea1So70wl8A',
                                              style: mapbox.MapBoxStyle
                                                  .Satellite_Street_V11,
                                              width: double.infinity,
                                              height: 220.0,
                                              fit: BoxFit.cover,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              markerColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              cached: true,
                                              zoom: 14,
                                              tilt: 0,
                                              rotation: 0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      eventoEventosRecord.localizacao != null,
                                      false,
                                    ))
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            12.0, 16.0, 12.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            print('Button pressed ...');
                                          },
                                          text: 'Chegar até lá!',
                                          icon: const FaIcon(
                                            FontAwesomeIcons.mapMarkerAlt,
                                            size: 16.0,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 50.0,
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: Colors.white,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                  useGoogleFonts:
                                                      GoogleFonts.asMap()
                                                          .containsKey('Inter'),
                                                ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
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
                                valueOrDefault<bool>(
                                          eventoEventosRecord.vinculadoLocal ==
                                              true,
                                          false,
                                        ) &&
                                        valueOrDefault<bool>(
                                          eventoEventosRecord
                                                  .vinculoLocais.isNotEmpty,
                                          false,
                                        )
                                    ? true
                                    : false,
                                false,
                              ))
                                FutureBuilder<List<LocaisRecord>>(
                                  future: queryLocaisRecordOnce(
                                    queryBuilder: (locaisRecord) => locaisRecord
                                        .whereIn(
                                            'id',
                                            eventoEventosRecord.vinculoLocais
                                                .map((e) => e.id)
                                                .toList())
                                        .where(
                                          'visivel',
                                          isEqualTo: true,
                                        )
                                        .where(
                                          'lixeira',
                                          isEqualTo: false,
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
                                        containerLocaisRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                Expanded(
                                                  child: AutoSizeText(
                                                    'Locais Relacionados',
                                                    minFontSize: 16.0,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                                  ),
                                                ),
                                              ].divide(const SizedBox(width: 12.0)),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 12.0, 0.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 250.0,
                                              decoration: const BoxDecoration(),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        final locaisRelacionados =
                                                            containerLocaisRecordList
                                                                .toList();
                                                        if (locaisRelacionados
                                                            .isEmpty) {
                                                          return Center(
                                                            child: Image.asset(
                                                              'assets/images/Pasta_vazia.png',
                                                            ),
                                                          );
                                                        }

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemCount:
                                                              locaisRelacionados
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              const SizedBox(
                                                                  width: 12.0),
                                                          itemBuilder: (context,
                                                              locaisRelacionadosIndex) {
                                                            final locaisRelacionadosItem =
                                                                locaisRelacionados[
                                                                    locaisRelacionadosIndex];
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          4.0),
                                                              child:
                                                                  wrapWithModel(
                                                                model: _model
                                                                    .cardLocal2Models
                                                                    .getModel(
                                                                  locaisRelacionadosItem
                                                                      .reference
                                                                      .id,
                                                                  locaisRelacionadosIndex,
                                                                ),
                                                                updateCallback:
                                                                    () => setState(
                                                                        () {}),
                                                                child:
                                                                    CardLocal2Widget(
                                                                  key: Key(
                                                                    'Key0dx_${locaisRelacionadosItem.reference.id}',
                                                                  ),
                                                                  local:
                                                                      locaisRelacionadosItem,
                                                                  distancia:
                                                                      'a ${valueOrDefault<String>(
                                                                    functions.getDistanceBetween(currentUserLocationValue!,
                                                                                locaisRelacionadosItem.localizacao!) >
                                                                            1.0
                                                                        ? formatNumber(
                                                                            functions.getDistanceBetween(currentUserLocationValue!,
                                                                                locaisRelacionadosItem.localizacao!),
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#',
                                                                            locale:
                                                                                'pt_BR',
                                                                          )
                                                                        : formatNumber(
                                                                            functions.getDistanceBetween(currentUserLocationValue!,
                                                                                locaisRelacionadosItem.localizacao!),
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#.0',
                                                                            locale:
                                                                                'pt_BR',
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
                                                  ]
                                                      .addToStart(
                                                          const SizedBox(width: 12.0))
                                                      .addToEnd(const SizedBox(
                                                          width: 12.0)),
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
                      ].addToEnd(const SizedBox(height: 80.0)),
                    ),
                  ),
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
                              logFirebaseEvent('EVENTO_PAGE_btnBack_ON_TAP');
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
                                          'EVENTO_PAGE_btnEditEvento_ON_TAP');
                                      HapticFeedback.lightImpact();

                                      context.pushNamed(
                                        'eventoEdit',
                                        queryParameters: {
                                          'refEvento': serializeParam(
                                            widget.refEvento,
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
                                        'EVENTO_PAGE_btnShare_ON_TAP');
                                    HapticFeedback.lightImpact();
                                    await Share.share(
                                      functions.gerarLink(
                                          'evento/${widget.refEvento?.id}')!,
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
                              if (valueOrDefault<bool>(
                                eventoEventosRecord.localizacao != null,
                                false,
                              ))
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'EVENTO_PAGE_btnOpenMap_ON_TAP');
                                    await launchMap(
                                      mapType: $ml.MapType.google,
                                      location: eventoEventosRecord.localizacao,
                                      title: eventoEventosRecord.nome,
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
                                            Icons.place_sharp,
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
