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

Future<bool> conferirSubcategorias(
  List<String>? categorias,
  List<String>? subcategorias,
) async {
  // conferir se as strings categorias (argument1) possui pelo menos uma correspondencia igual nas strings subcategorias (argument2)
  if (categorias == null || subcategorias == null) {
    return false;
  }

  for (String categoria in categorias) {
    for (String subcategoria in subcategorias) {
      if (categoria.toLowerCase() == subcategoria.toLowerCase()) {
        return true;
      }
    }
  }

  return false;
}
