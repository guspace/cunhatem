import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/list_experiencias/list_experiencias_widget.dart';
import '/main/pages/modais/card_modais/list_locais/list_locais_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'dart:async';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for iconPesquisar component.
  late IconPesquisarModel iconPesquisarModel;
  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // State field(s) for locaisTabBar widget.
  TabController? locaisTabBarController;
  int get locaisTabBarCurrentIndex =>
      locaisTabBarController != null ? locaisTabBarController!.index : 0;

  bool firestoreRequestCompleted2 = false;
  String? firestoreRequestLastUniqueKey2;
  bool firestoreRequestCompleted1 = false;
  String? firestoreRequestLastUniqueKey1;
  // Models for listLocais dynamic component.
  late FlutterFlowDynamicModels<ListLocaisModel> listLocaisModels1;
  // Model for listExperiencias component.
  late ListExperienciasModel listExperienciasModel;
  // Models for listLocais dynamic component.
  late FlutterFlowDynamicModels<ListLocaisModel> listLocaisModels2;
  // Models for listLocais dynamic component.
  late FlutterFlowDynamicModels<ListLocaisModel> listLocaisModels3;
  // Models for listLocais dynamic component.
  late FlutterFlowDynamicModels<ListLocaisModel> listLocaisModels4;
  // Models for listLocais dynamic component.
  late FlutterFlowDynamicModels<ListLocaisModel> listLocaisModels5;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;

  @override
  void initState(BuildContext context) {
    iconPesquisarModel = createModel(context, () => IconPesquisarModel());
    appbarTextModel = createModel(context, () => AppbarTextModel());
    listLocaisModels1 = FlutterFlowDynamicModels(() => ListLocaisModel());
    listExperienciasModel = createModel(context, () => ListExperienciasModel());
    listLocaisModels2 = FlutterFlowDynamicModels(() => ListLocaisModel());
    listLocaisModels3 = FlutterFlowDynamicModels(() => ListLocaisModel());
    listLocaisModels4 = FlutterFlowDynamicModels(() => ListLocaisModel());
    listLocaisModels5 = FlutterFlowDynamicModels(() => ListLocaisModel());
    menuBarModel = createModel(context, () => MenuBarModel());
  }

  @override
  void dispose() {
    iconPesquisarModel.dispose();
    appbarTextModel.dispose();
    locaisTabBarController?.dispose();
    listLocaisModels1.dispose();
    listExperienciasModel.dispose();
    listLocaisModels2.dispose();
    listLocaisModels3.dispose();
    listLocaisModels4.dispose();
    listLocaisModels5.dispose();
    menuBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted1;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
