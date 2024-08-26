// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StoriesCarrosselStruct extends FFFirebaseStruct {
  StoriesCarrosselStruct({
    String? imagem,
    String? legenda,
    int? order,
    bool? visivel,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _imagem = imagem,
        _legenda = legenda,
        _order = order,
        _visivel = visivel,
        super(firestoreUtilData);

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  set imagem(String? val) => _imagem = val;

  bool hasImagem() => _imagem != null;

  // "legenda" field.
  String? _legenda;
  String get legenda => _legenda ?? '';
  set legenda(String? val) => _legenda = val;

  bool hasLegenda() => _legenda != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "visivel" field.
  bool? _visivel;
  bool get visivel => _visivel ?? true;
  set visivel(bool? val) => _visivel = val;

  bool hasVisivel() => _visivel != null;

  static StoriesCarrosselStruct fromMap(Map<String, dynamic> data) =>
      StoriesCarrosselStruct(
        imagem: data['imagem'] as String?,
        legenda: data['legenda'] as String?,
        order: castToType<int>(data['order']),
        visivel: data['visivel'] as bool?,
      );

  static StoriesCarrosselStruct? maybeFromMap(dynamic data) => data is Map
      ? StoriesCarrosselStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'imagem': _imagem,
        'legenda': _legenda,
        'order': _order,
        'visivel': _visivel,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'imagem': serializeParam(
          _imagem,
          ParamType.String,
        ),
        'legenda': serializeParam(
          _legenda,
          ParamType.String,
        ),
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'visivel': serializeParam(
          _visivel,
          ParamType.bool,
        ),
      }.withoutNulls;

  static StoriesCarrosselStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StoriesCarrosselStruct(
        imagem: deserializeParam(
          data['imagem'],
          ParamType.String,
          false,
        ),
        legenda: deserializeParam(
          data['legenda'],
          ParamType.String,
          false,
        ),
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        visivel: deserializeParam(
          data['visivel'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'StoriesCarrosselStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StoriesCarrosselStruct &&
        imagem == other.imagem &&
        legenda == other.legenda &&
        order == other.order &&
        visivel == other.visivel;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([imagem, legenda, order, visivel]);
}

StoriesCarrosselStruct createStoriesCarrosselStruct({
  String? imagem,
  String? legenda,
  int? order,
  bool? visivel,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StoriesCarrosselStruct(
      imagem: imagem,
      legenda: legenda,
      order: order,
      visivel: visivel,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StoriesCarrosselStruct? updateStoriesCarrosselStruct(
  StoriesCarrosselStruct? storiesCarrossel, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    storiesCarrossel
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStoriesCarrosselStructData(
  Map<String, dynamic> firestoreData,
  StoriesCarrosselStruct? storiesCarrossel,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (storiesCarrossel == null) {
    return;
  }
  if (storiesCarrossel.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && storiesCarrossel.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final storiesCarrosselData =
      getStoriesCarrosselFirestoreData(storiesCarrossel, forFieldValue);
  final nestedData =
      storiesCarrosselData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = storiesCarrossel.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStoriesCarrosselFirestoreData(
  StoriesCarrosselStruct? storiesCarrossel, [
  bool forFieldValue = false,
]) {
  if (storiesCarrossel == null) {
    return {};
  }
  final firestoreData = mapToFirestore(storiesCarrossel.toMap());

  // Add any Firestore field values
  storiesCarrossel.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStoriesCarrosselListFirestoreData(
  List<StoriesCarrosselStruct>? storiesCarrossels,
) =>
    storiesCarrossels
        ?.map((e) => getStoriesCarrosselFirestoreData(e, true))
        .toList() ??
    [];
