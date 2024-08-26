import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'galeria_model.dart';
export 'galeria_model.dart';

class GaleriaWidget extends StatefulWidget {
  const GaleriaWidget({
    super.key,
    required this.fotosGaleria,
    required this.fotoInicial,
  });

  final List<FotosStruct>? fotosGaleria;
  final int? fotoInicial;

  @override
  State<GaleriaWidget> createState() => _GaleriaWidgetState();
}

class _GaleriaWidgetState extends State<GaleriaWidget> {
  late GaleriaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GaleriaModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Builder(
                builder: (context) {
                  final fotos = widget.fotosGaleria!.map((e) => e).toList();

                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 60.0, 0.0, 60.0),
                        child: PageView.builder(
                          controller: _model.pageViewController ??=
                              PageController(
                                  initialPage: max(
                                      0,
                                      min(
                                          valueOrDefault<int>(
                                            widget.fotoInicial,
                                            0,
                                          ),
                                          fotos.length - 1))),
                          scrollDirection: Axis.horizontal,
                          itemCount: fotos.length,
                          itemBuilder: (context, fotosIndex) {
                            final fotosItem = fotos[fotosIndex];
                            return FlutterFlowMediaDisplay(
                              path: fotosItem.image,
                              imageBuilder: (path) => CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 500),
                                fadeOutDuration: const Duration(milliseconds: 500),
                                imageUrl: path,
                                width: double.infinity,
                                height: double.infinity,
                                fit: BoxFit.contain,
                              ),
                              videoPlayerBuilder: (path) =>
                                  FlutterFlowVideoPlayer(
                                path: path,
                                width: 300.0,
                                autoPlay: false,
                                looping: true,
                                showControls: true,
                                allowFullScreen: true,
                                allowPlaybackSpeedMenu: false,
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 30.0),
                          child: smooth_page_indicator.SmoothPageIndicator(
                            controller: _model.pageViewController ??=
                                PageController(
                                    initialPage: max(
                                        0,
                                        min(
                                            valueOrDefault<int>(
                                              widget.fotoInicial,
                                              0,
                                            ),
                                            fotos.length - 1))),
                            count: fotos.length,
                            axisDirection: Axis.horizontal,
                            onDotClicked: (i) async {
                              await _model.pageViewController!.animateToPage(
                                i,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              setState(() {});
                            },
                            effect: smooth_page_indicator.ExpandingDotsEffect(
                              expansionFactor: 3.0,
                              spacing: 8.0,
                              radius: 16.0,
                              dotWidth: 8.0,
                              dotHeight: 8.0,
                              dotColor: FlutterFlowTheme.of(context).alternate,
                              activeDotColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              paintStyle: PaintingStyle.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  buttonSize: 60.0,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent('GALERIA_COMP_close_ICN_ON_TAP');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
