import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'localizacao_edit_widget.dart' show LocalizacaoEditWidget;
import 'package:flutter/material.dart';

class LocalizacaoEditModel extends FlutterFlowModel<LocalizacaoEditWidget> {
  ///  Local state fields for this component.

  bool editarLocalizacao = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue = const FFPlace();
  // State field(s) for mapInicial widget.
  LatLng? mapInicialsCenter;
  final mapInicialsController = Completer<GoogleMapController>();
  // State field(s) for mapEditar widget.
  LatLng? mapEditarsCenter;
  final mapEditarsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
