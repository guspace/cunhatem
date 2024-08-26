import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/pages/gerenciamento/edicoes/edit_comodidades/edit_comodidades_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'comodidades_edit_model.dart';
export 'comodidades_edit_model.dart';

class ComodidadesEditWidget extends StatefulWidget {
  const ComodidadesEditWidget({
    super.key,
    this.jaSelecionados,
  });

  final List<ComodidadesStruct>? jaSelecionados;

  @override
  State<ComodidadesEditWidget> createState() => _ComodidadesEditWidgetState();
}

class _ComodidadesEditWidgetState extends State<ComodidadesEditWidget> {
  late ComodidadesEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ComodidadesEditModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('COMODIDADES_EDIT_comodidadesEdit_ON_INIT');
      _model.comodidadesSelecionadas =
          widget.jaSelecionados!.toList().cast<ComodidadesStruct>();
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: StreamBuilder<List<AppConfiguracoesRecord>>(
        stream: queryAppConfiguracoesRecord(
          singleRecord: true,
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
          List<AppConfiguracoesRecord> containerAppConfiguracoesRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerAppConfiguracoesRecord =
              containerAppConfiguracoesRecordList.isNotEmpty
                  ? containerAppConfiguracoesRecordList.first
                  : null;

          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(22.0),
                topRight: Radius.circular(22.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Comodidades do Local',
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .headlineSmallFamily),
                                ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.close,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'COMODIDADES_EDIT_COMP_close_ICN_ON_TAP');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Text(
                          'Selecione as comodidades que o local oferece.',
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            final comodidades = containerAppConfiguracoesRecord
                                    ?.comodidadesGeral
                                    .toList() ??
                                [];

                            return Wrap(
                              spacing: 8.0,
                              runSpacing: 10.0,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: List.generate(comodidades.length,
                                  (comodidadesIndex) {
                                final comodidadesItem =
                                    comodidades[comodidadesIndex];
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    logFirebaseEvent(
                                        'COMODIDADES_EDIT_COMP_btnDif_ON_TAP');
                                    if (_model.comodidadesSelecionadas
                                            .contains(comodidadesItem) ==
                                        true) {
                                      _model.removeFromComodidadesSelecionadas(
                                          comodidadesItem);
                                      setState(() {});
                                    } else {
                                      _model.addToComodidadesSelecionadas(
                                          comodidadesItem);
                                      setState(() {});
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                    height: 38.0,
                                    constraints: const BoxConstraints(
                                      minWidth: 80.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _model.comodidadesSelecionadas
                                                  .contains(comodidadesItem) ==
                                              true
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      borderRadius: BorderRadius.circular(18.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.wifi,
                                            color: Colors.white,
                                            size: 18.0,
                                          ),
                                          Text(
                                            comodidadesItem.nome,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 4.0)),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 12.0))
                        .addToStart(const SizedBox(height: 12.0))
                        .addToEnd(const SizedBox(height: 20.0)),
                  ),
                ),
                SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: const CircleBorder(),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 60.0,
                                buttonSize: 50.0,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 28.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'COMODIDADES_EDIT_COMP_add_ICN_ON_TAP');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    useSafeArea: true,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: EditComodidadesWidget(
                                            refComodidade:
                                                containerAppConfiguracoesRecord!
                                                    .reference,
                                            listaComodidades:
                                                containerAppConfiguracoesRecord
                                                    .comodidadesGeral,
                                            novo: true,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'COMODIDADES_EDIT_buttonSalvar_ON_TAP');
                                Navigator.pop(
                                    context, _model.comodidadesSelecionadas);
                              },
                              text: 'Confirmar',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 50.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).success,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .titleMediumFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily),
                                    ),
                                elevation: 4.0,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(50.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(width: 10.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
