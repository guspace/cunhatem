import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'favoritar_model.dart';
export 'favoritar_model.dart';

class FavoritarWidget extends StatefulWidget {
  const FavoritarWidget({
    super.key,
    bool? favorito,
    this.refExperiencia,
    this.refEvento,
    this.refLocal,
  }) : favorito = favorito ?? false;

  final bool favorito;
  final DocumentReference? refExperiencia;
  final DocumentReference? refEvento;
  final DocumentReference? refLocal;

  @override
  State<FavoritarWidget> createState() => _FavoritarWidgetState();
}

class _FavoritarWidgetState extends State<FavoritarWidget> {
  late FavoritarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          if (!valueOrDefault<bool>(
            widget.favorito,
            true,
          ))
            FlutterFlowIconButton(
              borderColor: const Color(0x003D4DAA),
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: const Color(0xA3FFFFFF),
              icon: Icon(
                Icons.favorite_border,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('FAVORITAR_COMP_favoritar_ON_TAP');
                if (widget.refLocal != null) {
                  FFAppState().addToFavoritosLocais(widget.refLocal!);
                  FFAppState().update(() {});
                  FFAppState().clearLocaisCacheKey('favoritos');
                } else if (widget.refExperiencia != null) {
                  FFAppState()
                      .addToFavoritosExperiencias(widget.refExperiencia!);
                  FFAppState().update(() {});
                  FFAppState().clearExperienciasCacheKey('favoritos');
                } else if (widget.refEvento != null) {}
              },
            ),
          if (valueOrDefault<bool>(
            widget.favorito,
            false,
          ))
            FlutterFlowIconButton(
              borderColor: const Color(0x003D4DAA),
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: const Color(0xA3FFFFFF),
              icon: Icon(
                Icons.favorite_sharp,
                color: FlutterFlowTheme.of(context).primary,
                size: 24.0,
              ),
              onPressed: () async {
                logFirebaseEvent('FAVORITAR_COMP_defavoritar_ON_TAP');
                if (widget.refLocal != null) {
                  FFAppState().removeFromFavoritosLocais(widget.refLocal!);
                  FFAppState().update(() {});
                  FFAppState().clearLocaisCacheKey('favoritos');
                } else if (widget.refExperiencia != null) {
                  FFAppState()
                      .removeFromFavoritosExperiencias(widget.refExperiencia!);
                  FFAppState().update(() {});
                  FFAppState().clearExperienciasCacheKey('favoritos');
                } else if (widget.refEvento != null) {}
              },
            ),
        ],
      ),
    );
  }
}
