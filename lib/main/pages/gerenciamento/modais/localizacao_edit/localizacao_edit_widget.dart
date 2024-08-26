import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'localizacao_edit_model.dart';
export 'localizacao_edit_model.dart';

class LocalizacaoEditWidget extends StatefulWidget {
  const LocalizacaoEditWidget({
    super.key,
    this.localizacaoAtual,
  });

  final LatLng? localizacaoAtual;

  @override
  State<LocalizacaoEditWidget> createState() => _LocalizacaoEditWidgetState();
}

class _LocalizacaoEditWidgetState extends State<LocalizacaoEditWidget> {
  late LocalizacaoEditModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocalizacaoEditModel());

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
                    'Localização',
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
                      logFirebaseEvent(
                          'LOCALIZACAO_EDIT_COMP_close_ICN_ON_TAP');
                      Navigator.pop(context);
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Text(
                        'Selecione a localização exata do local no mapa.',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          if (valueOrDefault<bool>(
                            _model.editarLocalizacao == true,
                            false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FlutterFlowPlacePicker(
                                iOSGoogleMapsApiKey:
                                    'AIzaSyATDTQABtncify7j6kb8Jy6Nm22WHioKSs',
                                androidGoogleMapsApiKey:
                                    'AIzaSyBuE3hFoABoZ25zNe0RI9D35LWbP6E-f7Q',
                                webGoogleMapsApiKey:
                                    'AIzaSyAIWImABKGPpXD-dt3NaxGQKAGz9xQ-53E',
                                onSelect: (place) async {
                                  setState(
                                      () => _model.placePickerValue = place);
                                  (await _model.mapEditarsController.future)
                                      .animateCamera(CameraUpdate.newLatLng(
                                          place.latLng.toGoogleMaps()));
                                },
                                defaultText: 'Selecionar Localização',
                                icon: Icon(
                                  Icons.place,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 16.0,
                                ),
                                buttonOptions: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          if (!valueOrDefault<bool>(
                            _model.editarLocalizacao,
                            false,
                          ))
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'LOCALIZACAO_EDIT_editarLocalizacao_ON_TA');
                                  _model.editarLocalizacao = true;
                                  setState(() {});
                                },
                                text: 'Editar localização',
                                icon: const Icon(
                                  Icons.edit_outlined,
                                  size: 16.0,
                                ),
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 44.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 0.0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                  hoverColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 1.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: Container(
                            width: double.infinity,
                            height: 300.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Stack(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                children: [
                                  if (valueOrDefault<bool>(
                                        _model.editarLocalizacao == false,
                                        true,
                                      ) &&
                                      valueOrDefault<bool>(
                                        widget.localizacaoAtual != null,
                                        false,
                                      ))
                                    Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: FlutterFlowGoogleMap(
                                        controller:
                                            _model.mapInicialsController,
                                        onCameraIdle: (latLng) =>
                                            _model.mapInicialsCenter = latLng,
                                        initialLocation:
                                            _model.mapInicialsCenter ??=
                                                widget.localizacaoAtual!,
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.normal,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 15.0,
                                        allowInteraction: false,
                                        allowZoom: false,
                                        showZoomControls: false,
                                        showLocation: false,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: false,
                                      ),
                                    ),
                                  if ((_model.editarLocalizacao == true) ||
                                      valueOrDefault<bool>(
                                        widget.localizacaoAtual == null,
                                        true,
                                      ))
                                    Container(
                                      decoration: const BoxDecoration(),
                                      child: FlutterFlowGoogleMap(
                                        controller: _model.mapEditarsController,
                                        onCameraIdle: (latLng) => setState(() =>
                                            _model.mapEditarsCenter = latLng),
                                        initialLocation:
                                            _model.mapEditarsCenter ??=
                                                _model.placePickerValue.latLng,
                                        markerColor: GoogleMarkerColor.violet,
                                        mapType: MapType.normal,
                                        style: GoogleMapStyle.standard,
                                        initialZoom: 15.0,
                                        allowInteraction: true,
                                        allowZoom: true,
                                        showZoomControls: false,
                                        showLocation: true,
                                        showCompass: false,
                                        showMapToolbar: false,
                                        showTraffic: false,
                                        centerMapOnMarkerTap: false,
                                      ),
                                    ),
                                  Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 18.0),
                                      child: Icon(
                                        Icons.location_pin,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 34.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                        logFirebaseEvent(
                            'LOCALIZACAO_EDIT_CONFIRMAR_BTN_ON_TAP');
                        if (_model.editarLocalizacao == true) {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return WebViewAware(
                                    child: AlertDialog(
                                      title: const Text('Editar localização'),
                                      content: const Text(
                                          'Deseja editar a localização deste estabelecimento no mapa?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: const Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: const Text('Confirmar'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ) ??
                              false;
                          if (confirmDialogResponse) {
                            Navigator.pop(context, _model.mapEditarsCenter);
                          } else {
                            Navigator.pop(context);
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      text: 'Confirmar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).success,
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
                ].divide(const SizedBox(width: 10.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
