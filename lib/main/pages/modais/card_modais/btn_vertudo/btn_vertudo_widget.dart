import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'btn_vertudo_model.dart';
export 'btn_vertudo_model.dart';

class BtnVertudoWidget extends StatefulWidget {
  const BtnVertudoWidget({
    super.key,
    this.categoria,
    this.subcategoria,
    String? tipo,
  }) : tipo = tipo ?? 'texto';

  final CategoriasStruct? categoria;
  final SubCategoriasStruct? subcategoria;
  final String tipo;

  @override
  State<BtnVertudoWidget> createState() => _BtnVertudoWidgetState();
}

class _BtnVertudoWidgetState extends State<BtnVertudoWidget> {
  late BtnVertudoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BtnVertudoModel());

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
      children: [
        if (valueOrDefault<bool>(
              widget.tipo == 'texto',
              true,
            ) ||
            valueOrDefault<bool>(
              widget.tipo == 'textopage',
              false,
            ))
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              logFirebaseEvent('BTN_VERTUDO_COMP_btnVertudo_ON_TAP');
              HapticFeedback.lightImpact();
              if (widget.tipo == 'texto') {
                FFAppState().subcategoriaSelecionada = widget.subcategoria!;
                FFAppState().categoriaSelecionada = widget.categoria!;
                _model.updatePage(() {});

                context.pushNamed('mapaLista');
              } else if (widget.tipo == 'textopage') {}
            },
            child: Container(
              height: 40.0,
              decoration: const BoxDecoration(),
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 0.0),
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
        if (valueOrDefault<bool>(
              widget.tipo == 'circulo',
              false,
            ) ||
            valueOrDefault<bool>(
              widget.tipo == 'circulopage',
              false,
            ))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                logFirebaseEvent('BTN_VERTUDO_COMP_btnVetudo_ON_TAP');
                HapticFeedback.lightImpact();
                FFAppState().subcategoriaSelecionada = widget.subcategoria!;
                FFAppState().categoriaSelecionada = widget.categoria!;
                _model.updatePage(() {});

                context.pushNamed('mapaLista');
              },
              child: Material(
                color: Colors.transparent,
                elevation: 1.0,
                shape: const CircleBorder(),
                child: Container(
                  width: 90.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
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
                            color: FlutterFlowTheme.of(context).secondaryText,
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
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
      ],
    );
  }
}
