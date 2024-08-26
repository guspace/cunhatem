import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/icon_pesquisar/icon_pesquisar_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'dart:async';
import 'eventos_widget.dart' show EventosWidget;
import 'package:flutter/material.dart';

class EventosModel extends FlutterFlowModel<EventosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // Model for iconPesquisar component.
  late IconPesquisarModel iconPesquisarModel;
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    iconPesquisarModel = createModel(context, () => IconPesquisarModel());
    menuBarModel = createModel(context, () => MenuBarModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    iconPesquisarModel.dispose();
    menuBarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
