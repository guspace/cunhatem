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

Future<List<CategoriasStruct>> reorderCategorias(
  List<CategoriasStruct> list,
  int oldIndex,
  int newIndex,
) async {
  // reordenar itens e criar nova lista com nova ordem
// Create a copy of the original list
  List<CategoriasStruct> newList = List.from(list);

  // Remove the item from the old index and insert it at the new index
  final item = newList.removeAt(oldIndex);
  newList.insert(newIndex, item);

  // Update the order property of each item in the list
  for (int i = 0; i < newList.length; i++) {
    newList[i].order = i;
  }

  // Return the new list
  return newList;
}
