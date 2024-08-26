import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_categoria_model.dart';
export 'edit_categoria_model.dart';

class EditCategoriaWidget extends StatefulWidget {
  const EditCategoriaWidget({
    super.key,
    this.subEdit,
    this.subCategorias,
    required this.refConfiguracao,
    this.catEdit,
    this.categorias,
    String? novoCat,
    this.catSub,
    this.qtdCategorias,
    this.qtdSubs,
  }) : novoCat = novoCat ?? 'cat';

  final SubCategoriasStruct? subEdit;
  final List<SubCategoriasStruct>? subCategorias;
  final DocumentReference? refConfiguracao;
  final CategoriasStruct? catEdit;
  final List<CategoriasStruct>? categorias;
  final String novoCat;
  final CategoriasStruct? catSub;
  final int? qtdCategorias;
  final int? qtdSubs;

  @override
  State<EditCategoriaWidget> createState() => _EditCategoriaWidgetState();
}

class _EditCategoriaWidgetState extends State<EditCategoriaWidget> {
  late EditCategoriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditCategoriaModel());

    _model.textNomeTextController ??= TextEditingController(
        text: widget.catEdit != null
            ? widget.catEdit?.nome
            : widget.subEdit?.nome);
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
                        if (widget.subEdit != null) {
                          return 'Editar Sub-Categoria';
                        } else if (widget.catEdit != null) {
                          return 'Editar Categoria';
                        } else if (widget.novoCat == 'cat') {
                          return 'Nova Categoria';
                        } else {
                          return 'Nova Sub-Categoria';
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
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      logFirebaseEvent('EDIT_CATEGORIA_COMP_close_ICN_ON_TAP');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        controller: _model.textNomeTextController,
                        focusNode: _model.textNomeFocusNode,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          isDense: false,
                          labelText: 'Nome da Categoria',
                          labelStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          alignLabelWithHint: true,
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
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 20.0, 16.0, 20.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        validator: _model.textNomeTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    if (valueOrDefault<bool>(
                      valueOrDefault<bool>(
                            widget.subEdit != null,
                            false,
                          ) ||
                          valueOrDefault<bool>(
                            widget.novoCat == 'sub',
                            false,
                          ),
                      false,
                    ))
                      FlutterFlowDropDown<String>(
                        controller: _model.dropCategoriaValueController ??=
                            FormFieldController<String>(
                          _model.dropCategoriaValue ??= widget.subEdit != null
                              ? widget.categorias
                                  ?.where((e) =>
                                      widget.subEdit?.refCategoria == e.id)
                                  .toList()
                                  .first
                                  .id
                              : widget.categorias
                                  ?.where((e) => widget.catSub?.id == e.id)
                                  .toList()
                                  .first
                                  .id,
                        ),
                        options: List<String>.from(
                            widget.categorias!.map((e) => e.id).toList()),
                        optionLabels:
                            widget.categorias!.map((e) => e.nome).toList(),
                        onChanged: (val) =>
                            setState(() => _model.dropCategoriaValue = val),
                        width: double.infinity,
                        textStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                        hintText: 'Selecione...',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 14.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 8.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                        labelText: '',
                        labelTextStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelMediumFamily),
                                ),
                      ),
                  ]
                      .divide(const SizedBox(height: 12.0))
                      .addToStart(const SizedBox(height: 12.0))
                      .addToEnd(const SizedBox(height: 20.0)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (valueOrDefault<bool>(
                        widget.subEdit != null,
                        false,
                      ) ||
                      valueOrDefault<bool>(
                        widget.catEdit != null,
                        false,
                      ))
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
                                'EDIT_CATEGORIA_delete_rounded_ICN_ON_TAP');
                            if (widget.subEdit != null) {
                              _model.subCategoriasEdited = widget
                                  .subCategorias!
                                  .toList()
                                  .cast<SubCategoriasStruct>();
                              setState(() {});
                              _model.removeFromSubCategoriasEdited(
                                  widget.subEdit!);
                              setState(() {});
                              _model
                                  .addToSubCategoriasEdited(SubCategoriasStruct(
                                id: widget.subEdit?.id,
                                nome: _model.textNomeTextController.text,
                                refCategoria: _model.dropCategoriaValue,
                                order: widget.subEdit?.order,
                                arquivado: valueOrDefault<bool>(
                                  widget.subEdit?.arquivado,
                                  false,
                                ),
                              ));
                              setState(() {});

                              await widget.refConfiguracao!.update({
                                ...mapToFirestore(
                                  {
                                    'subCategorias': FieldValue.arrayRemove([
                                      getSubCategoriasFirestoreData(
                                        updateSubCategoriasStruct(
                                          widget.subEdit,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              Navigator.pop(context);
                            } else if (widget.catEdit != null) {
                              _model.categoriasEdited = widget.categorias!
                                  .toList()
                                  .cast<CategoriasStruct>();
                              setState(() {});
                              _model
                                  .removeFromCategoriasEdited(widget.catEdit!);
                              setState(() {});
                              _model.addToCategoriasEdited(CategoriasStruct(
                                id: widget.catEdit?.id,
                                nome: _model.textNomeTextController.text,
                                order: widget.catEdit?.order,
                                arquivado: valueOrDefault<bool>(
                                  widget.catEdit?.arquivado,
                                  false,
                                ),
                              ));
                              setState(() {});

                              await widget.refConfiguracao!.update({
                                ...mapToFirestore(
                                  {
                                    'categorias': FieldValue.arrayRemove([
                                      getCategoriasFirestoreData(
                                        updateCategoriasStruct(
                                          widget.catEdit,
                                          clearUnsetFields: false,
                                        ),
                                        true,
                                      )
                                    ]),
                                  },
                                ),
                              });
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent(
                            'EDIT_CATEGORIA_COMP_CRIAR_BTN_ON_TAP');
                        if (widget.subEdit != null) {
                          _model.subCategoriasEdited = widget.subCategorias!
                              .toList()
                              .cast<SubCategoriasStruct>();
                          setState(() {});
                          _model
                              .removeFromSubCategoriasEdited(widget.subEdit!);
                          setState(() {});
                          if (widget.subEdit?.refCategoria ==
                              _model.dropCategoriaValue) {
                            _model.addToSubCategoriasEdited(SubCategoriasStruct(
                              id: widget.subEdit?.id,
                              nome: _model.textNomeTextController.text,
                              refCategoria: _model.dropCategoriaValue,
                              order: widget.subEdit?.order,
                            ));
                            setState(() {});
                          } else {
                            _model.addToSubCategoriasEdited(SubCategoriasStruct(
                              id: widget.subEdit?.id,
                              nome: _model.textNomeTextController.text,
                              refCategoria: _model.dropCategoriaValue,
                              order: widget.subCategorias
                                  ?.where((e) =>
                                      _model.dropCategoriaValue ==
                                      e.refCategoria)
                                  .toList()
                                  .length,
                            ));
                            setState(() {});
                          }

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'subCategorias':
                                    getSubCategoriasListFirestoreData(
                                  _model.subCategoriasEdited,
                                ),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        } else if (widget.catEdit != null) {
                          _model.categoriasEdited = widget.categorias!
                              .toList()
                              .cast<CategoriasStruct>();
                          _model.qtd = widget.categorias?.length;
                          setState(() {});
                          _model.removeFromCategoriasEdited(widget.catEdit!);
                          setState(() {});
                          _model.addToCategoriasEdited(CategoriasStruct(
                            id: widget.catEdit?.id,
                            nome: _model.textNomeTextController.text,
                            order: widget.catEdit?.order,
                          ));
                          setState(() {});

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'categorias': getCategoriasListFirestoreData(
                                  _model.categoriasEdited,
                                ),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        } else if (widget.novoCat == 'cat') {
                          _model.qtd = widget.categorias?.length;
                          setState(() {});

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'categorias': FieldValue.arrayUnion([
                                  getCategoriasFirestoreData(
                                    createCategoriasStruct(
                                      id: functions.criarID(widget.categorias!
                                          .map((e) => e.id)
                                          .toList()),
                                      nome: _model.textNomeTextController.text,
                                      order: widget.qtdCategorias,
                                      arquivado: false,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        } else if (widget.novoCat == 'sub') {
                          _model.qtd = widget.subCategorias?.length;
                          setState(() {});

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'subCategorias': FieldValue.arrayUnion([
                                  getSubCategoriasFirestoreData(
                                    createSubCategoriasStruct(
                                      id: functions.criarID(widget
                                          .subCategorias!
                                          .map((e) => e.id)
                                          .toList()),
                                      nome: _model.textNomeTextController.text,
                                      refCategoria: _model.dropCategoriaValue,
                                      order: widget.qtdSubs,
                                      arquivado: false,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                          Navigator.pop(context);
                        }
                      },
                      text: widget.subEdit != null ? 'Editar' : 'Criar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
