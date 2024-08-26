// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FotosStruct extends FFFirebaseStruct {
  FotosStruct({
    String? image,
    String? blurHash,
    int? order,
    String? legenda,
    String? titulo,
    DocumentReference? refLocal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _blurHash = blurHash,
        _order = order,
        _legenda = legenda,
        _titulo = titulo,
        _refLocal = refLocal,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "blur_hash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;

  bool hasBlurHash() => _blurHash != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "legenda" field.
  String? _legenda;
  String get legenda => _legenda ?? '';
  set legenda(String? val) => _legenda = val;

  bool hasLegenda() => _legenda != null;

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  set titulo(String? val) => _titulo = val;

  bool hasTitulo() => _titulo != null;

  // "refLocal" field.
  DocumentReference? _refLocal;
  DocumentReference? get refLocal => _refLocal;
  set refLocal(DocumentReference? val) => _refLocal = val;

  bool hasRefLocal() => _refLocal != null;

  static FotosStruct fromMap(Map<String, dynamic> data) => FotosStruct(
        image: data['image'] as String?,
        blurHash: data['blur_hash'] as String?,
        order: castToType<int>(data['order']),
        legenda: data['legenda'] as String?,
        titulo: data['titulo'] as String?,
        refLocal: data['refLocal'] as DocumentReference?,
      );

  static FotosStruct? maybeFromMap(dynamic data) =>
      data is Map ? FotosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'blur_hash': _blurHash,
        'order': _order,
        'legenda': _legenda,
        'titulo': _titulo,
        'refLocal': _refLocal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'blur_hash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'legenda': serializeParam(
          _legenda,
          ParamType.String,
        ),
        'titulo': serializeParam(
          _titulo,
          ParamType.String,
        ),
        'refLocal': serializeParam(
          _refLocal,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static FotosStruct fromSerializableMap(Map<String, dynamic> data) =>
      FotosStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blur_hash'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        legenda: deserializeParam(
          data['legenda'],
          ParamType.String,
          false,
        ),
        titulo: deserializeParam(
          data['titulo'],
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
  String toString() => 'FotosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FotosStruct &&
        image == other.image &&
        blurHash == other.blurHash &&
        order == other.order &&
        legenda == other.legenda &&
        titulo == other.titulo &&
        refLocal == other.refLocal;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([image, blurHash, order, legenda, titulo, refLocal]);
}

FotosStruct createFotosStruct({
  String? image,
  String? blurHash,
  int? order,
  String? legenda,
  String? titulo,
  DocumentReference? refLocal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FotosStruct(
      image: image,
      blurHash: blurHash,
      order: order,
      legenda: legenda,
      titulo: titulo,
      refLocal: refLocal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FotosStruct? updateFotosStruct(
  FotosStruct? fotos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    fotos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFotosStructData(
  Map<String, dynamic> firestoreData,
  FotosStruct? fotos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (fotos == null) {
    return;
  }
  if (fotos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && fotos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final fotosData = getFotosFirestoreData(fotos, forFieldValue);
  final nestedData = fotosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = fotos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFotosFirestoreData(
  FotosStruct? fotos, [
  bool forFieldValue = false,
]) {
  if (fotos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(fotos.toMap());

  // Add any Firestore field values
  fotos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFotosListFirestoreData(
  List<FotosStruct>? fotoss,
) =>
    fotoss?.map((e) => getFotosFirestoreData(e, true)).toList() ?? [];
