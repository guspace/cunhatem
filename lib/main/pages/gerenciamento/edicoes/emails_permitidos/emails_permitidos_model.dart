import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'emails_permitidos_widget.dart' show EmailsPermitidosWidget;
import 'package:flutter/material.dart';

class EmailsPermitidosModel extends FlutterFlowModel<EmailsPermitidosWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? fotoUpload;

  TipoUser? userRole = TipoUser.turista;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool firestoreRequestCompleted = false;
  String? firestoreRequestLastUniqueKey;
  // State field(s) for textEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  String? _textEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'E-mail inválido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textEmailTextControllerValidator = _textEmailTextControllerValidator;
  }

  @override
  void dispose() {
    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();
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
