import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

String criarID(List<String> listaIDs) {
  // create a random string with numbers and letters (max 4 caracters), check if it is not being used in listaIDs
  String randomString = '';
  final random = math.Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';

// Generate random string
  for (var i = 0; i < 4; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }

// Check if it is not being used in listaIDs
  if (listaIDs == null || !listaIDs.contains(randomString)) {
    return randomString;
  } else {
    return criarID(listaIDs);
  }
}

double? formatCurrency(String? valor) {
  // quero converter uma string de valor, por exemplo "7,50" em double para salvar no banco de dados
  if (valor == null || valor.isEmpty) {
    return null;
  }
  final formattedValue = valor.replaceAll(',', '.');
  return double.tryParse(formattedValue);
}

String? listaVirgula(List<String>? stringList) {
  // gere uma única string separando os itens com (, )
  if (stringList == null || stringList.isEmpty) {
    return null;
  }
  return stringList.join(', ');
}

bool conferirCategoriasSubs(
  List<String>? categorias,
  List<String>? subcategorias,
) {
  // conferir se todas as strings categorias (argument1) possuem pelo menos uma correspondencia igual nas strings subcategorias (argument2)
  if (categorias == null || subcategorias == null) {
    return false;
  }

  for (final categoria in categorias) {
    bool foundMatch = false;
    for (final subcategoria in subcategorias) {
      if (subcategoria.contains(categoria)) {
        foundMatch = true;
        break;
      }
    }
    if (!foundMatch) {
      return false;
    }
  }

  return true;
}

String? extrairNumeroTelefone(String? numero) {
  // deixar apenas números na string
  if (numero == null) return null;
  return numero.replaceAll(RegExp(r'[^0-9]'), '');
}

DateTime dataFutura(
  DateTime date,
  int days,
) {
  // Get a future date +days
  return date.add(Duration(days: days));
}

double getDistanceBetween(
  LatLng locationA,
  LatLng locationB,
) {
  // get distance between two points
  final double earthRadius = 6371.0; // in kilometers

  final double latDiff =
      math.pi / 180.0 * (locationB.latitude - locationA.latitude);
  final double lngDiff =
      math.pi / 180.0 * (locationB.longitude - locationA.longitude);

  final double a = math.sin(latDiff / 2) * math.sin(latDiff / 2) +
      math.cos(math.pi / 180.0 * locationA.latitude) *
          math.cos(math.pi / 180.0 * locationB.latitude) *
          math.sin(lngDiff / 2) *
          math.sin(lngDiff / 2);

  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  final double distance = earthRadius * c;

  return distance;
}

String? gerarLink(String? link) {
  // gerar link acessível através do navegador, por cunhatem.com.br
  if (link == null || link.isEmpty) {
    return null;
  }
  final encodedLink = Uri.encodeFull(link);
  return 'https://cunhatem.com.br/$encodedLink';
}

String localAberto(
  DateTime currentDatetime,
  String? abre,
  String? fecha,
  bool? aberto24h,
) {
  // Conferir se o estabelecimento está aberto com base no horário e dia da semana. Se faltar apenas 30 min para fechar, retorne: "fechando". Se faltar 30 min para abrir, retorne: : "abrir". Se o horário e dia da semana condizer com o currentDatetime, ou o campo boolean aberto24h for true, retorne: "aberto". Caso contrário, ou for nulo, retorne: "fechado".
  if (aberto24h == true) {
    return "aberto";
  } else if (abre == null || fecha == null) {
    return "fechado";
  } else {
    final currentWeekday = currentDatetime.weekday;
    final currentHour = currentDatetime.hour;
    final currentMinute = currentDatetime.minute;
    final abreHour = int.parse(abre.split(":")[0]);
    final abreMinute = int.parse(abre.split(":")[1]);
    final fechaHour = int.parse(fecha.split(":")[0]);
    final fechaMinute = int.parse(fecha.split(":")[1]);

    if (currentHour > fechaHour ||
        (currentHour == fechaHour && currentMinute >= fechaMinute)) {
      return "fechado";
    } else if (currentHour < abreHour ||
        (currentHour == abreHour && currentMinute < abreMinute)) {
      final timeToOpen = DateTime(currentDatetime.year, currentDatetime.month,
              currentDatetime.day, abreHour, abreMinute)
          .difference(currentDatetime);
      if (timeToOpen.inMinutes <= 30) {
        return "abrir";
      } else {
        return "fechado";
      }
    } else {
      final timeToClose = DateTime(currentDatetime.year, currentDatetime.month,
              currentDatetime.day, fechaHour, fechaMinute)
          .difference(currentDatetime);
      if (timeToClose.inMinutes <= 30) {
        return "fechando";
      } else {
        return "aberto";
      }
    }
  }
}

String weekDayNumber(DateTime dateTime) {
  // me dê uma lista de numeros da semana de acordo com a data, onde segunda = 1 ...
  return '${dateTime.weekday}'; // returns the weekday number (1 for Monday, 2 for Tuesday, etc.)
}
