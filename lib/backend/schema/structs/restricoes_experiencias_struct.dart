// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RestricoesExperienciasStruct extends FFFirebaseStruct {
  RestricoesExperienciasStruct({
    bool? seloCunhatur,
    int? quantidade,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _seloCunhatur = seloCunhatur,
        _quantidade = quantidade,
        super(firestoreUtilData);

  // "seloCunhatur" field.
  bool? _seloCunhatur;
  bool get seloCunhatur => _seloCunhatur ?? false;
  set seloCunhatur(bool? val) => _seloCunhatur = val;

  bool hasSeloCunhatur() => _seloCunhatur != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  static RestricoesExperienciasStruct fromMap(Map<String, dynamic> data) =>
      RestricoesExperienciasStruct(
        seloCunhatur: data['seloCunhatur'] as bool?,
        quantidade: castToType<int>(data['quantidade']),
      );

  static RestricoesExperienciasStruct? maybeFromMap(dynamic data) => data is Map
      ? RestricoesExperienciasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'seloCunhatur': _seloCunhatur,
        'quantidade': _quantidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'seloCunhatur': serializeParam(
          _seloCunhatur,
          ParamType.bool,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
      }.withoutNulls;

  static RestricoesExperienciasStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RestricoesExperienciasStruct(
        seloCunhatur: deserializeParam(
          data['seloCunhatur'],
          ParamType.bool,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RestricoesExperienciasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RestricoesExperienciasStruct &&
        seloCunhatur == other.seloCunhatur &&
        quantidade == other.quantidade;
  }

  @override
  int get hashCode => const ListEquality().hash([seloCunhatur, quantidade]);
}

RestricoesExperienciasStruct createRestricoesExperienciasStruct({
  bool? seloCunhatur,
  int? quantidade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RestricoesExperienciasStruct(
      seloCunhatur: seloCunhatur,
      quantidade: quantidade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RestricoesExperienciasStruct? updateRestricoesExperienciasStruct(
  RestricoesExperienciasStruct? restricoesExperiencias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    restricoesExperiencias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRestricoesExperienciasStructData(
  Map<String, dynamic> firestoreData,
  RestricoesExperienciasStruct? restricoesExperiencias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (restricoesExperiencias == null) {
    return;
  }
  if (restricoesExperiencias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      restricoesExperiencias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final restricoesExperienciasData = getRestricoesExperienciasFirestoreData(
      restricoesExperiencias, forFieldValue);
  final nestedData =
      restricoesExperienciasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      restricoesExperiencias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRestricoesExperienciasFirestoreData(
  RestricoesExperienciasStruct? restricoesExperiencias, [
  bool forFieldValue = false,
]) {
  if (restricoesExperiencias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(restricoesExperiencias.toMap());

  // Add any Firestore field values
  restricoesExperiencias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRestricoesExperienciasListFirestoreData(
  List<RestricoesExperienciasStruct>? restricoesExperienciass,
) =>
    restricoesExperienciass
        ?.map((e) => getRestricoesExperienciasFirestoreData(e, true))
        .toList() ??
    [];
