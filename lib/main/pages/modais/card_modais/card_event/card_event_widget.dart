import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'card_event_model.dart';
export 'card_event_model.dart';

class CardEventWidget extends StatefulWidget {
  const CardEventWidget({
    super.key,
    required this.evento,
  });

  final EventosRecord? evento;

  @override
  State<CardEventWidget> createState() => _CardEventWidgetState();
}

class _CardEventWidgetState extends State<CardEventWidget> {
  late CardEventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CardEventModel());

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
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          logFirebaseEvent('CARD_EVENT_COMP_cardMap_ON_TAP');

          context.pushNamed(
            'evento',
            pathParameters: {
              'refEvento': serializeParam(
                widget.evento?.reference,
                ParamType.DocumentReference,
              ),
            }.withoutNulls,
          );
        },
        child: Container(
          width: double.infinity,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.0, -1.0),
                        child: Text(
                          valueOrDefault<String>(
                            '${dateTimeFormat(
                              "d/MM",
                              widget.evento?.comecaEm,
                              locale: FFLocalizations.of(context).languageCode,
                            )} até ${dateTimeFormat(
                              "d/MM/y",
                              widget.evento?.terminaEm,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
                            'Data até Data',
                          ),
                          style: GoogleFonts.getFont(
                            'Comfortaa',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: const AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 6.0, 0.0, 6.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.evento?.nome,
                                'Nome do Evento',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Comfortaa',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey('Comfortaa'),
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(
                      'assets/images/Empty_Photo_1920x1080.png',
                    ).image,
                  ),
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
                  borderRadius: BorderRadius.circular(14.0),
                ),
                child: SizedBox(
                  width: 136.0,
                  height: 120.0,
                  child: Stack(
                    children: [
                      if (valueOrDefault<bool>(
                        widget.evento!.galeriaFotos.isNotEmpty,
                        false,
                      ))
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: OctoImage(
                            placeholderBuilder: (_) => SizedBox.expand(
                              child: Image(
                                image: BlurHashImage(widget
                                    .evento!.galeriaFotos.first.blurHash),
                                fit: BoxFit.cover,
                              ),
                            ),
                            image: CachedNetworkImageProvider(
                              widget.evento!.galeriaFotos.first.image,
                            ),
                            width: 136.0,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/error_image.png',
                              width: 136.0,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
