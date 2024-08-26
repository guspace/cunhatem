// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RestricoesUsuarioStruct extends FFFirebaseStruct {
  RestricoesUsuarioStruct({
    bool? achadosPerdidos,
    bool? disponibilidadeLeitos,
    bool? avaliacaoClientes,
    bool? painelEmpreendedor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _achadosPerdidos = achadosPerdidos,
        _disponibilidadeLeitos = disponibilidadeLeitos,
        _avaliacaoClientes = avaliacaoClientes,
        _painelEmpreendedor = painelEmpreendedor,
        super(firestoreUtilData);

  // "achadosPerdidos" field.
  bool? _achadosPerdidos;
  bool get achadosPerdidos => _achadosPerdidos ?? false;
  set achadosPerdidos(bool? val) => _achadosPerdidos = val;

  bool hasAchadosPerdidos() => _achadosPerdidos != null;

  // "disponibilidadeLeitos" field.
  bool? _disponibilidadeLeitos;
  bool get disponibilidadeLeitos => _disponibilidadeLeitos ?? false;
  set disponibilidadeLeitos(bool? val) => _disponibilidadeLeitos = val;

  bool hasDisponibilidadeLeitos() => _disponibilidadeLeitos != null;

  // "avaliacaoClientes" field.
  bool? _avaliacaoClientes;
  bool get avaliacaoClientes => _avaliacaoClientes ?? false;
  set avaliacaoClientes(bool? val) => _avaliacaoClientes = val;

  bool hasAvaliacaoClientes() => _avaliacaoClientes != null;

  // "painelEmpreendedor" field.
  bool? _painelEmpreendedor;
  bool get painelEmpreendedor => _painelEmpreendedor ?? false;
  set painelEmpreendedor(bool? val) => _painelEmpreendedor = val;

  bool hasPainelEmpreendedor() => _painelEmpreendedor != null;

  static RestricoesUsuarioStruct fromMap(Map<String, dynamic> data) =>
      RestricoesUsuarioStruct(
        achadosPerdidos: data['achadosPerdidos'] as bool?,
        disponibilidadeLeitos: data['disponibilidadeLeitos'] as bool?,
        avaliacaoClientes: data['avaliacaoClientes'] as bool?,
        painelEmpreendedor: data['painelEmpreendedor'] as bool?,
      );

  static RestricoesUsuarioStruct? maybeFromMap(dynamic data) => data is Map
      ? RestricoesUsuarioStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'achadosPerdidos': _achadosPerdidos,
        'disponibilidadeLeitos': _disponibilidadeLeitos,
        'avaliacaoClientes': _avaliacaoClientes,
        'painelEmpreendedor': _painelEmpreendedor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'achadosPerdidos': serializeParam(
          _achadosPerdidos,
          ParamType.bool,
        ),
        'disponibilidadeLeitos': serializeParam(
          _disponibilidadeLeitos,
          ParamType.bool,
        ),
        'avaliacaoClientes': serializeParam(
          _avaliacaoClientes,
          ParamType.bool,
        ),
        'painelEmpreendedor': serializeParam(
          _painelEmpreendedor,
          ParamType.bool,
        ),
      }.withoutNulls;

  static RestricoesUsuarioStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RestricoesUsuarioStruct(
        achadosPerdidos: deserializeParam(
          data['achadosPerdidos'],
          ParamType.bool,
          false,
        ),
        disponibilidadeLeitos: deserializeParam(
          data['disponibilidadeLeitos'],
          ParamType.bool,
          false,
        ),
        avaliacaoClientes: deserializeParam(
          data['avaliacaoClientes'],
          ParamType.bool,
          false,
        ),
        painelEmpreendedor: deserializeParam(
          data['painelEmpreendedor'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'RestricoesUsuarioStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RestricoesUsuarioStruct &&
        achadosPerdidos == other.achadosPerdidos &&
        disponibilidadeLeitos == other.disponibilidadeLeitos &&
        avaliacaoClientes == other.avaliacaoClientes &&
        painelEmpreendedor == other.painelEmpreendedor;
  }

  @override
  int get hashCode => const ListEquality().hash([
        achadosPerdidos,
        disponibilidadeLeitos,
        avaliacaoClientes,
        painelEmpreendedor
      ]);
}

RestricoesUsuarioStruct createRestricoesUsuarioStruct({
  bool? achadosPerdidos,
  bool? disponibilidadeLeitos,
  bool? avaliacaoClientes,
  bool? painelEmpreendedor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RestricoesUsuarioStruct(
      achadosPerdidos: achadosPerdidos,
      disponibilidadeLeitos: disponibilidadeLeitos,
      avaliacaoClientes: avaliacaoClientes,
      painelEmpreendedor: painelEmpreendedor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RestricoesUsuarioStruct? updateRestricoesUsuarioStruct(
  RestricoesUsuarioStruct? restricoesUsuario, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    restricoesUsuario
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRestricoesUsuarioStructData(
  Map<String, dynamic> firestoreData,
  RestricoesUsuarioStruct? restricoesUsuario,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (restricoesUsuario == null) {
    return;
  }
  if (restricoesUsuario.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && restricoesUsuario.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final restricoesUsuarioData =
      getRestricoesUsuarioFirestoreData(restricoesUsuario, forFieldValue);
  final nestedData =
      restricoesUsuarioData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = restricoesUsuario.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRestricoesUsuarioFirestoreData(
  RestricoesUsuarioStruct? restricoesUsuario, [
  bool forFieldValue = false,
]) {
  if (restricoesUsuario == null) {
    return {};
  }
  final firestoreData = mapToFirestore(restricoesUsuario.toMap());

  // Add any Firestore field values
  restricoesUsuario.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRestricoesUsuarioListFirestoreData(
  List<RestricoesUsuarioStruct>? restricoesUsuarios,
) =>
    restricoesUsuarios
        ?.map((e) => getRestricoesUsuarioFirestoreData(e, true))
        .toList() ??
    [];
