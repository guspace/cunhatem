// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<FotosStruct>> reorderGaleria(
  List<FotosStruct> galeriaList,
  int oldIndex,
  int newIndex,
) async {
  // reordene os itens conforme oldindex e newindex e retorne a nova lista
// Create a copy of the original list
  List<FotosStruct> reorderedList = List.from(galeriaList);

  // Remove the item from the old index and insert it at the new index
  final item = reorderedList.removeAt(oldIndex);
  reorderedList.insert(newIndex, item);

  // Return the reordered list
  return reorderedList;
}
