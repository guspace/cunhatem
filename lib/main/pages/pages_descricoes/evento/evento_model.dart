import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/card_local2/card_local2_widget.dart';
import 'dart:async';
import 'evento_widget.dart' show EventoWidget;
import 'package:flutter/material.dart';

class EventoModel extends FlutterFlowModel<EventoWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<EventosRecord>? documentRequestCompleter;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for cardLocal2 dynamic component.
  late FlutterFlowDynamicModels<CardLocal2Model> cardLocal2Models;

  @override
  void initState(BuildContext context) {
    cardLocal2Models = FlutterFlowDynamicModels(() => CardLocal2Model());
  }

  @override
  void dispose() {
    cardLocal2Models.dispose();
  }

  /// Additional helper methods.
  Future waitForDocumentRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
