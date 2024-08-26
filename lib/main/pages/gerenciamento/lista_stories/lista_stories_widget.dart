import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/gerenciamento/edicoes/edit_stories/edit_stories_widget.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lista_stories_model.dart';
export 'lista_stories_model.dart';

class ListaStoriesWidget extends StatefulWidget {
  const ListaStoriesWidget({super.key});

  @override
  State<ListaStoriesWidget> createState() => _ListaStoriesWidgetState();
}

class _ListaStoriesWidgetState extends State<ListaStoriesWidget> {
  late ListaStoriesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaStoriesModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listaStories'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AppConfiguracoesRecord>>(
      future: queryAppConfiguracoesRecordOnce(
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
        List<AppConfiguracoesRecord> listaStoriesAppConfiguracoesRecordList =
            snapshot.data!;
        final listaStoriesAppConfiguracoesRecord =
            listaStoriesAppConfiguracoesRecordList.isNotEmpty
                ? listaStoriesAppConfiguracoesRecordList.first
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
                                      'LISTA_STORIES_chevron_left_ICN_ON_TAP');
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
                                  text: 'Stories',
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
            body: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) {
                      final storiesLista = listaStoriesAppConfiguracoesRecord
                              ?.storiesHome
                              .toList() ??
                          [];

                      return ReorderableListView.builder(
                        padding: const EdgeInsets.fromLTRB(
                          0,
                          12.0,
                          0,
                          120.0,
                        ),
                        scrollDirection: Axis.vertical,
                        itemCount: storiesLista.length,
                        itemBuilder: (context, storiesListaIndex) {
                          final storiesListaItem =
                              storiesLista[storiesListaIndex];
                          return Container(
                            key: ValueKey("ListView_f0f2nkz3" '_' +
                                storiesListaIndex.toString()),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 12.0),
                              child: Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  minHeight: 48.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      6.0, 4.0, 6.0, 4.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          valueOrDefault<String>(
                                            storiesListaItem.titulo,
                                            'Sem titulo',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLargeFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyLargeFamily),
                                              ),
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'LISTA_STORIES_PAGE_edit_ICN_ON_TAP');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (context) {
                                              return WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .unfocus(),
                                                  child: Padding(
                                                    padding:
                                                        MediaQuery.viewInsetsOf(
                                                            context),
                                                    child: EditStoriesWidget(
                                                      editStorie:
                                                          storiesListaItem,
                                                      novo: false,
                                                      refConfiguracao:
                                                          listaStoriesAppConfiguracoesRecord!
                                                              .reference,
                                                      storieList:
                                                          listaStoriesAppConfiguracoesRecord
                                                              .storiesHome,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onReorder: (int reorderableOldIndex,
                            int reorderableNewIndex) async {},
                      );
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1.0, 1.0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 30.0),
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
                              'LISTA_STORIES_iconAddCategoria_ON_TAP');
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
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
                                      child: EditStoriesWidget(
                                        novo: true,
                                        refConfiguracao:
                                            listaStoriesAppConfiguracoesRecord!
                                                .reference,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
