import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/gerenciamento/edicoes/edit_comodidades/edit_comodidades_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lista_comodidades_model.dart';
export 'lista_comodidades_model.dart';

class ListaComodidadesWidget extends StatefulWidget {
  const ListaComodidadesWidget({super.key});

  @override
  State<ListaComodidadesWidget> createState() => _ListaComodidadesWidgetState();
}

class _ListaComodidadesWidgetState extends State<ListaComodidadesWidget> {
  late ListaComodidadesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaComodidadesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listaComodidades'});
    _model.pesquisar1TextController ??= TextEditingController();
    _model.pesquisar1FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppConfiguracoesRecord>>(
      stream: queryAppConfiguracoesRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitPulse(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<AppConfiguracoesRecord>
            listaComodidadesAppConfiguracoesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final listaComodidadesAppConfiguracoesRecord =
            listaComodidadesAppConfiguracoesRecordList.isNotEmpty
                ? listaComodidadesAppConfiguracoesRecordList.first
                : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                actions: const [],
                flexibleSpace: FlexibleSpaceBar(
                  title: SafeArea(
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(-1.0, -1.0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 50.0,
                                buttonSize: 60.0,
                                icon: const Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LISTA_COMODIDADES_chevron_left_ICN_ON_TA');
                                  context.safePop();
                                },
                              ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.appbarTextModel,
                                updateCallback: () => setState(() {}),
                                child: const AppbarTextWidget(
                                  text: 'Comodidades',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0.0,
              ),
            ),
            body: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              controller: _model.pesquisar1TextController,
                              focusNode: _model.pesquisar1FocusNode,
                              onChanged: (_) => EasyDebounce.debounce(
                                '_model.pesquisar1TextController',
                                const Duration(milliseconds: 2000),
                                () => setState(() {}),
                              ),
                              onFieldSubmitted: (_) async {
                                logFirebaseEvent(
                                    'LISTA_COMODIDADES_pesquisar1_ON_TEXTFIEL');
                                safeSetState(() {
                                  _model.simpleSearchResults = TextSearch(
                                          listaComodidadesAppConfiguracoesRecord!
                                              .comodidadesGeral
                                              .map((e) => e.nome)
                                              .toList()
                                              .map((str) =>
                                                  TextSearchItem.fromTerms(
                                                      str, [str]))
                                              .toList())
                                      .search(
                                          _model.pesquisar1TextController.text)
                                      .map((r) => r.object)
                                      .toList();
                                });
                              },
                              autofocus: false,
                              textInputAction: TextInputAction.search,
                              obscureText: false,
                              decoration: InputDecoration(
                                isDense: false,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                hintText: 'Pesquisar...',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .labelMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelMediumFamily),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).error,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
                                suffixIcon: _model.pesquisar1TextController!
                                        .text.isNotEmpty
                                    ? InkWell(
                                        onTap: () async {
                                          _model.pesquisar1TextController
                                              ?.clear();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.clear,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20.0,
                                        ),
                                      )
                                    : null,
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
                              validator: _model
                                  .pesquisar1TextControllerValidator
                                  .asValidator(context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 72.0, 0.0, 0.0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final comodidadesList = (_model.pesquisar1TextController
                                                  .text !=
                                              ''
                                      ? listaComodidadesAppConfiguracoesRecord
                                          ?.comodidadesGeral
                                          .where((e) => valueOrDefault<bool>(
                                                _model.simpleSearchResults
                                                    .contains(e.nome),
                                                false,
                                              ))
                                          .toList()
                                      : listaComodidadesAppConfiguracoesRecord
                                          ?.comodidadesGeral)
                                  ?.toList() ??
                              [];

                          return Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            direction: Axis.horizontal,
                            runAlignment: WrapAlignment.start,
                            verticalDirection: VerticalDirection.down,
                            clipBehavior: Clip.none,
                            children: List.generate(comodidadesList.length,
                                (comodidadesListIndex) {
                              final comodidadesListItem =
                                  comodidadesList[comodidadesListIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LISTA_COMODIDADES_Container_hznva3ew_ON_');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return WebViewAware(
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: EditComodidadesWidget(
                                              listaComodidades:
                                                  listaComodidadesAppConfiguracoesRecord!
                                                      .comodidadesGeral,
                                              refComodidade:
                                                  listaComodidadesAppConfiguracoesRecord
                                                      .reference,
                                              editComodidade:
                                                  comodidadesListItem,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Container(
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    borderRadius: BorderRadius.circular(22.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          width: 20.0,
                                          height: 20.0,
                                          child: custom_widgets.ComodidadeIcon(
                                            width: 20.0,
                                            height: 20.0,
                                            iconName: comodidadesListItem.icon,
                                            iconSize: 20.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          comodidadesListItem.nome,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ].divide(const SizedBox(width: 8.0)),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(1.0, 1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 50.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          logFirebaseEvent(
                              'LISTA_COMODIDADES_PAGE_add_ICN_ON_TAP');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            isDismissible: false,
                            enableDrag: false,
                            useSafeArea: true,
                            context: context,
                            builder: (context) {
                              return WebViewAware(
                                child: GestureDetector(
                                  onTap: () => FocusScope.of(context).unfocus(),
                                  child: Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: SizedBox(
                                      height: double.infinity,
                                      child: EditComodidadesWidget(
                                        listaComodidades:
                                            listaComodidadesAppConfiguracoesRecord!
                                                .comodidadesGeral,
                                        refComodidade:
                                            listaComodidadesAppConfiguracoesRecord
                                                .reference,
                                        novo: true,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
