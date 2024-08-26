// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FaqStruct extends FFFirebaseStruct {
  FaqStruct({
    int? order,
    String? pergunta,
    String? resposta,
    String? link,
    bool? mostrar,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _order = order,
        _pergunta = pergunta,
        _resposta = resposta,
        _link = link,
        _mostrar = mostrar,
        super(firestoreUtilData);

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  set order(int? val) => _order = val;

  void incrementOrder(int amount) => order = order + amount;

  bool hasOrder() => _order != null;

  // "pergunta" field.
  String? _pergunta;
  String get pergunta => _pergunta ?? '';
  set pergunta(String? val) => _pergunta = val;

  bool hasPergunta() => _pergunta != null;

  // "resposta" field.
  String? _resposta;
  String get resposta => _resposta ?? '';
  set resposta(String? val) => _resposta = val;

  bool hasResposta() => _resposta != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "mostrar" field.
  bool? _mostrar;
  bool get mostrar => _mostrar ?? true;
  set mostrar(bool? val) => _mostrar = val;

  bool hasMostrar() => _mostrar != null;

  static FaqStruct fromMap(Map<String, dynamic> data) => FaqStruct(
        order: castToType<int>(data['order']),
        pergunta: data['pergunta'] as String?,
        resposta: data['resposta'] as String?,
        link: data['link'] as String?,
        mostrar: data['mostrar'] as bool?,
      );

  static FaqStruct? maybeFromMap(dynamic data) =>
      data is Map ? FaqStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'order': _order,
        'pergunta': _pergunta,
        'resposta': _resposta,
        'link': _link,
        'mostrar': _mostrar,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'order': serializeParam(
          _order,
          ParamType.int,
        ),
        'pergunta': serializeParam(
          _pergunta,
          ParamType.String,
        ),
        'resposta': serializeParam(
          _resposta,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'mostrar': serializeParam(
          _mostrar,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FaqStruct fromSerializableMap(Map<String, dynamic> data) => FaqStruct(
        order: deserializeParam(
          data['order'],
          ParamType.int,
          false,
        ),
        pergunta: deserializeParam(
          data['pergunta'],
          ParamType.String,
          false,
        ),
        resposta: deserializeParam(
          data['resposta'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        mostrar: deserializeParam(
          data['mostrar'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FaqStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FaqStruct &&
        order == other.order &&
        pergunta == other.pergunta &&
        resposta == other.resposta &&
        link == other.link &&
        mostrar == other.mostrar;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([order, pergunta, resposta, link, mostrar]);
}

FaqStruct createFaqStruct({
  int? order,
  String? pergunta,
  String? resposta,
  String? link,
  bool? mostrar,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FaqStruct(
      order: order,
      pergunta: pergunta,
      resposta: resposta,
      link: link,
      mostrar: mostrar,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FaqStruct? updateFaqStruct(
  FaqStruct? faq, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    faq
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFaqStructData(
  Map<String, dynamic> firestoreData,
  FaqStruct? faq,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (faq == null) {
    return;
  }
  if (faq.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && faq.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final faqData = getFaqFirestoreData(faq, forFieldValue);
  final nestedData = faqData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = faq.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFaqFirestoreData(
  FaqStruct? faq, [
  bool forFieldValue = false,
]) {
  if (faq == null) {
    return {};
  }
  final firestoreData = mapToFirestore(faq.toMap());

  // Add any Firestore field values
  faq.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFaqListFirestoreData(
  List<FaqStruct>? faqs,
) =>
    faqs?.map((e) => getFaqFirestoreData(e, true)).toList() ?? [];
