// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CategoriasStruct extends FFFirebaseStruct {
  CategoriasStruct({
    String? id,
    String? nome,
    int? order,
    bool? arquivado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nome = nome,
        _order = order,
        _arquivado = arquivado,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "arquivado" field.
  bool? _arquivado;
  bool get arquivado => _arquivado ?? false;
  set arquivado(bool? val) => _arquivado = val;

  bool hasArquivado() => _arquivado != null;

  static CategoriasStruct fromMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        id: data['id'] as String?,
        nome: data['nome'] as String?,
        order: castToType<int>(data['order']),
        arquivado: data['arquivado'] as bool?,
      );

  static CategoriasStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoriasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'order': _order,
        'arquivado': _arquivado,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'arquivado': serializeParam(
          _arquivado,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CategoriasStruct fromSerializableMap(Map<String, dynamic> data) =>
      CategoriasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        arquivado: deserializeParam(
          data['arquivado'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CategoriasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoriasStruct &&
        id == other.id &&
        nome == other.nome &&
        order == other.order &&
        arquivado == other.arquivado;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nome, order, arquivado]);
}

CategoriasStruct createCategoriasStruct({
  String? id,
  String? nome,
  int? order,
  bool? arquivado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoriasStruct(
      id: id,
      nome: nome,
      order: order,
      arquivado: arquivado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CategoriasStruct? updateCategoriasStruct(
  CategoriasStruct? categorias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categorias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoriasStructData(
  Map<String, dynamic> firestoreData,
  CategoriasStruct? categorias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categorias == null) {
    return;
  }
  if (categorias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categorias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoriasData = getCategoriasFirestoreData(categorias, forFieldValue);
  final nestedData = categoriasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categorias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoriasFirestoreData(
  CategoriasStruct? categorias, [
  bool forFieldValue = false,
]) {
  if (categorias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categorias.toMap());

  // Add any Firestore field values
  categorias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoriasListFirestoreData(
  List<CategoriasStruct>? categoriass,
) =>
    categoriass?.map((e) => getCategoriasFirestoreData(e, true)).toList() ?? [];
