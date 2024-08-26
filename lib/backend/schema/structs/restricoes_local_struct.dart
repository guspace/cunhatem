// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class RestricoesLocalStruct extends FFFirebaseStruct {
  RestricoesLocalStruct({
    bool? descricaoCompleta,
    bool? comodidades,
    bool? contatos,
    bool? funcionamento,
    bool? seloCunhatur,
    int? quantidadeFotos,
    int? quantidadeVideos,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _descricaoCompleta = descricaoCompleta,
        _comodidades = comodidades,
        _contatos = contatos,
        _funcionamento = funcionamento,
        _seloCunhatur = seloCunhatur,
        _quantidadeFotos = quantidadeFotos,
        _quantidadeVideos = quantidadeVideos,
        super(firestoreUtilData);

  // "descricaoCompleta" field.
  bool? _descricaoCompleta;
  bool get descricaoCompleta => _descricaoCompleta ?? false;
  set descricaoCompleta(bool? val) => _descricaoCompleta = val;

  bool hasDescricaoCompleta() => _descricaoCompleta != null;

  // "comodidades" field.
  bool? _comodidades;
  bool get comodidades => _comodidades ?? false;
  set comodidades(bool? val) => _comodidades = val;

  bool hasComodidades() => _comodidades != null;

  // "contatos" field.
  bool? _contatos;
  bool get contatos => _contatos ?? false;
  set contatos(bool? val) => _contatos = val;

  bool hasContatos() => _contatos != null;

  // "funcionamento" field.
  bool? _funcionamento;
  bool get funcionamento => _funcionamento ?? false;
  set funcionamento(bool? val) => _funcionamento = val;

  bool hasFuncionamento() => _funcionamento != null;

  // "seloCunhatur" field.
  bool? _seloCunhatur;
  bool get seloCunhatur => _seloCunhatur ?? false;
  set seloCunhatur(bool? val) => _seloCunhatur = val;

  bool hasSeloCunhatur() => _seloCunhatur != null;

  // "quantidadeFotos" field.
  int? _quantidadeFotos;
  int get quantidadeFotos => _quantidadeFotos ?? 1;
  set quantidadeFotos(int? val) => _quantidadeFotos = val;

  void incrementQuantidadeFotos(int amount) =>
      quantidadeFotos = quantidadeFotos + amount;

  bool hasQuantidadeFotos() => _quantidadeFotos != null;

  // "quantidadeVideos" field.
  int? _quantidadeVideos;
  int get quantidadeVideos => _quantidadeVideos ?? 0;
  set quantidadeVideos(int? val) => _quantidadeVideos = val;

  void incrementQuantidadeVideos(int amount) =>
      quantidadeVideos = quantidadeVideos + amount;

  bool hasQuantidadeVideos() => _quantidadeVideos != null;

  static RestricoesLocalStruct fromMap(Map<String, dynamic> data) =>
      RestricoesLocalStruct(
        descricaoCompleta: data['descricaoCompleta'] as bool?,
        comodidades: data['comodidades'] as bool?,
        contatos: data['contatos'] as bool?,
        funcionamento: data['funcionamento'] as bool?,
        seloCunhatur: data['seloCunhatur'] as bool?,
        quantidadeFotos: castToType<int>(data['quantidadeFotos']),
        quantidadeVideos: castToType<int>(data['quantidadeVideos']),
      );

  static RestricoesLocalStruct? maybeFromMap(dynamic data) => data is Map
      ? RestricoesLocalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'descricaoCompleta': _descricaoCompleta,
        'comodidades': _comodidades,
        'contatos': _contatos,
        'funcionamento': _funcionamento,
        'seloCunhatur': _seloCunhatur,
        'quantidadeFotos': _quantidadeFotos,
        'quantidadeVideos': _quantidadeVideos,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'descricaoCompleta': serializeParam(
          _descricaoCompleta,
          ParamType.bool,
        ),
        'comodidades': serializeParam(
          _comodidades,
          ParamType.bool,
        ),
        'contatos': serializeParam(
          _contatos,
          ParamType.bool,
        ),
        'funcionamento': serializeParam(
          _funcionamento,
          ParamType.bool,
        ),
        'seloCunhatur': serializeParam(
          _seloCunhatur,
          ParamType.bool,
        ),
        'quantidadeFotos': serializeParam(
          _quantidadeFotos,
          ParamType.int,
        ),
        'quantidadeVideos': serializeParam(
          _quantidadeVideos,
          ParamType.int,
        ),
      }.withoutNulls;

  static RestricoesLocalStruct fromSerializableMap(Map<String, dynamic> data) =>
      RestricoesLocalStruct(
        descricaoCompleta: deserializeParam(
          data['descricaoCompleta'],
          ParamType.bool,
          false,
        ),
        comodidades: deserializeParam(
          data['comodidades'],
          ParamType.bool,
          false,
        ),
        contatos: deserializeParam(
          data['contatos'],
          ParamType.bool,
          false,
        ),
        funcionamento: deserializeParam(
          data['funcionamento'],
          ParamType.bool,
          false,
        ),
        seloCunhatur: deserializeParam(
          data['seloCunhatur'],
          ParamType.bool,
          false,
        ),
        quantidadeFotos: deserializeParam(
          data['quantidadeFotos'],
          ParamType.int,
          false,
        ),
        quantidadeVideos: deserializeParam(
          data['quantidadeVideos'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RestricoesLocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RestricoesLocalStruct &&
        descricaoCompleta == other.descricaoCompleta &&
        comodidades == other.comodidades &&
        contatos == other.contatos &&
        funcionamento == other.funcionamento &&
        seloCunhatur == other.seloCunhatur &&
        quantidadeFotos == other.quantidadeFotos &&
        quantidadeVideos == other.quantidadeVideos;
  }

  @override
  int get hashCode => const ListEquality().hash([
        descricaoCompleta,
        comodidades,
        contatos,
        funcionamento,
        seloCunhatur,
        quantidadeFotos,
        quantidadeVideos
      ]);
}

RestricoesLocalStruct createRestricoesLocalStruct({
  bool? descricaoCompleta,
  bool? comodidades,
  bool? contatos,
  bool? funcionamento,
  bool? seloCunhatur,
  int? quantidadeFotos,
  int? quantidadeVideos,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RestricoesLocalStruct(
      descricaoCompleta: descricaoCompleta,
      comodidades: comodidades,
      contatos: contatos,
      funcionamento: funcionamento,
      seloCunhatur: seloCunhatur,
      quantidadeFotos: quantidadeFotos,
      quantidadeVideos: quantidadeVideos,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RestricoesLocalStruct? updateRestricoesLocalStruct(
  RestricoesLocalStruct? restricoesLocal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    restricoesLocal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRestricoesLocalStructData(
  Map<String, dynamic> firestoreData,
  RestricoesLocalStruct? restricoesLocal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (restricoesLocal == null) {
    return;
  }
  if (restricoesLocal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && restricoesLocal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final restricoesLocalData =
      getRestricoesLocalFirestoreData(restricoesLocal, forFieldValue);
  final nestedData =
      restricoesLocalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = restricoesLocal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRestricoesLocalFirestoreData(
  RestricoesLocalStruct? restricoesLocal, [
  bool forFieldValue = false,
]) {
  if (restricoesLocal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(restricoesLocal.toMap());

  // Add any Firestore field values
  restricoesLocal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRestricoesLocalListFirestoreData(
  List<RestricoesLocalStruct>? restricoesLocals,
) =>
    restricoesLocals
        ?.map((e) => getRestricoesLocalFirestoreData(e, true))
        .toList() ??
    [];
