import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/favoritar/favoritar_widget.dart';
import '/main/pages/modais/local_aberto/local_aberto_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'card_local2_model.dart';
export 'card_local2_model.dart';

class CardLocal2Widget extends StatefulWidget {
  const CardLocal2Widget({
    super.key,
    this.local,
    this.distancia,
  });

  final LocaisRecord? local;
  final String? distancia;

  @override
  State<CardLocal2Widget> createState() => _CardLocal2WidgetState();
}

class _CardLocal2WidgetState extends State<CardLocal2Widget> {
  late CardLocal2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardLocal2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<PlanosRecord>(
      future: PlanosRecord.getDocumentOnce(widget.local!.planoCunhatem!),
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

        final cardPlanosRecord = snapshot.data!;

        return InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            logFirebaseEvent('CARD_LOCAL2_COMP_card_ON_TAP');

            context.pushNamed(
              'local',
              pathParameters: {
                'refLocal': serializeParam(
                  widget.local?.reference,
                  ParamType.DocumentReference,
                ),
              }.withoutNulls,
            );

            HapticFeedback.lightImpact();
          },
          child: Material(
            color: Colors.transparent,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Container(
              constraints: const BoxConstraints(
                minWidth: 200.0,
                maxWidth: 260.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      flex: 7,
                      child: Container(
                        height: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Stack(
                          children: [
                            if (widget.local?.galeriaFotos.isEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/Empty_Photo_1920x1080.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            if (valueOrDefault<bool>(
                              widget.local!.galeriaFotos.isNotEmpty,
                              false,
                            ))
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: OctoImage(
                                  placeholderBuilder: (_) => SizedBox.expand(
                                    child: Image(
                                      image: BlurHashImage(widget
                                          .local!.galeriaFotos.first.blurHash),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  image: CachedNetworkImageProvider(
                                    widget.local!.galeriaFotos.first.image,
                                  ),
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Image.asset(
                                    'assets/images/error_image.png',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 8.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.favoritarModel,
                                  updateCallback: () => setState(() {}),
                                  child: FavoritarWidget(
                                    favorito: FFAppState()
                                            .favoritosLocais
                                            .contains(widget.local?.reference)
                                        ? true
                                        : false,
                                    refLocal: widget.local?.reference,
                                  ),
                                ),
                              ),
                            ),
                            if (valueOrDefault<bool>(
                              cardPlanosRecord.restricoesLocal.seloCunhatur,
                              false,
                            ))
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(30.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(
                                        'assets/images/cunhatem_logo_cunhatur.png',
                                        height: 30.0,
                                        fit: BoxFit.contain,
                                      ),
                                    ].divide(const SizedBox(height: 8.0)),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              valueOrDefault<String>(
                                widget.local?.nome,
                                'Sem nome',
                              ),
                              style: GoogleFonts.getFont(
                                'Comfortaa',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(),
                            child: Visibility(
                              visible: valueOrDefault<bool>(
                                cardPlanosRecord.restricoesLocal.funcionamento,
                                false,
                              ),
                              child: wrapWithModel(
                                model: _model.localAbertoModel,
                                updateCallback: () => setState(() {}),
                                child: LocalAbertoWidget(
                                  abre: valueOrDefault<String>(
                                    () {
                                      if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '1') {
                                        return widget
                                            .local?.funcionamento.segundaAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '2') {
                                        return widget
                                            .local?.funcionamento.tercaAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '3') {
                                        return widget
                                            .local?.funcionamento.quartaAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '4') {
                                        return widget
                                            .local?.funcionamento.quintaAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '5') {
                                        return widget
                                            .local?.funcionamento.sextaAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '6') {
                                        return widget
                                            .local?.funcionamento.sabadoAbre;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '7') {
                                        return widget
                                            .local?.funcionamento.domingoAbre;
                                      } else {
                                        return '00:00';
                                      }
                                    }(),
                                    '00:00',
                                  ),
                                  fecha: valueOrDefault<String>(
                                    () {
                                      if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '1') {
                                        return widget
                                            .local?.funcionamento.segundaFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '2') {
                                        return widget
                                            .local?.funcionamento.tercaFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '3') {
                                        return widget
                                            .local?.funcionamento.quartaFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '4') {
                                        return widget
                                            .local?.funcionamento.quintaFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '5') {
                                        return widget
                                            .local?.funcionamento.sextaFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '6') {
                                        return widget
                                            .local?.funcionamento.sabadoFecha;
                                      } else if (functions.weekDayNumber(
                                              getCurrentTimestamp) ==
                                          '7') {
                                        return widget
                                            .local?.funcionamento.domingoFecha;
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
                                      return widget
                                          .local?.funcionamento.segunda24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '2') {
                                      return widget
                                          .local?.funcionamento.terca24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '3') {
                                      return widget
                                          .local?.funcionamento.quarta24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '4') {
                                      return widget
                                          .local?.funcionamento.quinta24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '5') {
                                      return widget
                                          .local?.funcionamento.sexta24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '6') {
                                      return widget
                                          .local?.funcionamento.sabado24h;
                                    } else if (functions.weekDayNumber(
                                            getCurrentTimestamp) ==
                                        '7') {
                                      return widget
                                          .local?.funcionamento.domingo24h;
                                    } else {
                                      return false;
                                    }
                                  }(),
                                  tipo: 'card',
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 16.0,
                              ),
                              if (valueOrDefault<bool>(
                                widget.local?.localizacao != null,
                                false,
                              ))
                                AutoSizeText(
                                  valueOrDefault<String>(
                                    widget.distancia,
                                    'a ?km',
                                  ),
                                  minFontSize: 10.0,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                            ].divide(const SizedBox(width: 4.0)),
                          ),
                        ].divide(const SizedBox(width: 12.0)),
                      ),
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
