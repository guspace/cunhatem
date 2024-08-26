import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/btn_vertudo/btn_vertudo_widget.dart';
import '/main/pages/modais/card_modais/card_local2/card_local2_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_locais_model.dart';
export 'list_locais_model.dart';

class ListLocaisWidget extends StatefulWidget {
  const ListLocaisWidget({
    super.key,
    this.categoria,
    this.subcategoria,
    String? texto,
    this.locais,
  }) : texto = texto ?? 'Lista';

  final CategoriasStruct? categoria;
  final SubCategoriasStruct? subcategoria;
  final String texto;
  final List<LocaisRecord>? locais;

  @override
  State<ListLocaisWidget> createState() => _ListLocaisWidgetState();
}

class _ListLocaisWidgetState extends State<ListLocaisWidget> {
  late ListLocaisModel _model;

  LatLng? currentUserLocationValue;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListLocaisModel());

    getCurrentUserLocation(defaultLocation: const LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AutoSizeText(
                  widget.texto,
                  minFontSize: 16.0,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).headlineSmallFamily,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).headlineSmallFamily),
                      ),
                ),
              ),
              wrapWithModel(
                model: _model.btnVertudoModel1,
                updateCallback: () => setState(() {}),
                child: BtnVertudoWidget(
                  categoria: widget.categoria,
                  subcategoria: widget.subcategoria,
                  tipo: 'texto',
                ),
              ),
            ].divide(const SizedBox(width: 12.0)),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
          child: Container(
            width: double.infinity,
            height: 250.0,
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final listaLocais = (widget.locais
                                  ?.where((e) => valueOrDefault<bool>(
                                        e.subcategoriasStrings
                                            .contains(widget.subcategoria?.id),
                                        false,
                                      ))
                                  .toList()
                                  .toList() ??
                              [])
                          .take(5)
                          .toList();
                      if (listaLocais.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/Pasta_vazia.png',
                          ),
                        );
                      }

                      return ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listaLocais.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 12.0),
                        itemBuilder: (context, listaLocaisIndex) {
                          final listaLocaisItem = listaLocais[listaLocaisIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: wrapWithModel(
                              model: _model.cardLocal2Models.getModel(
                                listaLocaisItem.reference.id,
                                listaLocaisIndex,
                              ),
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: CardLocal2Widget(
                                key: Key(
                                  'Key8fp_${listaLocaisItem.reference.id}',
                                ),
                                local: listaLocaisItem,
                                distancia: 'a ${valueOrDefault<String>(
                                  functions.getDistanceBetween(
                                              currentUserLocationValue!,
                                              listaLocaisItem.localizacao!) >
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
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    child: wrapWithModel(
                      model: _model.btnVertudoModel2,
                      updateCallback: () => setState(() {}),
                      child: BtnVertudoWidget(
                        tipo: 'circulo',
                        subcategoria: widget.subcategoria,
                        categoria: widget.categoria,
                      ),
                    ),
                  ),
                ]
                    .addToStart(const SizedBox(width: 12.0))
                    .addToEnd(const SizedBox(width: 12.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
