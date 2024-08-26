import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_user_widget.dart' show EditUserWidget;
import 'package:flutter/material.dart';

class EditUserModel extends FlutterFlowModel<EditUserWidget> {
  ///  Local state fields for this component.

  FFUploadedFile? fotoUpload;

  TipoUser? userRole = TipoUser.turista;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;
  String? _textNomeTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for textEmail widget.
  FocusNode? textEmailFocusNode;
  TextEditingController? textEmailTextController;
  String? Function(BuildContext, String?)? textEmailTextControllerValidator;
  String? _textEmailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for textNumero widget.
  FocusNode? textNumeroFocusNode;
  TextEditingController? textNumeroTextController;
  String? Function(BuildContext, String?)? textNumeroTextControllerValidator;
  String? _textNumeroTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for dropTipoUser widget.
  TipoUser? dropTipoUserValue;
  FormFieldController<TipoUser>? dropTipoUserValueController;
  // Stores action output result for [Custom Action - extractNumbers] action in buttonSave widget.
  String? numero;

  @override
  void initState(BuildContext context) {
    textNomeTextControllerValidator = _textNomeTextControllerValidator;
    textEmailTextControllerValidator = _textEmailTextControllerValidator;
    textNumeroTextControllerValidator = _textNumeroTextControllerValidator;
  }

  @override
  void dispose() {
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();

    textEmailFocusNode?.dispose();
    textEmailTextController?.dispose();

    textNumeroFocusNode?.dispose();
    textNumeroTextController?.dispose();
  }
}
