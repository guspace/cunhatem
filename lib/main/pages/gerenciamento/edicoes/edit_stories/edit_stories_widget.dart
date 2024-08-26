import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'edit_stories_model.dart';
export 'edit_stories_model.dart';

class EditStoriesWidget extends StatefulWidget {
  const EditStoriesWidget({
    super.key,
    this.editStorie,
    bool? novo,
    required this.refConfiguracao,
    this.storieList,
  }) : novo = novo ?? true;

  final FotosStruct? editStorie;
  final bool novo;
  final DocumentReference? refConfiguracao;
  final List<FotosStruct>? storieList;

  @override
  State<EditStoriesWidget> createState() => _EditStoriesWidgetState();
}

class _EditStoriesWidgetState extends State<EditStoriesWidget> {
  late EditStoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditStoriesModel());

    _model.vinculoLocalTextController ??= TextEditingController(
        text: widget.editStorie?.titulo != null &&
                widget.editStorie?.titulo != ''
            ? widget.editStorie?.titulo
            : '');

    _model.descricaoTextController ??= TextEditingController(
        text: widget.novo ? '' : widget.editStorie?.legenda);
    _model.descricaoFocusNode ??= FocusNode();

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
          color: FlutterFlowTheme.of(context).secondaryBackground,
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
                      'Stories',
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
                      logFirebaseEvent('EDIT_STORIES_COMP_close_ICN_ON_TAP');
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Adicionar Foto',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w600,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
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
                              logFirebaseEvent('EDIT_STORIES_COMP_foto_ON_TAP');
                              final selectedMedia = await selectMedia(
                                maxWidth: 1080.00,
                                maxHeight: 1920.00,
                                imageQuality: 100,
                                includeBlurHash: true,
                                mediaSource: MediaSource.photoGallery,
                                multiImage: false,
                              );
                              if (selectedMedia != null &&
                                  selectedMedia.every((m) => validateFileFormat(
                                      m.storagePath, context))) {
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
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                  _model.isDataUploading1 = false;
                                }
                                if (selectedUploadedFiles.length ==
                                    selectedMedia.length) {
                                  setState(() {
                                    _model.uploadedLocalFile1 =
                                        selectedUploadedFiles.first;
                                  });
                                  showUploadMessage(context, 'Feito!');
                                } else {
                                  setState(() {});
                                  showUploadMessage(context,
                                      'Tivemos um problema ao subir seus arquivos...');
                                  return;
                                }
                              }

                              _model.novaFoto = _model.uploadedLocalFile1;
                              setState(() {});
                              setState(() {
                                _model.isDataUploading1 = false;
                                _model.uploadedLocalFile1 = FFUploadedFile(
                                    bytes: Uint8List.fromList([]));
                              });
                            },
                            child: Container(
                              width: 200.0,
                              height: 400.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.add,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 44.0,
                                    ),
                                  ),
                                  if (valueOrDefault<bool>(
                                    !widget.novo &&
                                        (widget.editStorie?.image != null &&
                                            widget.editStorie?.image != ''),
                                    false,
                                  ))
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: OctoImage(
                                          placeholderBuilder: (_) =>
                                              SizedBox.expand(
                                            child: Image(
                                              image: BlurHashImage(
                                                  widget.editStorie!.blurHash),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          image: NetworkImage(
                                            widget.editStorie!.image,
                                          ),
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  if (valueOrDefault<bool>(
                                    _model.novaFoto != null &&
                                        (_model.novaFoto?.bytes?.isNotEmpty ??
                                            false),
                                    false,
                                  ))
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.memory(
                                        _model.novaFoto?.bytes ??
                                            Uint8List.fromList([]),
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Image.asset(
                                          'assets/images/error_image.png',
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FutureBuilder<List<LocaisRecord>>(
                                future: FFAppState().locais(
                                  uniqueQueryKey: 'stories',
                                  requestFn: () => queryLocaisRecordOnce(
                                    queryBuilder: (locaisRecord) => locaisRecord
                                        .where(
                                          'visivel',
                                          isEqualTo: true,
                                        )
                                        .orderBy('nome'),
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitPulse(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LocaisRecord> containerLocaisRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: const BoxDecoration(),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Autocomplete<String>(
                                        initialValue: TextEditingValue(
                                            text: widget.editStorie?.titulo !=
                                                        null &&
                                                    widget.editStorie
                                                            ?.titulo !=
                                                        ''
                                                ? widget.editStorie!.titulo
                                                : ''),
                                        optionsBuilder: (textEditingValue) {
                                          if (textEditingValue.text == '') {
                                            return const Iterable<
                                                String>.empty();
                                          }
                                          return containerLocaisRecordList
                                              .map((e) => e.nome)
                                              .toList()
                                              .where((option) {
                                            final lowercaseOption =
                                                option.toLowerCase();
                                            return lowercaseOption.contains(
                                                textEditingValue.text
                                                    .toLowerCase());
                                          });
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          return AutocompleteOptionsList(
                                            textFieldKey:
                                                _model.vinculoLocalKey,
                                            textController: _model
                                                .vinculoLocalTextController!,
                                            options: options.toList(),
                                            onSelected: onSelected,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily),
                                                    ),
                                            textHighlightStyle: const TextStyle(),
                                            elevation: 4.0,
                                            optionBackgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            optionHighlightColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            maxHeight: 200.0,
                                          );
                                        },
                                        onSelected: (String selection) {
                                          setState(() => _model
                                                  .vinculoLocalSelectedOption =
                                              selection);
                                          FocusScope.of(context).unfocus();
                                        },
                                        fieldViewBuilder: (
                                          context,
                                          textEditingController,
                                          focusNode,
                                          onEditingComplete,
                                        ) {
                                          _model.vinculoLocalFocusNode =
                                              focusNode;

                                          _model.vinculoLocalTextController =
                                              textEditingController;
                                          return TextFormField(
                                            key: _model.vinculoLocalKey,
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onEditingComplete:
                                                onEditingComplete,
                                            autofocus: false,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText: 'Local Associado',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily),
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(16.0, 16.0,
                                                          16.0, 16.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                            validator: _model
                                                .vinculoLocalTextControllerValidator
                                                .asValidator(context),
                                          );
                                        },
                                      ),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.descricaoTextController,
                                  focusNode: _model.descricaoFocusNode,
                                  autofocus: false,
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.done,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    labelText: 'Descrição',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelMediumFamily),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
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
                                  maxLines: 3,
                                  maxLength: 100,
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  validator: _model
                                      .descricaoTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ].divide(const SizedBox(height: 12.0)),
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
                                'EDIT_STORIES_delete_rounded_ICN_ON_TAP');
                            await FirebaseStorage.instance
                                .refFromURL(widget.editStorie!.image)
                                .delete();

                            await widget.refConfiguracao!.update({
                              ...mapToFirestore(
                                {
                                  'storiesHome': FieldValue.arrayRemove([
                                    getFotosFirestoreData(
                                      updateFotosStruct(
                                        widget.editStorie,
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
                  if (!widget.novo)
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('EDIT_STORIES_COMP_editar_ON_TAP');
                          _model.localstories2 = await queryLocaisRecordOnce(
                            queryBuilder: (locaisRecord) => locaisRecord.where(
                              'nome',
                              isEqualTo: _model.vinculoLocalTextController.text,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.editedStories =
                              widget.storieList!.toList().cast<FotosStruct>();
                          setState(() {});
                          _model.removeFromEditedStories(widget.editStorie!);
                          setState(() {});
                          if (_model.novaFoto != null &&
                              (_model.novaFoto?.bytes?.isNotEmpty ?? false)) {
                            {
                              setState(() => _model.isDataUploading2 = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];
                              var selectedMedia = <SelectedFile>[];
                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles =
                                    _model.novaFoto!.bytes!.isNotEmpty
                                        ? [_model.novaFoto!]
                                        : <FFUploadedFile>[];
                                selectedMedia = selectedFilesFromUploadedFiles(
                                  selectedUploadedFiles,
                                );
                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading2 = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(() {
                                  _model.uploadedLocalFile2 =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl2 = downloadUrls.first;
                                });
                              } else {
                                setState(() {});
                                return;
                              }
                            }

                            await FirebaseStorage.instance
                                .refFromURL(widget.editStorie!.image)
                                .delete();
                            _model.addToEditedStories(FotosStruct(
                              image: _model.uploadedFileUrl2,
                              blurHash: _model.uploadedLocalFile1.blurHash,
                              titulo: valueOrDefault<String>(
                                _model.localstories2?.nome,
                                'Sem nome',
                              ),
                              legenda: _model.descricaoTextController.text,
                              refLocal: _model.localstories2?.reference,
                            ));
                            setState(() {});
                          } else {
                            _model.addToEditedStories(FotosStruct(
                              image: widget.editStorie?.image,
                              blurHash: widget.editStorie?.blurHash,
                              titulo: valueOrDefault<String>(
                                _model.localstories2?.nome,
                                'Sem nome',
                              ),
                              legenda: _model.descricaoTextController.text,
                              refLocal: _model.localstories2?.reference,
                            ));
                            setState(() {});
                          }

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'storiesHome': getFotosListFirestoreData(
                                  _model.editedStories,
                                ),
                              },
                            ),
                          });
                          FFAppState().clearAppConfiguracoesCache();
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Salvar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
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
                  if (widget.novo)
                    Expanded(
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('EDIT_STORIES_COMP_salvar_ON_TAP');
                          {
                            setState(() => _model.isDataUploading3 = true);
                            var selectedUploadedFiles = <FFUploadedFile>[];
                            var selectedMedia = <SelectedFile>[];
                            var downloadUrls = <String>[];
                            try {
                              showUploadMessage(
                                context,
                                'Subindo arquivos...',
                                showLoading: true,
                              );
                              selectedUploadedFiles =
                                  _model.novaFoto!.bytes!.isNotEmpty
                                      ? [_model.novaFoto!]
                                      : <FFUploadedFile>[];
                              selectedMedia = selectedFilesFromUploadedFiles(
                                selectedUploadedFiles,
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
                              _model.isDataUploading3 = false;
                            }
                            if (selectedUploadedFiles.length ==
                                    selectedMedia.length &&
                                downloadUrls.length == selectedMedia.length) {
                              setState(() {
                                _model.uploadedLocalFile3 =
                                    selectedUploadedFiles.first;
                                _model.uploadedFileUrl3 = downloadUrls.first;
                              });
                              showUploadMessage(context, 'Feito!');
                            } else {
                              setState(() {});
                              showUploadMessage(context,
                                  'Tivemos um problema ao subir seus arquivos...');
                              return;
                            }
                          }

                          _model.localstories1 = await queryLocaisRecordOnce(
                            queryBuilder: (locaisRecord) => locaisRecord.where(
                              'nome',
                              isEqualTo: _model.vinculoLocalTextController.text,
                            ),
                            singleRecord: true,
                          ).then((s) => s.firstOrNull);
                          _model.newStorie = FotosStruct(
                            image: _model.uploadedFileUrl3,
                            blurHash: _model.uploadedLocalFile1.blurHash,
                            titulo: valueOrDefault<String>(
                              _model.localstories1?.nome,
                              'Sem nome',
                            ),
                            legenda: _model.descricaoTextController.text,
                            refLocal: _model.localstories1?.reference,
                          );
                          setState(() {});

                          await widget.refConfiguracao!.update({
                            ...mapToFirestore(
                              {
                                'storiesHome': FieldValue.arrayUnion([
                                  getFotosFirestoreData(
                                    updateFotosStruct(
                                      _model.newStorie,
                                      clearUnsetFields: false,
                                    ),
                                    true,
                                  )
                                ]),
                              },
                            ),
                          });
                          FFAppState().clearAppConfiguracoesCache();
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Criar',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
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
