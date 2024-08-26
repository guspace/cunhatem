import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_experiencia2/card_experiencia2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'lista_experiencia_model.dart';
export 'lista_experiencia_model.dart';

class ListaExperienciaWidget extends StatefulWidget {
  const ListaExperienciaWidget({super.key});

  @override
  State<ListaExperienciaWidget> createState() => _ListaExperienciaWidgetState();
}

class _ListaExperienciaWidgetState extends State<ListaExperienciaWidget> {
  late ListaExperienciaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListaExperienciaModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'listaExperiencia'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              expandedHeight: 90.0,
              pinned: true,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              actions: const [],
              flexibleSpace: FlexibleSpaceBar(
                title: SafeArea(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.appbarTextModel,
                            updateCallback: () => setState(() {}),
                            child: const AppbarTextWidget(
                              text: 'Experiências',
                            ),
                          ),
                        ),
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
                                  'LISTA_EXPERIENCIA_chevron_left_ICN_ON_TA');
                              context.safePop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return FutureBuilder<List<ExperienciasRecord>>(
                future: FFAppState().experiencias(
                  uniqueQueryKey: 'listaExperiencia',
                  requestFn: () => queryExperienciasRecordOnce(
                    queryBuilder: (experienciasRecord) => experienciasRecord
                        .where(
                          'lixeira',
                          isEqualTo: false,
                        )
                        .where(
                          'visivel',
                          isEqualTo: true,
                        ),
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
                          color: FlutterFlowTheme.of(context).primary,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<ExperienciasRecord> containerExperienciasRecordList =
                      snapshot.data!;

                  return Container(
                    decoration: const BoxDecoration(),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final experiencias =
                              containerExperienciasRecordList.toList();

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              50.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: experiencias.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                            itemBuilder: (context, experienciasIndex) {
                              final experienciasItem =
                                  experiencias[experienciasIndex];
                              return wrapWithModel(
                                model: _model.cardExperiencia2Models.getModel(
                                  experienciasItem.reference.id,
                                  experienciasIndex,
                                ),
                                updateCallback: () => setState(() {}),
                                child: CardExperiencia2Widget(
                                  key: Key(
                                    'Keyys9_${experienciasItem.reference.id}',
                                  ),
                                  experiencia: experienciasItem,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
