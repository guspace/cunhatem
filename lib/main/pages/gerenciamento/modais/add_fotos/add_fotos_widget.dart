import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_fotos_model.dart';
export 'add_fotos_model.dart';

class AddFotosWidget extends StatefulWidget {
  const AddFotosWidget({
    super.key,
    this.jaIncluidas,
  });

  final List<FotosStruct>? jaIncluidas;

  @override
  State<AddFotosWidget> createState() => _AddFotosWidgetState();
}

class _AddFotosWidgetState extends State<AddFotosWidget> {
  late AddFotosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddFotosModel());

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
                  Text(
                    'Enviar Fotos',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).headlineSmallFamily),
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
                      logFirebaseEvent('ADD_FOTOS_COMP_close_ICN_ON_TAP');
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
                    Text(
                      'Selecione as melhores fotos',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Builder(
                          builder: (context) {
                            final fotos = _model.subirBancodedados.toList();
                            if (fotos.isEmpty) {
                              return Image.asset(
                                'assets/images/picture.png',
                                width: 200.0,
                                height: 200.0,
                              );
                            }

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                              ),
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: fotos.length,
                              itemBuilder: (context, fotosIndex) {
                                final fotosItem = fotos[fotosIndex];
                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        fotosItem.bytes ??
                                            Uint8List.fromList([]),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        alignment: const Alignment(0.0, 0.0),
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          alignment: const Alignment(0.0, 0.0),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(1.0, -1.0),
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
                                                'ADD_FOTOS_COMP_btnDelete_ON_TAP');
                                            _model
                                                .removeAtIndexFromSubirBancodedados(
                                                    fotosIndex);
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 24.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('ADD_FOTOS_COMP_escolherFotos_ON_TAP');
                        if (!isWeb) {
                          await requestPermission(photoLibraryPermission);
                        }
                        final selectedMedia = await selectMedia(
                          maxWidth: 1440.00,
                          maxHeight: 1080.00,
                          imageQuality: 80,
                          includeBlurHash: true,
                          mediaSource: MediaSource.photoGallery,
                          multiImage: true,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading1 = true);
                          var selectedUploadedFiles = <FFUploadedFile>[];

                          try {
                            showUploadMessage(
                              context,
                              'Subindo arquivos...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => FFUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading1 = false;
                          }
                          if (selectedUploadedFiles.length ==
                              selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFiles1 =
                                  selectedUploadedFiles;
                            });
                            showUploadMessage(context, 'Feito!');
                          } else {
                            setState(() {});
                            showUploadMessage(context,
                                'Tivemos um problema ao subir seus arquivos...');
                            return;
                          }
                        }

                        _model.fotosEscolhidas = _model.uploadedLocalFiles1
                            .toList()
                            .cast<FFUploadedFile>();
                        _model.qtd = _model.uploadedLocalFiles1.length;
                        _model.blurHashes = _model.uploadedLocalFiles1
                            .map((e) => e.blurHash)
                            .withoutNulls
                            .toList()
                            .cast<String>();
                        setState(() {});
                        setState(() {
                          _model.isDataUploading1 = false;
                          _model.uploadedLocalFiles1 = [];
                        });

                        while (_model.fotosEscolhidas.isNotEmpty) {
                          _model.addToSubirBancodedados(
                              _model.fotosEscolhidas.first);
                          _model.addToSubirBlurHashes(_model.blurHashes.first);
                          setState(() {});
                          _model.removeAtIndexFromFotosEscolhidas(0);
                          _model.removeAtIndexFromBlurHashes(0);
                          setState(() {});
                        }
                      },
                      text: 'Escolher Fotos',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
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
                  if (_model.subirBancodedados.isNotEmpty)
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'ADD_FOTOS_COMP_confirmarFotos_ON_TAP');
                          {
                            setState(() => _model.isDataUploading2 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedMedia = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Subindo arquivos...',
                                showLoading: true,
                              );
                              selectedUploadedFiles = _model.subirBancodedados;
                              selectedMedia = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
                                isMultiData: true,
                              );
                              downloadUrls = (await Future.wait(
                                selectedMedia.map(
                                  (m) async =>
                                      await uploadData(m.storagePath, m.bytes),
                                ),
                              ))
                                  .where((u) => u != null)
                                  .map((u) => u!)
                                  .toList();
                            } finally {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _model.isDataUploading2 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFiles2 =
                                    selectedUploadedFiles;
                                _model.uploadedFileUrls2 = downloadUrls;
                              });
                              showUploadMessage(context, 'Feito!');
                            } else {
                              setState(() {});
                              showUploadMessage(context,
                                  'Tivemos um problema ao subir seus arquivos...');
                              return;
                            }
                          }

                          _model.fotosURLs =
                              _model.uploadedFileUrls2.toList().cast<String>();
                          _model.qtd = _model.uploadedFileUrls2.length;
                          _model.fotosConfirmadas =
                              widget.jaIncluidas!.toList().cast<FotosStruct>();
                          setState(() {});
                          while (_model.qtd! > _model.qtdUpload) {
                            _model.addToFotosConfirmadas(FotosStruct(
                              image: _model.fotosURLs.first,
                              order: _model.qtdUpload,
                              blurHash: _model.subirBlurHashes.first,
                            ));
                            setState(() {});
                            _model.qtdUpload = _model.qtdUpload + 1;
                            _model.removeAtIndexFromFotosURLs(0);
                            _model.removeAtIndexFromSubirBlurHashes(0);
                            setState(() {});
                          }
                          Navigator.pop(context, _model.fotosConfirmadas);
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
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
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
