// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ModificadoLogStruct extends FFFirebaseStruct {
  ModificadoLogStruct({
    DateTime? quando,
    DocumentReference? quem,
    String? oque,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _quando = quando,
        _quem = quem,
        _oque = oque,
        super(firestoreUtilData);

  // "quando" field.
  DateTime? _quando;
  DateTime? get quando => _quando;
  set quando(DateTime? val) => _quando = val;

  bool hasQuando() => _quando != null;

  // "quem" field.
  DocumentReference? _quem;
  DocumentReference? get quem => _quem;
  set quem(DocumentReference? val) => _quem = val;

  bool hasQuem() => _quem != null;

  // "oque" field.
  String? _oque;
  String get oque => _oque ?? '';
  set oque(String? val) => _oque = val;

  bool hasOque() => _oque != null;

  static ModificadoLogStruct fromMap(Map<String, dynamic> data) =>
      ModificadoLogStruct(
        quando: data['quando'] as DateTime?,
        quem: data['quem'] as DocumentReference?,
        oque: data['oque'] as String?,
      );

  static ModificadoLogStruct? maybeFromMap(dynamic data) => data is Map
      ? ModificadoLogStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'quando': _quando,
        'quem': _quem,
        'oque': _oque,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quando': serializeParam(
          _quando,
          ParamType.DateTime,
        ),
        'quem': serializeParam(
          _quem,
          ParamType.DocumentReference,
        ),
        'oque': serializeParam(
          _oque,
          ParamType.String,
        ),
      }.withoutNulls;

  static ModificadoLogStruct fromSerializableMap(Map<String, dynamic> data) =>
      ModificadoLogStruct(
        quando: deserializeParam(
          data['quando'],
          ParamType.DateTime,
          false,
        ),
        quem: deserializeParam(
          data['quem'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        oque: deserializeParam(
          data['oque'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ModificadoLogStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ModificadoLogStruct &&
        quando == other.quando &&
        quem == other.quem &&
        oque == other.oque;
  }

  @override
  int get hashCode => const ListEquality().hash([quando, quem, oque]);
}

ModificadoLogStruct createModificadoLogStruct({
  DateTime? quando,
  DocumentReference? quem,
  String? oque,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ModificadoLogStruct(
      quando: quando,
      quem: quem,
      oque: oque,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ModificadoLogStruct? updateModificadoLogStruct(
  ModificadoLogStruct? modificadoLog, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    modificadoLog
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addModificadoLogStructData(
  Map<String, dynamic> firestoreData,
  ModificadoLogStruct? modificadoLog,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (modificadoLog == null) {
    return;
  }
  if (modificadoLog.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && modificadoLog.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final modificadoLogData =
      getModificadoLogFirestoreData(modificadoLog, forFieldValue);
  final nestedData =
      modificadoLogData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = modificadoLog.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getModificadoLogFirestoreData(
  ModificadoLogStruct? modificadoLog, [
  bool forFieldValue = false,
]) {
  if (modificadoLog == null) {
    return {};
  }
  final firestoreData = mapToFirestore(modificadoLog.toMap());

  // Add any Firestore field values
  modificadoLog.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getModificadoLogListFirestoreData(
  List<ModificadoLogStruct>? modificadoLogs,
) =>
    modificadoLogs
        ?.map((e) => getModificadoLogFirestoreData(e, true))
        .toList() ??
    [];
