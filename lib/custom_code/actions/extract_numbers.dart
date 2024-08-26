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

Future<String> extractNumbers(String? valor) async {
  // quero extrair apenas os numeros de uma string
  if (valor == null) {
    return "";
  }
  String numbers = "";
  for (int i = 0; i < valor.length; i++) {
    if (valor[i].contains(RegExp(r'[0-9]'))) {
      numbers += valor[i];
    }
  }
  return numbers;
}
