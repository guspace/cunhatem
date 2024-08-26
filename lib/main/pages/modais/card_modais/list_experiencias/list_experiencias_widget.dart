import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/card_experiencia2/card_experiencia2_widget.dart';
import '/main/pages/modais/empty_list/empty_list_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_experiencias_model.dart';
export 'list_experiencias_model.dart';

class ListExperienciasWidget extends StatefulWidget {
  const ListExperienciasWidget({
    super.key,
    String? texto,
    this.experiencias,
  }) : texto = texto ?? 'Lista';

  final String texto;
  final List<ExperienciasRecord>? experiencias;

  @override
  State<ListExperienciasWidget> createState() => _ListExperienciasWidgetState();
}

class _ListExperienciasWidgetState extends State<ListExperienciasWidget> {
  late ListExperienciasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListExperienciasModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  widget.texto,
                  minFontSize: 16.0,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  logFirebaseEvent('LIST_EXPERIENCIAS_COMP_btnVertudo_ON_TAP');
                  HapticFeedback.lightImpact();

                  context.pushNamed('listaExperiencia');
                },
                child: Container(
                  height: 40.0,
                  decoration: const BoxDecoration(),
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
                      child: Text(
                        'Ver tudo',
                        style: FlutterFlowTheme.of(context).bodySmall.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodySmallFamily,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context).bodySmallFamily),
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ].divide(const SizedBox(width: 12.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 250.0,
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final experiencias = widget.experiencias?.toList() ?? [];
                      if (experiencias.isEmpty) {
                        return const Center(
                          child: EmptyListWidget(),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: experiencias.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12.0),
                        itemBuilder: (context, experienciasIndex) {
                          final experienciasItem =
                              experiencias[experienciasIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: wrapWithModel(
                              model: _model.cardExperiencia2Models.getModel(
                                experienciasItem.reference.id,
                                experienciasIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              child: CardExperiencia2Widget(
                                key: Key(
                                  'Keyscq_${experienciasItem.reference.id}',
                                ),
                                experiencia: experienciasItem,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'LIST_EXPERIENCIAS_COMP_btnVetudo_ON_TAP');
                        HapticFeedback.lightImpact();

                        context.pushNamed('listaExperiencia');
                      },
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: const CircleBorder(),
                        child: Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.chevron_right_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 44.0,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 4.0, 20.0),
                                  child: Text(
                                    'Ver tudo',
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmallFamily),
                                          lineHeight: 0.8,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(width: 12.0))
                    .addToEnd(const SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
