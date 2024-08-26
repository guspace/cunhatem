import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/pages/gerenciamento/modais/add_fotos/add_fotos_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'edit_fotos_model.dart';
export 'edit_fotos_model.dart';

class EditFotosWidget extends StatefulWidget {
  const EditFotosWidget({
    super.key,
    this.refLocais,
    this.refEvento,
    this.refExperiencia,
    this.listaFotos,
  });

  final DocumentReference? refLocais;
  final DocumentReference? refEvento;
  final DocumentReference? refExperiencia;
  final List<FotosStruct>? listaFotos;

  @override
  State<EditFotosWidget> createState() => _EditFotosWidgetState();
}

class _EditFotosWidgetState extends State<EditFotosWidget> {
  late EditFotosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditFotosModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        children: [
          Builder(
            builder: (context) {
              final fotosUpload = widget.listaFotos?.toList() ?? [];
              if (fotosUpload.isEmpty) {
                return Image.asset(
                  'assets/images/picture.png',
                );
              }

              return ReorderableListView.builder(
                padding: const EdgeInsets.fromLTRB(
                  16.0,
                  0,
                  8.0,
                  0,
                ),
                primary: false,
                scrollDirection: Axis.horizontal,
                itemCount: fotosUpload.length,
                itemBuilder: (context, fotosUploadIndex) {
                  final fotosUploadItem = fotosUpload[fotosUploadIndex];
                  return Container(
                    key: ValueKey("ListView_gpngk3pr" '_' +
                        fotosUploadIndex.toString()),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Container(
                        width: 180.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Stack(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'EDIT_FOTOS_COMP_Image_eb4bbzlr_ON_TAP');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    child: FlutterFlowExpandedImageView(
                                      image: Image.network(
                                        fotosUploadItem.image,
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      allowRotation: true,
                                      tag: fotosUploadItem.image,
                                      useHeroAnimation: true,
                                    ),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: fotosUploadItem.image,
                                transitionOnUserGestures: true,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    fotosUploadItem.image,
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Image.asset(
                                      'assets/images/error_image.png',
                                      width: double.infinity,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 2.0, 2.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  buttonSize: 38.0,
                                  fillColor: const Color(0x6F000000),
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'EDIT_FOTOS_COMP_btnDelete_ON_TAP');
                                    _model.excluirUrl = fotosUploadItem.image;
                                    setState(() {});
                                    if (widget.refLocais != null) {
                                      await widget.refLocais!.update({
                                        ...mapToFirestore(
                                          {
                                            'galeria_fotos':
                                                FieldValue.arrayRemove([
                                              getFotosFirestoreData(
                                                updateFotosStruct(
                                                  fotosUploadItem,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    } else if (widget.refEvento != null) {
                                      await widget.refEvento!.update({
                                        ...mapToFirestore(
                                          {
                                            'galeriaFotos':
                                                FieldValue.arrayRemove([
                                              getFotosFirestoreData(
                                                updateFotosStruct(
                                                  fotosUploadItem,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    } else if (widget.refExperiencia != null) {
                                      await widget.refExperiencia!.update({
                                        ...mapToFirestore(
                                          {
                                            'galeriaFotos':
                                                FieldValue.arrayRemove([
                                              getFotosFirestoreData(
                                                updateFotosStruct(
                                                  fotosUploadItem,
                                                  clearUnsetFields: false,
                                                ),
                                                true,
                                              )
                                            ]),
                                          },
                                        ),
                                      });
                                    } else {
                                      return;
                                    }

                                    await FirebaseStorage.instance
                                        .refFromURL(_model.excluirUrl!)
                                        .delete();
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                onReorder:
                    (int reorderableOldIndex, int reorderableNewIndex) async {
                  logFirebaseEvent('EDIT_FOTOS_ListView_gpngk3pr_ON_REORDER');
                  _model.galeriaReordenada = await actions.reorderGaleria(
                    widget.listaFotos!.toList(),
                    reorderableOldIndex,
                    reorderableNewIndex,
                  );
                  if (widget.refLocais != null) {
                    await widget.refLocais!.update({
                      ...mapToFirestore(
                        {
                          'galeria_fotos': getFotosListFirestoreData(
                            _model.galeriaReordenada,
                          ),
                        },
                      ),
                    });
                  } else if (widget.refEvento != null) {
                    await widget.refEvento!.update({
                      ...mapToFirestore(
                        {
                          'galeriaFotos': getFotosListFirestoreData(
                            _model.galeriaReordenada,
                          ),
                        },
                      ),
                    });
                  } else if (widget.refExperiencia != null) {
                    await widget.refExperiencia!.update({
                      ...mapToFirestore(
                        {
                          'galeriaFotos': getFotosListFirestoreData(
                            _model.galeriaReordenada,
                          ),
                        },
                      ),
                    });
                  }

                  setState(() {});
                },
              );
            },
          ),
          Align(
            alignment: const AlignmentDirectional(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 8.0),
              child: FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('EDIT_FOTOS_COMP_adicionarFotos_ON_TAP');
                  if (widget.refLocais != null) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddFotosWidget(
                              jaIncluidas: widget.listaFotos,
                            ),
                          ),
                        );
                      },
                    ).then((value) =>
                        safeSetState(() => _model.fotosSubir = value));

                    await widget.refLocais!.update({
                      ...mapToFirestore(
                        {
                          'galeria_fotos': getFotosListFirestoreData(
                            _model.fotosSubir,
                          ),
                        },
                      ),
                    });
                  } else if (widget.refEvento != null) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddFotosWidget(
                              jaIncluidas: widget.listaFotos,
                            ),
                          ),
                        );
                      },
                    ).then((value) =>
                        safeSetState(() => _model.fotosEvento = value));

                    await widget.refEvento!.update({
                      ...mapToFirestore(
                        {
                          'galeriaFotos': getFotosListFirestoreData(
                            _model.fotosEvento,
                          ),
                        },
                      ),
                    });
                  } else if (widget.refExperiencia != null) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return WebViewAware(
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: AddFotosWidget(
                              jaIncluidas: widget.listaFotos,
                            ),
                          ),
                        );
                      },
                    ).then((value) =>
                        safeSetState(() => _model.fotosExperiencia = value));

                    await widget.refExperiencia!.update({
                      ...mapToFirestore(
                        {
                          'galeriaFotos': getFotosListFirestoreData(
                            _model.fotosExperiencia,
                          ),
                        },
                      ),
                    });
                  }

                  HapticFeedback.lightImpact();

                  setState(() {});
                },
                text: 'Nova Foto',
                icon: const Icon(
                  Icons.add,
                  size: 16.0,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                showLoadingIndicator: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
