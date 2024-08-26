// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class VinculoLocalStruct extends FFFirebaseStruct {
  VinculoLocalStruct({
    String? nome,
    DocumentReference? refLocal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _refLocal = refLocal,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "refLocal" field.
  DocumentReference? _refLocal;
  DocumentReference? get refLocal => _refLocal;
  set refLocal(DocumentReference? val) => _refLocal = val;

  bool hasRefLocal() => _refLocal != null;

  static VinculoLocalStruct fromMap(Map<String, dynamic> data) =>
      VinculoLocalStruct(
        nome: data['nome'] as String?,
        refLocal: data['refLocal'] as DocumentReference?,
      );

  static VinculoLocalStruct? maybeFromMap(dynamic data) => data is Map
      ? VinculoLocalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'refLocal': _refLocal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'refLocal': serializeParam(
          _refLocal,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static VinculoLocalStruct fromSerializableMap(Map<String, dynamic> data) =>
      VinculoLocalStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        refLocal: deserializeParam(
          data['refLocal'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['locais'],
        ),
      );

  @override
  String toString() => 'VinculoLocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VinculoLocalStruct &&
        nome == other.nome &&
        refLocal == other.refLocal;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, refLocal]);
}

VinculoLocalStruct createVinculoLocalStruct({
  String? nome,
  DocumentReference? refLocal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VinculoLocalStruct(
      nome: nome,
      refLocal: refLocal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VinculoLocalStruct? updateVinculoLocalStruct(
  VinculoLocalStruct? vinculoLocal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    vinculoLocal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVinculoLocalStructData(
  Map<String, dynamic> firestoreData,
  VinculoLocalStruct? vinculoLocal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (vinculoLocal == null) {
    return;
  }
  if (vinculoLocal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && vinculoLocal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final vinculoLocalData =
      getVinculoLocalFirestoreData(vinculoLocal, forFieldValue);
  final nestedData =
      vinculoLocalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = vinculoLocal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVinculoLocalFirestoreData(
  VinculoLocalStruct? vinculoLocal, [
  bool forFieldValue = false,
]) {
  if (vinculoLocal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(vinculoLocal.toMap());

  // Add any Firestore field values
  vinculoLocal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVinculoLocalListFirestoreData(
  List<VinculoLocalStruct>? vinculoLocals,
) =>
    vinculoLocals?.map((e) => getVinculoLocalFirestoreData(e, true)).toList() ??
    [];
