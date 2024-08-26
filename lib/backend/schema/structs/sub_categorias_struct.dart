// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SubCategoriasStruct extends FFFirebaseStruct {
  SubCategoriasStruct({
    String? id,
    String? nome,
    String? refCategoria,
    int? order,
    bool? arquivado,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nome = nome,
        _refCategoria = refCategoria,
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

  // "ref_categoria" field.
  String? _refCategoria;
  String get refCategoria => _refCategoria ?? '';
  set refCategoria(String? val) => _refCategoria = val;

  bool hasRefCategoria() => _refCategoria != null;

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

  static SubCategoriasStruct fromMap(Map<String, dynamic> data) =>
      SubCategoriasStruct(
        id: data['id'] as String?,
        nome: data['nome'] as String?,
        refCategoria: data['ref_categoria'] as String?,
        order: castToType<int>(data['order']),
        arquivado: data['arquivado'] as bool?,
      );

  static SubCategoriasStruct? maybeFromMap(dynamic data) => data is Map
      ? SubCategoriasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'ref_categoria': _refCategoria,
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
        'ref_categoria': serializeParam(
          _refCategoria,
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

  static SubCategoriasStruct fromSerializableMap(Map<String, dynamic> data) =>
      SubCategoriasStruct(
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
        refCategoria: deserializeParam(
          data['ref_categoria'],
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
  String toString() => 'SubCategoriasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SubCategoriasStruct &&
        id == other.id &&
        nome == other.nome &&
        refCategoria == other.refCategoria &&
        order == other.order &&
        arquivado == other.arquivado;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, nome, refCategoria, order, arquivado]);
}

SubCategoriasStruct createSubCategoriasStruct({
  String? id,
  String? nome,
  String? refCategoria,
  int? order,
  bool? arquivado,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SubCategoriasStruct(
      id: id,
      nome: nome,
      refCategoria: refCategoria,
      order: order,
      arquivado: arquivado,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SubCategoriasStruct? updateSubCategoriasStruct(
  SubCategoriasStruct? subCategorias, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    subCategorias
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSubCategoriasStructData(
  Map<String, dynamic> firestoreData,
  SubCategoriasStruct? subCategorias,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (subCategorias == null) {
    return;
  }
  if (subCategorias.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && subCategorias.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final subCategoriasData =
      getSubCategoriasFirestoreData(subCategorias, forFieldValue);
  final nestedData =
      subCategoriasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = subCategorias.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSubCategoriasFirestoreData(
  SubCategoriasStruct? subCategorias, [
  bool forFieldValue = false,
]) {
  if (subCategorias == null) {
    return {};
  }
  final firestoreData = mapToFirestore(subCategorias.toMap());

  // Add any Firestore field values
  subCategorias.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSubCategoriasListFirestoreData(
  List<SubCategoriasStruct>? subCategoriass,
) =>
    subCategoriass
        ?.map((e) => getSubCategoriasFirestoreData(e, true))
        .toList() ??
    [];
