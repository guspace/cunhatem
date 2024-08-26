// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SelosStruct extends FFFirebaseStruct {
  SelosStruct({
    String? nome,
    String? image,
    bool? visivel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nome = nome,
        _image = image,
        _visivel = visivel,
        super(firestoreUtilData);

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "visivel" field.
  bool? _visivel;
  bool get visivel => _visivel ?? true;
  set visivel(bool? val) => _visivel = val;

  bool hasVisivel() => _visivel != null;

  static SelosStruct fromMap(Map<String, dynamic> data) => SelosStruct(
        nome: data['nome'] as String?,
        image: data['image'] as String?,
        visivel: data['visivel'] as bool?,
      );

  static SelosStruct? maybeFromMap(dynamic data) =>
      data is Map ? SelosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'nome': _nome,
        'image': _image,
        'visivel': _visivel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'visivel': serializeParam(
          _visivel,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SelosStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelosStruct(
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        visivel: deserializeParam(
          data['visivel'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SelosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelosStruct &&
        nome == other.nome &&
        image == other.image &&
        visivel == other.visivel;
  }

  @override
  int get hashCode => const ListEquality().hash([nome, image, visivel]);
}

SelosStruct createSelosStruct({
  String? nome,
  String? image,
  bool? visivel,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelosStruct(
      nome: nome,
      image: image,
      visivel: visivel,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelosStruct? updateSelosStruct(
  SelosStruct? selos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelosStructData(
  Map<String, dynamic> firestoreData,
  SelosStruct? selos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selos == null) {
    return;
  }
  if (selos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selosData = getSelosFirestoreData(selos, forFieldValue);
  final nestedData = selosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelosFirestoreData(
  SelosStruct? selos, [
  bool forFieldValue = false,
]) {
  if (selos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selos.toMap());

  // Add any Firestore field values
  selos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelosListFirestoreData(
  List<SelosStruct>? seloss,
) =>
    seloss?.map((e) => getSelosFirestoreData(e, true)).toList() ?? [];
