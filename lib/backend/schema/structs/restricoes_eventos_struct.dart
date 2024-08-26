// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RestricoesEventosStruct extends FFFirebaseStruct {
  RestricoesEventosStruct({
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

  static RestricoesEventosStruct fromMap(Map<String, dynamic> data) =>
      RestricoesEventosStruct(
        seloCunhatur: data['seloCunhatur'] as bool?,
        quantidade: castToType<int>(data['quantidade']),
      );

  static RestricoesEventosStruct? maybeFromMap(dynamic data) => data is Map
      ? RestricoesEventosStruct.fromMap(data.cast<String, dynamic>())
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

  static RestricoesEventosStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RestricoesEventosStruct(
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
  String toString() => 'RestricoesEventosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RestricoesEventosStruct &&
        seloCunhatur == other.seloCunhatur &&
        quantidade == other.quantidade;
  }

  @override
  int get hashCode => const ListEquality().hash([seloCunhatur, quantidade]);
}

RestricoesEventosStruct createRestricoesEventosStruct({
  bool? seloCunhatur,
  int? quantidade,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RestricoesEventosStruct(
      seloCunhatur: seloCunhatur,
      quantidade: quantidade,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RestricoesEventosStruct? updateRestricoesEventosStruct(
  RestricoesEventosStruct? restricoesEventos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    restricoesEventos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRestricoesEventosStructData(
  Map<String, dynamic> firestoreData,
  RestricoesEventosStruct? restricoesEventos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (restricoesEventos == null) {
    return;
  }
  if (restricoesEventos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && restricoesEventos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final restricoesEventosData =
      getRestricoesEventosFirestoreData(restricoesEventos, forFieldValue);
  final nestedData =
      restricoesEventosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = restricoesEventos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRestricoesEventosFirestoreData(
  RestricoesEventosStruct? restricoesEventos, [
  bool forFieldValue = false,
]) {
  if (restricoesEventos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(restricoesEventos.toMap());

  // Add any Firestore field values
  restricoesEventos.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRestricoesEventosListFirestoreData(
  List<RestricoesEventosStruct>? restricoesEventoss,
) =>
    restricoesEventoss
        ?.map((e) => getRestricoesEventosFirestoreData(e, true))
        .toList() ??
    [];
