import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_fotos_widget.dart' show AddFotosWidget;
import 'package:flutter/material.dart';

class AddFotosModel extends FlutterFlowModel<AddFotosWidget> {
  ///  Local state fields for this component.

  List<FFUploadedFile> fotosEscolhidas = [];
  void addToFotosEscolhidas(FFUploadedFile item) => fotosEscolhidas.add(item);
  void removeFromFotosEscolhidas(FFUploadedFile item) =>
      fotosEscolhidas.remove(item);
  void removeAtIndexFromFotosEscolhidas(int index) =>
      fotosEscolhidas.removeAt(index);
  void insertAtIndexInFotosEscolhidas(int index, FFUploadedFile item) =>
      fotosEscolhidas.insert(index, item);
  void updateFotosEscolhidasAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      fotosEscolhidas[index] = updateFn(fotosEscolhidas[index]);

  List<FFUploadedFile> subirBancodedados = [];
  void addToSubirBancodedados(FFUploadedFile item) =>
      subirBancodedados.add(item);
  void removeFromSubirBancodedados(FFUploadedFile item) =>
      subirBancodedados.remove(item);
  void removeAtIndexFromSubirBancodedados(int index) =>
      subirBancodedados.removeAt(index);
  void insertAtIndexInSubirBancodedados(int index, FFUploadedFile item) =>
      subirBancodedados.insert(index, item);
  void updateSubirBancodedadosAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      subirBancodedados[index] = updateFn(subirBancodedados[index]);

  int? qtd;

  List<FotosStruct> fotosConfirmadas = [];
  void addToFotosConfirmadas(FotosStruct item) => fotosConfirmadas.add(item);
  void removeFromFotosConfirmadas(FotosStruct item) =>
      fotosConfirmadas.remove(item);
  void removeAtIndexFromFotosConfirmadas(int index) =>
      fotosConfirmadas.removeAt(index);
  void insertAtIndexInFotosConfirmadas(int index, FotosStruct item) =>
      fotosConfirmadas.insert(index, item);
  void updateFotosConfirmadasAtIndex(
          int index, Function(FotosStruct) updateFn) =>
      fotosConfirmadas[index] = updateFn(fotosConfirmadas[index]);

  List<String> fotosURLs = [];
  void addToFotosURLs(String item) => fotosURLs.add(item);
  void removeFromFotosURLs(String item) => fotosURLs.remove(item);
  void removeAtIndexFromFotosURLs(int index) => fotosURLs.removeAt(index);
  void insertAtIndexInFotosURLs(int index, String item) =>
      fotosURLs.insert(index, item);
  void updateFotosURLsAtIndex(int index, Function(String) updateFn) =>
      fotosURLs[index] = updateFn(fotosURLs[index]);

  int qtdUpload = 0;

  List<String> blurHashes = [];
  void addToBlurHashes(String item) => blurHashes.add(item);
  void removeFromBlurHashes(String item) => blurHashes.remove(item);
  void removeAtIndexFromBlurHashes(int index) => blurHashes.removeAt(index);
  void insertAtIndexInBlurHashes(int index, String item) =>
      blurHashes.insert(index, item);
  void updateBlurHashesAtIndex(int index, Function(String) updateFn) =>
      blurHashes[index] = updateFn(blurHashes[index]);

  List<String> subirBlurHashes = [];
  void addToSubirBlurHashes(String item) => subirBlurHashes.add(item);
  void removeFromSubirBlurHashes(String item) => subirBlurHashes.remove(item);
  void removeAtIndexFromSubirBlurHashes(int index) =>
      subirBlurHashes.removeAt(index);
  void insertAtIndexInSubirBlurHashes(int index, String item) =>
      subirBlurHashes.insert(index, item);
  void updateSubirBlurHashesAtIndex(int index, Function(String) updateFn) =>
      subirBlurHashes[index] = updateFn(subirBlurHashes[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  List<FFUploadedFile> uploadedLocalFiles1 = [];

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
