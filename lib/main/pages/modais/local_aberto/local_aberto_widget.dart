import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'local_aberto_model.dart';
export 'local_aberto_model.dart';

class LocalAbertoWidget extends StatefulWidget {
  const LocalAbertoWidget({
    super.key,
    String? abre,
    String? fecha,
    bool? aberto24h,
    String? tipo,
  })  : abre = abre ?? '00:00',
        fecha = fecha ?? '00:00',
        aberto24h = aberto24h ?? false,
        tipo = tipo ?? 'card';

  final String abre;
  final String fecha;
  final bool aberto24h;
  final String tipo;

  @override
  State<LocalAbertoWidget> createState() => _LocalAbertoWidgetState();
}

class _LocalAbertoWidgetState extends State<LocalAbertoWidget> {
  late LocalAbertoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalAbertoModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (valueOrDefault<bool>(
          valueOrDefault<String>(
                functions.localAberto(
                    getCurrentTimestamp,
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.abre,
                      '00:00',
                    ),
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.fecha,
                      '00:00',
                    ),
                    valueOrDefault<bool>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.aberto24h
                          : widget.aberto24h,
                      false,
                    )),
                'no data',
              ) ==
              'aberto',
          false,
        )) {
          return Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_sharp,
                  color: FlutterFlowTheme.of(context).secondary,
                  size: valueOrDefault<double>(
                    widget.tipo == 'page' ? 16.0 : 12.0,
                    12.0,
                  ),
                ),
                Text(
                  'Aberto',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).secondary,
                        fontSize: valueOrDefault<double>(
                          widget.tipo == 'page' ? 14.0 : 10.0,
                          10.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          );
        } else if (valueOrDefault<bool>(
          valueOrDefault<String>(
                functions.localAberto(
                    getCurrentTimestamp,
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.abre,
                      '00:00',
                    ),
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.fecha,
                      '00:00',
                    ),
                    valueOrDefault<bool>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.aberto24h
                          : widget.aberto24h,
                      false,
                    )),
                'no data',
              ) ==
              'fechado',
          false,
        )) {
          return Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_sharp,
                  color: FlutterFlowTheme.of(context).tertiary,
                  size: valueOrDefault<double>(
                    widget.tipo == 'page' ? 16.0 : 12.0,
                    12.0,
                  ),
                ),
                Text(
                  'Fechado',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: valueOrDefault<double>(
                          widget.tipo == 'page' ? 14.0 : 10.0,
                          19.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          );
        } else if (valueOrDefault<bool>(
          valueOrDefault<String>(
                functions.localAberto(
                    getCurrentTimestamp,
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.abre,
                      '00:00',
                    ),
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.fecha,
                      '00:00',
                    ),
                    valueOrDefault<bool>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.aberto24h
                          : widget.aberto24h,
                      false,
                    )),
                'no data',
              ) ==
              'abrindo',
          false,
        )) {
          return Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_sharp,
                  color: const Color(0x8000B900),
                  size: valueOrDefault<double>(
                    widget.tipo == 'page' ? 16.0 : 12.0,
                    12.0,
                  ),
                ),
                Text(
                  'Abre em breve',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: const Color(0x8000B900),
                        fontSize: valueOrDefault<double>(
                          widget.tipo == 'page' ? 14.0 : 10.0,
                          10.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          );
        } else if (valueOrDefault<bool>(
          valueOrDefault<String>(
                functions.localAberto(
                    getCurrentTimestamp,
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.abre,
                      '00:00',
                    ),
                    valueOrDefault<String>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.abre
                          : widget.fecha,
                      '00:00',
                    ),
                    valueOrDefault<bool>(
                      dateTimeFormat(
                                "E",
                                getCurrentTimestamp,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ) ==
                              '1'
                          ? widget.aberto24h
                          : widget.aberto24h,
                      false,
                    )),
                'no data',
              ) ==
              'fechando',
          false,
        )) {
          return Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.access_time_sharp,
                  color: const Color(0xFFFD7E14),
                  size: valueOrDefault<double>(
                    widget.tipo == 'page' ? 16.0 : 12.0,
                    12.0,
                  ),
                ),
                Text(
                  'Fecha em breve',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: const Color(0xFFFD7E14),
                        fontSize: valueOrDefault<double>(
                          widget.tipo == 'page' ? 14.0 : 10.0,
                          10.0,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ].divide(const SizedBox(width: 4.0)),
            ),
          );
        } else {
          return Container(
            decoration: const BoxDecoration(),
          );
        }
      },
    );
  }
}
