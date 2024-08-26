import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_local1/card_local1_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import 'mapa_lista_widget.dart' show MapaListaWidget;
import 'package:flutter/material.dart';

class MapaListaModel extends FlutterFlowModel<MapaListaWidget> {
  ///  Local state fields for this page.

  bool verMapa = true;

  LocaisRecord? localSelecionado;

  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Model for iconPesquisar component.
  late IconPesquisarModel iconPesquisarModel;
  // Models for cardLocal1 dynamic component.
  late FlutterFlowDynamicModels<CardLocal1Model> cardLocal1Models1;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for cardLocal1 component.
  late CardLocal1Model cardLocal1Model2;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    iconPesquisarModel = createModel(context, () => IconPesquisarModel());
    cardLocal1Models1 = FlutterFlowDynamicModels(() => CardLocal1Model());
    cardLocal1Model2 = createModel(context, () => CardLocal1Model());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    iconPesquisarModel.dispose();
    cardLocal1Models1.dispose();
    cardLocal1Model2.dispose();
  }
}
