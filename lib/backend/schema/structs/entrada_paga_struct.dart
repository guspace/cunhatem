// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EntradaPagaStruct extends FFFirebaseStruct {
  EntradaPagaStruct({
    String? descricao,
    double? valor,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _descricao = descricao,
        _valor = valor,
        super(firestoreUtilData);

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  static EntradaPagaStruct fromMap(Map<String, dynamic> data) =>
      EntradaPagaStruct(
        descricao: data['descricao'] as String?,
        valor: castToType<double>(data['valor']),
      );

  static EntradaPagaStruct? maybeFromMap(dynamic data) => data is Map
      ? EntradaPagaStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'descricao': _descricao,
        'valor': _valor,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
      }.withoutNulls;

  static EntradaPagaStruct fromSerializableMap(Map<String, dynamic> data) =>
      EntradaPagaStruct(
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'EntradaPagaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EntradaPagaStruct &&
        descricao == other.descricao &&
        valor == other.valor;
  }

  @override
  int get hashCode => const ListEquality().hash([descricao, valor]);
}

EntradaPagaStruct createEntradaPagaStruct({
  String? descricao,
  double? valor,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EntradaPagaStruct(
      descricao: descricao,
      valor: valor,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EntradaPagaStruct? updateEntradaPagaStruct(
  EntradaPagaStruct? entradaPaga, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    entradaPaga
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEntradaPagaStructData(
  Map<String, dynamic> firestoreData,
  EntradaPagaStruct? entradaPaga,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (entradaPaga == null) {
    return;
  }
  if (entradaPaga.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && entradaPaga.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final entradaPagaData =
      getEntradaPagaFirestoreData(entradaPaga, forFieldValue);
  final nestedData =
      entradaPagaData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = entradaPaga.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEntradaPagaFirestoreData(
  EntradaPagaStruct? entradaPaga, [
  bool forFieldValue = false,
]) {
  if (entradaPaga == null) {
    return {};
  }
  final firestoreData = mapToFirestore(entradaPaga.toMap());

  // Add any Firestore field values
  entradaPaga.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEntradaPagaListFirestoreData(
  List<EntradaPagaStruct>? entradaPagas,
) =>
    entradaPagas?.map((e) => getEntradaPagaFirestoreData(e, true)).toList() ??
    [];
