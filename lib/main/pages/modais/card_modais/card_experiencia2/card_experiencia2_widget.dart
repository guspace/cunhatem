import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/favoritar/favoritar_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'card_experiencia2_model.dart';
export 'card_experiencia2_model.dart';

class CardExperiencia2Widget extends StatefulWidget {
  const CardExperiencia2Widget({
    super.key,
    required this.experiencia,
  });

  final ExperienciasRecord? experiencia;

  @override
  State<CardExperiencia2Widget> createState() => _CardExperiencia2WidgetState();
}

class _CardExperiencia2WidgetState extends State<CardExperiencia2Widget> {
  late CardExperiencia2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardExperiencia2Model());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        logFirebaseEvent('CARD_EXPERIENCIA2_Container_mkafcx44_ON_');

        context.pushNamed(
          'experiencia',
          pathParameters: {
            'refExperiencia': serializeParam(
              widget.experiencia?.reference,
              ParamType.DocumentReference,
            ),
          }.withoutNulls,
        );
      },
      child: Material(
        color: Colors.transparent,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 200.0,
            maxWidth: 260.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(12.0),
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
                    constraints: const BoxConstraints(
                      maxWidth: 300.0,
                      maxHeight: 200.0,
                    ),
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        if (valueOrDefault<bool>(
                          widget.experiencia?.galeriaFotos.isEmpty,
                          true,
                        ))
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
                          widget.experiencia!.galeriaFotos.isNotEmpty,
                          false,
                        ))
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: OctoImage(
                              placeholderBuilder: (_) => SizedBox.expand(
                                child: Image(
                                  image: BlurHashImage(widget.experiencia!
                                      .galeriaFotos.first.blurHash),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              image: CachedNetworkImageProvider(
                                widget.experiencia!.galeriaFotos.first.image,
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
                              updateOnChange: true,
                              child: FavoritarWidget(
                                favorito: FFAppState()
                                        .favoritosExperiencias
                                        .contains(
                                            widget.experiencia?.reference)
                                    ? true
                                    : false,
                                refExperiencia: widget.experiencia?.reference,
                              ),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: AutoSizeText(
                          valueOrDefault<String>(
                            widget.experiencia?.nome,
                            'Nome da Experiência',
                          ),
                          minFontSize: 12.0,
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (valueOrDefault<bool>(
                        valueOrDefault<bool>(
                                  widget.experiencia?.experienciaPaga == true,
                                  false,
                                ) &&
                                valueOrDefault<bool>(
                                  widget.experiencia!.valores.isNotEmpty,
                                  false,
                                )
                            ? true
                            : false,
                        false,
                      ))
                        Flexible(
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Valor: ',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.0,
                                  ),
                                ),
                                TextSpan(
                                  text: '${formatNumber(
                                    widget.experiencia?.valores
                                        .sortedList(
                                            keyOf: (e) => e.valor, desc: false)
                                        .first
                                        .valor,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: 'R\$',
                                  )} por pessoa',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.0,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                        ),
                      if (valueOrDefault<bool>(
                        widget.experiencia?.duracaoHoras != null &&
                                widget.experiencia?.duracaoHoras != ''
                            ? true
                            : false,
                        false,
                      ))
                        Flexible(
                          child: RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Duração: ',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.0,
                                  ),
                                ),
                                TextSpan(
                                  text: valueOrDefault<String>(
                                    widget.experiencia?.duracaoHoras,
                                    '5',
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.0,
                                  ),
                                ),
                                TextSpan(
                                  text: ' horas',
                                  style: FlutterFlowTheme.of(context)
                                      .bodySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodySmallFamily),
                                      ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context)
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
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ].divide(const SizedBox(height: 6.0)),
            ),
          ),
        ),
      ),
    );
  }
}
