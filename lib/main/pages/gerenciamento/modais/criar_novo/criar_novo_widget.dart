import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'criar_novo_model.dart';
export 'criar_novo_model.dart';

class CriarNovoWidget extends StatefulWidget {
  const CriarNovoWidget({
    super.key,
    required this.tipoGerenciar,
  });

  final TipoGerenciar? tipoGerenciar;

  @override
  State<CriarNovoWidget> createState() => _CriarNovoWidgetState();
}

class _CriarNovoWidgetState extends State<CriarNovoWidget> {
  late CriarNovoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CriarNovoModel());

    _model.textNomeTextController ??= TextEditingController();
    _model.textNomeFocusNode ??= FocusNode();

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
      child: Container(
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
                  Expanded(
                    child: Text(
                      () {
                        if (widget.tipoGerenciar == TipoGerenciar.local) {
                          return 'Novo Local';
                        } else if (widget.tipoGerenciar ==
                            TipoGerenciar.experiencia) {
                          return 'Nova Experiência';
                        } else if (widget.tipoGerenciar ==
                            TipoGerenciar.evento) {
                          return 'Novo Evento';
                        } else {
                          return 'Novo';
                        }
                      }(),
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineSmallFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineSmallFamily),
                              ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 50.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('CRIAR_NOVO_COMP_close_ICN_ON_TAP');
                      HapticFeedback.lightImpact();
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
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.textNomeTextController,
                            focusNode: _model.textNomeFocusNode,
                            autofocus: true,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelText: 'Nome',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              alignLabelWithHint: false,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 20.0, 16.0, 20.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                            validator: _model.textNomeTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(height: 12.0))
                    .addToEnd(const SizedBox(height: 20.0)),
              ),
            ),
            SafeArea(
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CRIAR_NOVO_COMP_buttonCancelar_ON_TAP');
                            HapticFeedback.lightImpact();
                            Navigator.pop(context);
                          },
                          text: 'Cancelar',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).tertiary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
                      Expanded(
                        flex: 2,
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'CRIAR_NOVO_COMP_buttonComecar_ON_TAP');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            _model.randomID = random_data.randomString(
                              8,
                              8,
                              false,
                              false,
                              true,
                            );
                            setState(() {});
                            if (widget.tipoGerenciar == TipoGerenciar.local) {
                              var locaisRecordReference =
                                  LocaisRecord.collection.doc(_model.randomID!);
                              await locaisRecordReference.set({
                                ...createLocaisRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  criadoPor: currentUserReference,
                                  lixeira: false,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.localCriar =
                                  LocaisRecord.getDocumentFromData({
                                ...createLocaisRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  criadoPor: currentUserReference,
                                  lixeira: false,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': DateTime.now(),
                                  },
                                ),
                              }, locaisRecordReference);

                              context.pushNamed(
                                'localEdit',
                                queryParameters: {
                                  'refLocal': serializeParam(
                                    _model.localCriar?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'novo': serializeParam(
                                    true,
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
                            } else if (widget.tipoGerenciar ==
                                TipoGerenciar.evento) {
                              var eventosRecordReference = EventosRecord
                                  .collection
                                  .doc(_model.randomID!);
                              await eventosRecordReference.set({
                                ...createEventosRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  criadoPor: currentUserReference,
                                  lixeira: false,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.eventoCriar =
                                  EventosRecord.getDocumentFromData({
                                ...createEventosRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  criadoPor: currentUserReference,
                                  lixeira: false,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': DateTime.now(),
                                  },
                                ),
                              }, eventosRecordReference);

                              context.pushNamed(
                                'eventoEdit',
                                queryParameters: {
                                  'refEvento': serializeParam(
                                    _model.eventoCriar?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'novo': serializeParam(
                                    true,
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
                            } else if (widget.tipoGerenciar ==
                                TipoGerenciar.experiencia) {
                              var experienciasRecordReference =
                                  ExperienciasRecord.collection
                                      .doc(_model.randomID!);
                              await experienciasRecordReference.set({
                                ...createExperienciasRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  lixeira: false,
                                  criadoPor: currentUserReference,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': FieldValue.serverTimestamp(),
                                  },
                                ),
                              });
                              _model.experienciaCriar =
                                  ExperienciasRecord.getDocumentFromData({
                                ...createExperienciasRecordData(
                                  nome: _model.textNomeTextController.text,
                                  visivel: true,
                                  lixeira: false,
                                  criadoPor: currentUserReference,
                                  id: _model.randomID,
                                ),
                                ...mapToFirestore(
                                  {
                                    'criado_em': DateTime.now(),
                                  },
                                ),
                              }, experienciasRecordReference);

                              context.pushNamed(
                                'experienciaEdit',
                                queryParameters: {
                                  'refExperiencia': serializeParam(
                                    _model.experienciaCriar?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                  'novo': serializeParam(
                                    true,
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
                            }

                            Navigator.pop(context);

                            setState(() {});
                          },
                          text: 'Criar',
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
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
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
      ),
    );
  }
}
