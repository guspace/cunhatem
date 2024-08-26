import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_stories_widget.dart' show EditStoriesWidget;
import 'package:flutter/material.dart';

class EditStoriesModel extends FlutterFlowModel<EditStoriesWidget> {
  ///  Local state fields for this component.

  List<FotosStruct> editedStories = [];
  void addToEditedStories(FotosStruct item) => editedStories.add(item);
  void removeFromEditedStories(FotosStruct item) => editedStories.remove(item);
  void removeAtIndexFromEditedStories(int index) =>
      editedStories.removeAt(index);
  void insertAtIndexInEditedStories(int index, FotosStruct item) =>
      editedStories.insert(index, item);
  void updateEditedStoriesAtIndex(int index, Function(FotosStruct) updateFn) =>
      editedStories[index] = updateFn(editedStories[index]);

  FotosStruct? newStorie;
  void updateNewStorieStruct(Function(FotosStruct) updateFn) {
    updateFn(newStorie ??= FotosStruct());
  }

  FFUploadedFile? novaFoto;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for vinculoLocal widget.
  final vinculoLocalKey = GlobalKey();
  FocusNode? vinculoLocalFocusNode;
  TextEditingController? vinculoLocalTextController;
  String? vinculoLocalSelectedOption;
  String? Function(BuildContext, String?)? vinculoLocalTextControllerValidator;
  String? _vinculoLocalTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }
    if (val != vinculoLocalSelectedOption) {
      return 'Selecione uma opção da lista';
    }

    return null;
  }

  // State field(s) for descricao widget.
  FocusNode? descricaoFocusNode;
  TextEditingController? descricaoTextController;
  String? Function(BuildContext, String?)? descricaoTextControllerValidator;
  String? _descricaoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in editar widget.
  LocaisRecord? localstories2;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Firestore Query - Query a collection] action in salvar widget.
  LocaisRecord? localstories1;

  @override
  void initState(BuildContext context) {
    vinculoLocalTextControllerValidator = _vinculoLocalTextControllerValidator;
    descricaoTextControllerValidator = _descricaoTextControllerValidator;
  }

  @override
  void dispose() {
    vinculoLocalFocusNode?.dispose();

    descricaoFocusNode?.dispose();
    descricaoTextController?.dispose();
  }
}
