import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/local_aberto/local_aberto_widget.dart';
import 'dart:async';
import 'local_widget.dart' show LocalWidget;
import 'package:flutter/material.dart';

class LocalModel extends FlutterFlowModel<LocalWidget> {
  ///  State fields for stateful widgets in this page.

  Completer<LocaisRecord>? documentRequestCompleter2;
  Completer<PlanosRecord>? documentRequestCompleter1;
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for localAberto component.
  late LocalAbertoModel localAbertoModel1;
  // Model for localAberto component.
  late LocalAbertoModel localAbertoModel2;

  @override
  void initState(BuildContext context) {
    localAbertoModel1 = createModel(context, () => LocalAbertoModel());
    localAbertoModel2 = createModel(context, () => LocalAbertoModel());
  }

  @override
  void dispose() {
    localAbertoModel1.dispose();
    localAbertoModel2.dispose();
  }

  /// Additional helper methods.
  Future waitForDocumentRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForDocumentRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = documentRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

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
