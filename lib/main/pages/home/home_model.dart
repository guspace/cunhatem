import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  AppConfiguracoesRecord? configuracoesIniciais;
  InstantTimer? instantTimer;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for menuBar component.
  late MenuBarModel menuBarModel;

  @override
  void initState(BuildContext context) {
    menuBarModel = createModel(context, () => MenuBarModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    menuBarModel.dispose();
  }
}
