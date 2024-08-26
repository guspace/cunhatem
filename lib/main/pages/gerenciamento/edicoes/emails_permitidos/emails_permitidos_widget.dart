import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/empty_list/empty_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'emails_permitidos_model.dart';
export 'emails_permitidos_model.dart';

class EmailsPermitidosWidget extends StatefulWidget {
  const EmailsPermitidosWidget({
    super.key,
    this.userEdit,
  });

  final UsersRecord? userEdit;

  @override
  State<EmailsPermitidosWidget> createState() => _EmailsPermitidosWidgetState();
}

class _EmailsPermitidosWidgetState extends State<EmailsPermitidosWidget> {
  late EmailsPermitidosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailsPermitidosModel());

    _model.textEmailTextController ??=
        TextEditingController(text: widget.userEdit?.email);
    _model.textEmailFocusNode ??= FocusNode();

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
      child: FutureBuilder<List<AppConfiguracoesRecord>>(
        future: FFAppState().appConfiguracoes(
          uniqueQueryKey: 'addemails',
          requestFn: () => queryAppConfiguracoesRecordOnce(
            singleRecord: true,
          ).then((result) {
            try {
              _model.firestoreRequestCompleted = true;
              _model.firestoreRequestLastUniqueKey = 'addemails';
            } finally {}
            return result;
          }),
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
            child: SafeArea(
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 8.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'E-mails Admin',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineSmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
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
                              logFirebaseEvent(
                                  'EMAILS_PERMITIDOS_COMP_close_ICN_ON_TAP');
                              Navigator.pop(context);
                              HapticFeedback.lightImpact();
                            },
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cadastros no aplicativo só serão permitidos se o e-mail estiver inserido aqui corretamente.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelLargeFamily),
                                        ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 20.0),
                                    child: Builder(
                                      builder: (context) {
                                        final emaisPermitidos =
                                            containerAppConfiguracoesRecord
                                                    ?.adminEmails
                                                    .toList() ??
                                                [];
                                        if (emaisPermitidos.isEmpty) {
                                          return const Center(
                                            child: SizedBox(
                                              width: 100.0,
                                              child: EmptyListWidget(
                                                texto: 'Sem e-mails',
                                              ),
                                            ),
                                          );
                                        }

                                        return ListView.builder(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: emaisPermitidos.length,
                                          itemBuilder:
                                              (context, emaisPermitidosIndex) {
                                            final emaisPermitidosItem =
                                                emaisPermitidos[
                                                    emaisPermitidosIndex];
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    emaisPermitidosItem,
                                                    '?',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyLargeFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyLargeFamily),
                                                      ),
                                                ),
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 34.0,
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    size: 16.0,
                                                  ),
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'EMAILS_PERMITIDOS_COMP_btnDelete_ON_TAP');

                                                    await containerAppConfiguracoesRecord!
                                                        .reference
                                                        .update({
                                                      ...mapToFirestore(
                                                        {
                                                          'admin_emails':
                                                              FieldValue
                                                                  .arrayRemove([
                                                            emaisPermitidosItem
                                                          ]),
                                                        },
                                                      ),
                                                    });
                                                    FFAppState()
                                                        .clearAppConfiguracoesCacheKey(
                                                            'addemails');
                                                    setState(() {
                                                      FFAppState()
                                                          .clearAppConfiguracoesCacheKey(
                                                              _model
                                                                  .firestoreRequestLastUniqueKey);
                                                      _model.firestoreRequestCompleted =
                                                          false;
                                                    });
                                                    await _model
                                                        .waitForFirestoreRequestCompleted();
                                                    HapticFeedback
                                                        .lightImpact();
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title: const Text(
                                                                'E-mail retirado!'),
                                                            content: const Text(
                                                                'Caso ainda não tenha realizado o cadastro, este e-mail será recusado quando tentar se cadastrar.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    const Text('Ok'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: _model.formKey,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          child: TextFormField(
                                            controller:
                                                _model.textEmailTextController,
                                            focusNode:
                                                _model.textEmailFocusNode,
                                            autofillHints: const [
                                              AutofillHints.email
                                            ],
                                            textCapitalization:
                                                TextCapitalization.words,
                                            textInputAction:
                                                TextInputAction.next,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelText: 'E-mail',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                              alignLabelWithHint: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(14.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
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
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            validator: _model
                                                .textEmailTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 40.0,
                                        borderWidth: 1.0,
                                        buttonSize: 48.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        icon: Icon(
                                          Icons.add,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'EMAILS_PERMITIDOS_btnAddEmail_ON_TAP');
                                          if (_model.formKey.currentState ==
                                                  null ||
                                              !_model.formKey.currentState!
                                                  .validate()) {
                                            return;
                                          }

                                          await containerAppConfiguracoesRecord!
                                              .reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'admin_emails':
                                                    FieldValue.arrayUnion([
                                                  _model.textEmailTextController
                                                      .text
                                                ]),
                                              },
                                            ),
                                          });
                                          FFAppState()
                                              .clearAppConfiguracoesCacheKey(
                                                  'addemails');
                                          setState(() {
                                            FFAppState()
                                                .clearAppConfiguracoesCacheKey(
                                                    _model
                                                        .firestoreRequestLastUniqueKey);
                                            _model.firestoreRequestCompleted =
                                                false;
                                          });
                                          await _model
                                              .waitForFirestoreRequestCompleted();
                                          setState(() {
                                            _model.textEmailTextController
                                                    ?.text =
                                                widget.userEdit!.email;
                                          });
                                          HapticFeedback.lightImpact();
                                        },
                                      ),
                                    ].divide(const SizedBox(width: 12.0)),
                                  ),
                                ].divide(const SizedBox(height: 12.0)),
                              ),
                            ),
                          ]
                              .addToStart(const SizedBox(height: 12.0))
                              .addToEnd(const SizedBox(height: 20.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
