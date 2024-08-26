// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ComodidadesStruct extends FFFirebaseStruct {
  ComodidadesStruct({
    String? id,
    String? nome,
    String? icon,
    String? idCategoria,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nome = nome,
        _icon = icon,
        _idCategoria = idCategoria,
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

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "id_categoria" field.
  String? _idCategoria;
  String get idCategoria => _idCategoria ?? '';
  set idCategoria(String? val) => _idCategoria = val;

  bool hasIdCategoria() => _idCategoria != null;

  static ComodidadesStruct fromMap(Map<String, dynamic> data) =>
      ComodidadesStruct(
        id: data['id'] as String?,
        nome: data['nome'] as String?,
        icon: data['icon'] as String?,
        idCategoria: data['id_categoria'] as String?,
      );

  static ComodidadesStruct? maybeFromMap(dynamic data) => data is Map
      ? ComodidadesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'icon': _icon,
        'id_categoria': _idCategoria,
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
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'id_categoria': serializeParam(
          _idCategoria,
          ParamType.String,
        ),
      }.withoutNulls;

  static ComodidadesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ComodidadesStruct(
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
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        idCategoria: deserializeParam(
          data['id_categoria'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ComodidadesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ComodidadesStruct &&
        id == other.id &&
        nome == other.nome &&
        icon == other.icon &&
        idCategoria == other.idCategoria;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nome, icon, idCategoria]);
}

ComodidadesStruct createComodidadesStruct({
  String? id,
  String? nome,
  String? icon,
  String? idCategoria,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ComodidadesStruct(
      id: id,
      nome: nome,
      icon: icon,
      idCategoria: idCategoria,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ComodidadesStruct? updateComodidadesStruct(
  ComodidadesStruct? comodidades, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comodidades
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addComodidadesStructData(
  Map<String, dynamic> firestoreData,
  ComodidadesStruct? comodidades,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comodidades == null) {
    return;
  }
  if (comodidades.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comodidades.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final comodidadesData =
      getComodidadesFirestoreData(comodidades, forFieldValue);
  final nestedData =
      comodidadesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comodidades.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getComodidadesFirestoreData(
  ComodidadesStruct? comodidades, [
  bool forFieldValue = false,
]) {
  if (comodidades == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comodidades.toMap());

  // Add any Firestore field values
  comodidades.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getComodidadesListFirestoreData(
  List<ComodidadesStruct>? comodidadess,
) =>
    comodidadess?.map((e) => getComodidadesFirestoreData(e, true)).toList() ??
    [];
