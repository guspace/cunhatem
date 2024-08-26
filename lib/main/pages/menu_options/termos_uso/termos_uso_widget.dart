import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'termos_uso_model.dart';
export 'termos_uso_model.dart';

class TermosUsoWidget extends StatefulWidget {
  const TermosUsoWidget({
    super.key,
    String? conteudo,
  }) : conteudo = conteudo ?? 'termos';

  final String conteudo;

  @override
  State<TermosUsoWidget> createState() => _TermosUsoWidgetState();
}

class _TermosUsoWidgetState extends State<TermosUsoWidget> {
  late TermosUsoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermosUsoModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'termosUso'});
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
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
                                  'TERMOS_USO_PAGE_chevron_left_ICN_ON_TAP');
                              context.safePop();
                            },
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.appbarTextModel,
                            updateCallback: () => setState(() {}),
                            child: AppbarTextWidget(
                              text: valueOrDefault<String>(
                                widget.conteudo == 'termos'
                                    ? 'Termos de Uso'
                                    : 'Política de Privacidade',
                                'Termos de Uso',
                              ),
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
        body: FutureBuilder<List<AppConfiguracoesRecord>>(
          future: FFAppState().appConfiguracoes(
            uniqueQueryKey: 'termos',
            requestFn: () => queryAppConfiguracoesRecordOnce(
              singleRecord: true,
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

            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FlutterFlowWebView(
                        content: () {
                          if (widget.conteudo == 'termos') {
                            return containerAppConfiguracoesRecord!.termosUso;
                          } else if (widget.conteudo == 'privacidade') {
                            return containerAppConfiguracoesRecord!
                                .politicaPrivacidade;
                          } else {
                            return containerAppConfiguracoesRecord!
                                .politicaPrivacidade;
                          }
                        }(),
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        verticalScroll: true,
                        horizontalScroll: false,
                        html: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
