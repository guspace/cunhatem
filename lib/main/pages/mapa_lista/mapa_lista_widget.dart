import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_local1/card_local1_widget.dart';
import '/main/pages/modais/filtrar_locais/filtrar_locais_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'mapa_lista_model.dart';
export 'mapa_lista_model.dart';

class MapaListaWidget extends StatefulWidget {
  const MapaListaWidget({super.key});

  @override
  State<MapaListaWidget> createState() => _MapaListaWidgetState();
}

class _MapaListaWidgetState extends State<MapaListaWidget>
    with TickerProviderStateMixin {
  late MapaListaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapaListaModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'mapaLista'});
    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: null,
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 500.0.ms,
            begin: const Offset(0.0, 0.0),
            end: const Offset(-66.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
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
                            size: 28.0,
                          ),
                          onPressed: () async {
                            logFirebaseEvent('MAPA_LISTA_PAGE_iconBack_ON_TAP');
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
                              valueOrDefault<String>(
                                FFAppState().categoriaSelecionada.nome,
                                'Locais',
                              ),
                              'Lista',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, -1.0),
                        child: wrapWithModel(
                          model: _model.iconPesquisarModel,
                          updateCallback: () => setState(() {}),
                          child: const IconPesquisarWidget(),
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
          ),
        ),
        body: FutureBuilder<List<LocaisRecord>>(
          future: FFAppState().locais(
            uniqueQueryKey: 'mapaLista',
            requestFn: () => queryLocaisRecordOnce(
              queryBuilder: (locaisRecord) => locaisRecord
                  .where(
                    'visivel',
                    isEqualTo: true,
                  )
                  .where(
                    'lixeira',
                    isEqualTo: false,
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
            List<LocaisRecord> pageLocaisRecordList = snapshot.data!;

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Builder(
                        builder: (context) {
                          final listaLocais = pageLocaisRecordList
                              .where((e) => valueOrDefault<bool>(
                                    FFAppState()
                                                    .subcategoriaSelecionada
                                                    .id !=
                                                ''
                                        ? (valueOrDefault<bool>(
                                              e.localizacao != null,
                                              false,
                                            ) &&
                                            valueOrDefault<bool>(
                                              e.categoriasStrings.contains(
                                                  FFAppState()
                                                      .categoriaSelecionada
                                                      .id),
                                              false,
                                            ) &&
                                            valueOrDefault<bool>(
                                              e.subcategoriasStrings.contains(
                                                  FFAppState()
                                                      .subcategoriaSelecionada
                                                      .id),
                                              false,
                                            ))
                                        : (valueOrDefault<bool>(
                                              e.localizacao != null,
                                              false,
                                            ) &&
                                            valueOrDefault<bool>(
                                              e.categoriasStrings.contains(
                                                  FFAppState()
                                                      .categoriaSelecionada
                                                      .id),
                                              false,
                                            )),
                                    true,
                                  ))
                              .toList();

                          return ListView.separated(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              12.0,
                              0,
                              150.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: listaLocais.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                            itemBuilder: (context, listaLocaisIndex) {
                              final listaLocaisItem =
                                  listaLocais[listaLocaisIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.cardLocal1Models1.getModel(
                                    listaLocaisItem.reference.id,
                                    listaLocaisIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: CardLocal1Widget(
                                    key: Key(
                                      'Key2cl_${listaLocaisItem.reference.id}',
                                    ),
                                    distancia: 'a ${valueOrDefault<String>(
                                      functions.getDistanceBetween(
                                                  currentUserLocationValue!,
                                                  listaLocaisItem
                                                      .localizacao!) >
                                              1.0
                                          ? formatNumber(
                                              functions.getDistanceBetween(
                                                  currentUserLocationValue!,
                                                  listaLocaisItem.localizacao!),
                                              formatType: FormatType.custom,
                                              format: '#',
                                              locale: 'pt_BR',
                                            )
                                          : formatNumber(
                                              functions.getDistanceBetween(
                                                  currentUserLocationValue!,
                                                  listaLocaisItem.localizacao!),
                                              formatType: FormatType.custom,
                                              format: '#.0',
                                              locale: 'pt_BR',
                                            ),
                                      '-',
                                    )} Km',
                                    local: listaLocaisItem,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation1']!,
                      hasBeenTriggered: hasContainerTriggered1,
                      effects: [
                        VisibilityEffect(duration: 1.ms),
                        MoveEffect(
                          curve: Curves.easeInOut,
                          delay: 0.0.ms,
                          duration: 300.0.ms,
                          begin: Offset(
                              valueOrDefault<double>(
                                -MediaQuery.sizeOf(context).width,
                                -400.0,
                              ),
                              0.0),
                          end: const Offset(0.0, 0.0),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 60.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Stack(
                        children: [
                          if (valueOrDefault<bool>(
                            pageLocaisRecordList
                                    .where((e) => valueOrDefault<bool>(
                                          e.localizacao != null,
                                          false,
                                        ))
                                    .toList().isNotEmpty,
                            false,
                          ))
                            FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) => setState(
                                  () => _model.googleMapsCenter = latLng),
                              initialLocation: _model.googleMapsCenter ??=
                                  const LatLng(-23.0822, -44.89333),
                              markers: pageLocaisRecordList
                                  .where((e) => valueOrDefault<bool>(
                                        FFAppState()
                                                        .subcategoriaSelecionada
                                                        .id !=
                                                    ''
                                            ? (valueOrDefault<bool>(
                                                  e.localizacao != null,
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  e.categoriasStrings.contains(
                                                      FFAppState()
                                                          .categoriaSelecionada
                                                          .id),
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  e.subcategoriasStrings
                                                      .contains(FFAppState()
                                                          .subcategoriaSelecionada
                                                          .id),
                                                  false,
                                                ))
                                            : (valueOrDefault<bool>(
                                                  e.localizacao != null,
                                                  false,
                                                ) &&
                                                valueOrDefault<bool>(
                                                  e.categoriasStrings.contains(
                                                      FFAppState()
                                                          .categoriaSelecionada
                                                          .id),
                                                  false,
                                                )),
                                        true,
                                      ))
                                  .toList()
                                  .map(
                                    (marker) => FlutterFlowMarker(
                                      marker.reference.path,
                                      marker.localizacao!,
                                      () async {
                                        logFirebaseEvent(
                                            'MAPA_LISTA_GoogleMap_gmg270nq_ON_MARKER_');
                                        _model.localSelecionado = marker;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                  .toList(),
                              markerColor: GoogleMarkerColor.violet,
                              markerImage: const MarkerImage(
                                imagePath: 'assets/images/pinMap.png',
                                isAssetImage: true,
                                size: 44.0 ?? 20,
                              ),
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 10.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: false,
                              showMapToolbar: false,
                              showTraffic: false,
                              centerMapOnMarkerTap: true,
                            ),
                          if (valueOrDefault<bool>(
                            _model.localSelecionado != null,
                            false,
                          ))
                            Align(
                              alignment: const AlignmentDirectional(0.0, 1.0),
                              child: PointerInterceptor(
                                intercepting: isWeb,
                                child: SafeArea(
                                  child: Container(
                                    width: double.infinity,
                                    height: 160.0,
                                    decoration: const BoxDecoration(),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 40.0),
                                      child: wrapWithModel(
                                        model: _model.cardLocal1Model2,
                                        updateCallback: () => setState(() {}),
                                        child: CardLocal1Widget(
                                          distancia:
                                              'a ${valueOrDefault<String>(
                                            functions.getDistanceBetween(
                                                        currentUserLocationValue!,
                                                        _model.localSelecionado!
                                                            .localizacao!) >
                                                    1.0
                                                ? formatNumber(
                                                    functions.getDistanceBetween(
                                                        currentUserLocationValue!,
                                                        _model.localSelecionado!
                                                            .localizacao!),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '#',
                                                    locale: 'pt_BR',
                                                  )
                                                : formatNumber(
                                                    functions.getDistanceBetween(
                                                        currentUserLocationValue!,
                                                        _model.localSelecionado!
                                                            .localizacao!),
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '#.0',
                                                    locale: 'pt_BR',
                                                  ),
                                            '-',
                                          )}km',
                                          local: _model.localSelecionado!,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation2']!,
                      hasBeenTriggered: hasContainerTriggered2,
                      effects: [
                        MoveEffect(
                          curve: Curves.easeInOut,
                          delay: 0.0.ms,
                          duration: 300.0.ms,
                          begin: const Offset(0.0, 0.0),
                          end: Offset(
                              valueOrDefault<double>(
                                MediaQuery.sizeOf(context).width,
                                -400.0,
                              ),
                              0.0),
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List<AppConfiguracoesRecord>>(
                    future: FFAppState().appConfiguracoes(
                      uniqueQueryKey: 'mapaLista',
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
                      List<AppConfiguracoesRecord>
                          barraCategoriasAppConfiguracoesRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final barraCategoriasAppConfiguracoesRecord =
                          barraCategoriasAppConfiguracoesRecordList.isNotEmpty
                              ? barraCategoriasAppConfiguracoesRecordList.first
                              : null;

                      return Container(
                        width: double.infinity,
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: const AlignmentDirectional(1.0, 0.0),
                                children: [
                                  if (FFAppState().subcategoriaSelecionada.id ==
                                          '')
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 2.0, 0.0),
                                      child: Builder(
                                        builder: (context) {
                                          final subcategoriasSelecionar =
                                              barraCategoriasAppConfiguracoesRecord
                                                      ?.subCategorias
                                                      .where((e) =>
                                                          e.refCategoria ==
                                                          FFAppState()
                                                              .categoriaSelecionada
                                                              .id)
                                                      .toList()
                                                      .toList() ??
                                                  [];

                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List.generate(
                                                      subcategoriasSelecionar
                                                          .length,
                                                      (subcategoriasSelecionarIndex) {
                                                final subcategoriasSelecionarItem =
                                                    subcategoriasSelecionar[
                                                        subcategoriasSelecionarIndex];
                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'MAPA_LISTA_PAGE_btnCategoria_ON_TAP');
                                                    FFAppState()
                                                            .subcategoriaSelecionada =
                                                        subcategoriasSelecionarItem;
                                                    setState(() {});
                                                    HapticFeedback
                                                        .lightImpact();
                                                  },
                                                  text:
                                                      subcategoriasSelecionarItem
                                                          .nome,
                                                  options: FFButtonOptions(
                                                    height: 40.0,
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    iconPadding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: const BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                );
                                              })
                                                  .divide(const SizedBox(width: 8.0))
                                                  .addToStart(
                                                      const SizedBox(width: 12.0))
                                                  .addToEnd(
                                                      const SizedBox(width: 52.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  Container(
                                    width: 50.0,
                                    height: 42.0,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          const Color(0xE5FFFFFF),
                                          const Color(0xCDFFFFFF),
                                          const Color(0xB2FFFFFF),
                                          const Color(0x98FFFFFF),
                                          const Color(0x7FFFFFFF),
                                          const Color(0x5FFFFFFF),
                                          const Color(0x40FFFFFF),
                                          const Color(0x25FFFFFF),
                                          const Color(0x02FFFFFF)
                                        ],
                                        stops: const [
                                          0.1,
                                          0.2,
                                          0.3,
                                          0.4,
                                          0.5,
                                          0.6,
                                          0.7,
                                          0.8,
                                          0.9,
                                          1.0
                                        ],
                                        begin: const AlignmentDirectional(1.0, 0.0),
                                        end: const AlignmentDirectional(-1.0, 0),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().subcategoriaSelecionada.id !=
                                          '')
                                    Align(
                                      alignment:
                                          const AlignmentDirectional(-1.0, 0.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            FFButtonWidget(
                                              onPressed: () {
                                                print(
                                                    'btnCategoria pressed ...');
                                              },
                                              text: valueOrDefault<String>(
                                                FFAppState()
                                                    .subcategoriaSelecionada
                                                    .nome,
                                                'Sub',
                                              ),
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                iconPadding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 0.0,
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              icon: const Icon(
                                                Icons.close,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
                                              onPressed: () async {
                                                logFirebaseEvent(
                                                    'MAPA_LISTA_PAGE_close_ICN_ON_TAP');
                                                HapticFeedback.lightImpact();
                                                FFAppState()
                                                        .subcategoriaSelecionada =
                                                    SubCategoriasStruct();
                                                setState(() {});
                                                _model.localSelecionado = null;
                                                setState(() {});
                                              },
                                            ),
                                          ]
                                              .divide(const SizedBox(width: 8.0))
                                              .addToStart(const SizedBox(width: 12.0))
                                              .addToEnd(const SizedBox(width: 50.0)),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 0.0,
                              buttonSize: 1.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.filter_list,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 28.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MAPA_LISTA_PAGE_btnFiltrar_ON_TAP');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: const FiltrarLocaisWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                            ),
                          ]
                              .divide(const SizedBox(width: 10.0))
                              .addToEnd(const SizedBox(width: 12.0)),
                        ),
                      );
                    },
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            (_model.verMapa == true) &&
                                    valueOrDefault<bool>(
                                      _model.localSelecionado != null,
                                      false,
                                    )
                                ? 170.0
                                : 6.0,
                            6.0,
                          )),
                      child: SafeArea(
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'MAPA_LISTA_PAGE_btnMapaLista_ON_TAP');
                              HapticFeedback.lightImpact();
                              if (_model.verMapa) {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation3']!
                                      .controller
                                      .forward(from: 0.0);
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation1'] !=
                                    null) {
                                  setState(() => hasContainerTriggered1 = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => animationsMap[
                                              'containerOnActionTriggerAnimation1']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  setState(() => hasContainerTriggered2 = true);
                                  SchedulerBinding.instance.addPostFrameCallback(
                                      (_) async => animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .forward(from: 0.0));
                                }
                                _model.verMapa = !_model.verMapa;
                                setState(() {});
                              } else {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation3'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation3']!
                                      .controller
                                      .reverse();
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation1'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation1']!
                                      .controller
                                      .reverse();
                                }
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation2'] !=
                                    null) {
                                  animationsMap[
                                          'containerOnActionTriggerAnimation2']!
                                      .controller
                                      .reverse();
                                }
                                _model.verMapa = !_model.verMapa;
                                setState(() {});
                              }
                            },
                            child: Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Container(
                                width: 140.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 4.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        2.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: Stack(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.0, 0.0),
                                          child: Container(
                                            width: 68.0,
                                            height: 36.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background3,
                                              boxShadow: const [
                                                BoxShadow(
                                                  blurRadius: 4.0,
                                                  color: Color(0x430B0D0F),
                                                  offset: Offset(
                                                    0.0,
                                                    2.0,
                                                  ),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ).animateOnActionTrigger(
                                            animationsMap[
                                                'containerOnActionTriggerAnimation3']!,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  'Lista',
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  1.0, 0.0),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        14.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Mapa',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ]
                                              .addToStart(const SizedBox(width: 10.0))
                                              .addToEnd(const SizedBox(width: 10.0)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
