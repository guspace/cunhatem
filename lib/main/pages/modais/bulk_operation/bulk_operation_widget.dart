import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bulk_operation_model.dart';
export 'bulk_operation_model.dart';

class BulkOperationWidget extends StatefulWidget {
  const BulkOperationWidget({
    super.key,
    required this.operacao,
  });

  final String? operacao;

  @override
  State<BulkOperationWidget> createState() => _BulkOperationWidgetState();
}

class _BulkOperationWidgetState extends State<BulkOperationWidget> {
  late BulkOperationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BulkOperationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterFlowIconButton(
          borderColor: FlutterFlowTheme.of(context).tertiary,
          borderRadius: 20.0,
          borderWidth: 1.0,
          buttonSize: 32.0,
          fillColor: FlutterFlowTheme.of(context).tertiary,
          icon: const Icon(
            Icons.warning_amber,
            color: Colors.white,
            size: 16.0,
          ),
          onPressed: () async {
            logFirebaseEvent('BULK_OPERATION_warning_amber_ICN_ON_TAP');
            if (widget.operacao == 'comodidades') {
              _model.listaLocaisIds = await queryLocaisRecordOnce(
                queryBuilder: (locaisRecord) => locaisRecord.where(
                  'lixeira',
                  isEqualTo: false,
                ),
              );
              _model.locais =
                  _model.listaLocaisIds!.toList().cast<LocaisRecord>();
              setState(() {});
              while (_model.locais.isNotEmpty) {
                await _model.locais.first.reference
                    .update(createLocaisRecordData());
                _model.removeAtIndexFromLocais(0);
                setState(() {});
              }
              FFAppState().clearLocaisCache();
            } else if (widget.operacao == 'id') {
              _model.listaLocais = await queryLocaisRecordOnce(
                queryBuilder: (locaisRecord) => locaisRecord.where(
                  'lixeira',
                  isEqualTo: false,
                ),
              );
              _model.locais = _model.listaLocais!.toList().cast<LocaisRecord>();
              setState(() {});
              while (_model.locais.isNotEmpty) {
                await _model.locais.first.reference
                    .update(createLocaisRecordData(
                  id: _model.locais.first.reference.id,
                ));
                _model.removeAtIndexFromLocais(0);
                setState(() {});
              }
              FFAppState().clearLocaisCache();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Erro',
                    style: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).titleSmallFamily,
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).titleSmallFamily),
                        ),
                  ),
                  duration: const Duration(milliseconds: 4000),
                  backgroundColor: FlutterFlowTheme.of(context).tertiary,
                ),
              );
            }

            setState(() {});
          },
        ),
        Text(
          valueOrDefault<String>(
            _model.locais.length.toString(),
            '0',
          ),
          style: FlutterFlowTheme.of(context).titleSmall.override(
                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                color: Colors.white,
                fontSize: 12.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
              ),
        ),
      ],
    );
  }
}
