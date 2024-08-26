import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/pages/gerenciamento/edicoes/icone_list/icone_list_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_comodidades_model.dart';
export 'edit_comodidades_model.dart';

class EditComodidadesWidget extends StatefulWidget {
  const EditComodidadesWidget({
    super.key,
    required this.listaComodidades,
    required this.refComodidade,
    this.editComodidade,
    bool? novo,
  }) : novo = novo ?? false;

  final List<ComodidadesStruct>? listaComodidades;
  final DocumentReference? refComodidade;
  final ComodidadesStruct? editComodidade;
  final bool novo;

  @override
  State<EditComodidadesWidget> createState() => _EditComodidadesWidgetState();
}

class _EditComodidadesWidgetState extends State<EditComodidadesWidget> {
  late EditComodidadesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditComodidadesModel());

    _model.textNomeTextController ??= TextEditingController(
        text: widget.novo ? '' : widget.editComodidade?.nome);
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
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Comodidades',
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
                      logFirebaseEvent(
                          'EDIT_COMODIDADES_COMP_close_ICN_ON_TAP');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
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
                                'EDIT_COMODIDADES_COMP_imageBorder_ON_TAP');
                            await showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              enableDrag: false,
                              context: context,
                              builder: (context) {
                                return WebViewAware(
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: IconeListWidget(
                                      listaComodidades:
                                          widget.listaComodidades!,
                                      refComodidade: widget.refComodidade!,
                                      editComodidade: widget.editComodidade,
                                      selectedComodidade: (icon) async {
                                        _model.iconName = icon;
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                );
                              },
                            ).then((value) => safeSetState(() {}));
                          },
                          child: Container(
                            width: 44.0,
                            height: 44.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(
                              width: 40.0,
                              height: 40.0,
                              child: custom_widgets.ComodidadeIcon(
                                width: 40.0,
                                height: 40.0,
                                iconName: _model.iconName != ''
                                    ? _model.iconName
                                    : widget.editComodidade!.icon,
                                iconSize: 28.0,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.textNomeTextController,
                              focusNode: _model.textNomeFocusNode,
                              textCapitalization: TextCapitalization.words,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelText: 'Nome da Comodidade',
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
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
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
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              validator: _model.textNomeTextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(width: 12.0)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (!widget.novo)
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
                          fillColor: FlutterFlowTheme.of(context).tertiary,
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.white,
                            size: 28.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent(
                                'EDIT_COMODIDADES_delete_rounded_ICN_ON_T');

                            await widget.refComodidade!.update({
                              ...mapToFirestore(
                                {
                                  'comodidades_geral': FieldValue.arrayRemove([
                                    getComodidadesFirestoreData(
                                      updateComodidadesStruct(
                                        widget.editComodidade,
                                        clearUnsetFields: false,
                                      ),
                                      true,
                                    )
                                  ]),
                                },
                              ),
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_COMODIDADES_COMP_btnSalvar_ON_TAP');
                        if (widget.novo) {
                          await widget.refComodidade!.update({
                            ...mapToFirestore(
                              {
                                'comodidades_geral': FieldValue.arrayUnion([
                                  getComodidadesFirestoreData(
                                    updateComodidadesStruct(
                                      ComodidadesStruct(
                                        id: functions.criarID(widget
                                            .listaComodidades!
                                            .map((e) => e.id)
                                            .toList()),
                                        nome:
                                            _model.textNomeTextController.text,
                                        icon: _model.iconName,
                                      ),
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        } else {
                          _model.editedComodidades = widget.listaComodidades!
                              .toList()
                              .cast<ComodidadesStruct>();
                          setState(() {});
                          _model.removeFromEditedComodidades(
                              widget.editComodidade!);
                          setState(() {});
                          _model.addToEditedComodidades(ComodidadesStruct(
                            id: widget.editComodidade?.id,
                            nome: _model.textNomeTextController.text,
                            icon: _model.iconName,
                          ));
                          setState(() {});

                          await widget.refComodidade!.update({
                            ...mapToFirestore(
                              {
                                'comodidades_geral':
                                    getComodidadesListFirestoreData(
                                  _model.editedComodidades,
                                ),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        }
                      },
                      text: widget.novo ? 'Criar' : 'Editar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).success,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  letterSpacing: 0.0,
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
                        hoverColor: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
