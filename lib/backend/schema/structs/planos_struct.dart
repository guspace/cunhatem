// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanosStruct extends FFFirebaseStruct {
  PlanosStruct({
    DocumentReference? id,
    String? nome,
    String? descricao,
    RestricoesUsuarioStruct? restricoesUsuario,
    RestricoesLocalStruct? restricoesLocal,
    RestricoesEventosStruct? restricoesEvento,
    RestricoesExperienciasStruct? restricoesExperiencias,
    DateTime? criadoEm,
    DocumentReference? criadoPor,
    List<ModificadoLogStruct>? modificacoesLog,
    int? valorMensal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _nome = nome,
        _descricao = descricao,
        _restricoesUsuario = restricoesUsuario,
        _restricoesLocal = restricoesLocal,
        _restricoesEvento = restricoesEvento,
        _restricoesExperiencias = restricoesExperiencias,
        _criadoEm = criadoEm,
        _criadoPor = criadoPor,
        _modificacoesLog = modificacoesLog,
        _valorMensal = valorMensal,
        super(firestoreUtilData);

  // "id" field.
  DocumentReference? _id;
  DocumentReference? get id => _id;
  set id(DocumentReference? val) => _id = val;

  bool hasId() => _id != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "restricoes_usuario" field.
  RestricoesUsuarioStruct? _restricoesUsuario;
  RestricoesUsuarioStruct get restricoesUsuario =>
      _restricoesUsuario ?? RestricoesUsuarioStruct();
  set restricoesUsuario(RestricoesUsuarioStruct? val) =>
      _restricoesUsuario = val;

  void updateRestricoesUsuario(Function(RestricoesUsuarioStruct) updateFn) {
    updateFn(_restricoesUsuario ??= RestricoesUsuarioStruct());
  }

  bool hasRestricoesUsuario() => _restricoesUsuario != null;

  // "restricoes_local" field.
  RestricoesLocalStruct? _restricoesLocal;
  RestricoesLocalStruct get restricoesLocal =>
      _restricoesLocal ?? RestricoesLocalStruct();
  set restricoesLocal(RestricoesLocalStruct? val) => _restricoesLocal = val;

  void updateRestricoesLocal(Function(RestricoesLocalStruct) updateFn) {
    updateFn(_restricoesLocal ??= RestricoesLocalStruct());
  }

  bool hasRestricoesLocal() => _restricoesLocal != null;

  // "restricoes_evento" field.
  RestricoesEventosStruct? _restricoesEvento;
  RestricoesEventosStruct get restricoesEvento =>
      _restricoesEvento ?? RestricoesEventosStruct();
  set restricoesEvento(RestricoesEventosStruct? val) => _restricoesEvento = val;

  void updateRestricoesEvento(Function(RestricoesEventosStruct) updateFn) {
    updateFn(_restricoesEvento ??= RestricoesEventosStruct());
  }

  bool hasRestricoesEvento() => _restricoesEvento != null;

  // "restricoes_experiencias" field.
  RestricoesExperienciasStruct? _restricoesExperiencias;
  RestricoesExperienciasStruct get restricoesExperiencias =>
      _restricoesExperiencias ?? RestricoesExperienciasStruct();
  set restricoesExperiencias(RestricoesExperienciasStruct? val) =>
      _restricoesExperiencias = val;

  void updateRestricoesExperiencias(
      Function(RestricoesExperienciasStruct) updateFn) {
    updateFn(_restricoesExperiencias ??= RestricoesExperienciasStruct());
  }

  bool hasRestricoesExperiencias() => _restricoesExperiencias != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  set criadoEm(DateTime? val) => _criadoEm = val;

  bool hasCriadoEm() => _criadoEm != null;

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  set criadoPor(DocumentReference? val) => _criadoPor = val;

  bool hasCriadoPor() => _criadoPor != null;

  // "modificacoes_log" field.
  List<ModificadoLogStruct>? _modificacoesLog;
  List<ModificadoLogStruct> get modificacoesLog => _modificacoesLog ?? const [];
  set modificacoesLog(List<ModificadoLogStruct>? val) => _modificacoesLog = val;

  void updateModificacoesLog(Function(List<ModificadoLogStruct>) updateFn) {
    updateFn(_modificacoesLog ??= []);
  }

  bool hasModificacoesLog() => _modificacoesLog != null;

  // "valor_mensal" field.
  int? _valorMensal;
  int get valorMensal => _valorMensal ?? 0;
  set valorMensal(int? val) => _valorMensal = val;

  void incrementValorMensal(int amount) => valorMensal = valorMensal + amount;

  bool hasValorMensal() => _valorMensal != null;

  static PlanosStruct fromMap(Map<String, dynamic> data) => PlanosStruct(
        id: data['id'] as DocumentReference?,
        nome: data['nome'] as String?,
        descricao: data['descricao'] as String?,
        restricoesUsuario:
            RestricoesUsuarioStruct.maybeFromMap(data['restricoes_usuario']),
        restricoesLocal:
            RestricoesLocalStruct.maybeFromMap(data['restricoes_local']),
        restricoesEvento:
            RestricoesEventosStruct.maybeFromMap(data['restricoes_evento']),
        restricoesExperiencias: RestricoesExperienciasStruct.maybeFromMap(
            data['restricoes_experiencias']),
        criadoEm: data['criado_em'] as DateTime?,
        criadoPor: data['criado_por'] as DocumentReference?,
        modificacoesLog: getStructList(
          data['modificacoes_log'],
          ModificadoLogStruct.fromMap,
        ),
        valorMensal: castToType<int>(data['valor_mensal']),
      );

  static PlanosStruct? maybeFromMap(dynamic data) =>
      data is Map ? PlanosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome': _nome,
        'descricao': _descricao,
        'restricoes_usuario': _restricoesUsuario?.toMap(),
        'restricoes_local': _restricoesLocal?.toMap(),
        'restricoes_evento': _restricoesEvento?.toMap(),
        'restricoes_experiencias': _restricoesExperiencias?.toMap(),
        'criado_em': _criadoEm,
        'criado_por': _criadoPor,
        'modificacoes_log': _modificacoesLog?.map((e) => e.toMap()).toList(),
        'valor_mensal': _valorMensal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.DocumentReference,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'restricoes_usuario': serializeParam(
          _restricoesUsuario,
          ParamType.DataStruct,
        ),
        'restricoes_local': serializeParam(
          _restricoesLocal,
          ParamType.DataStruct,
        ),
        'restricoes_evento': serializeParam(
          _restricoesEvento,
          ParamType.DataStruct,
        ),
        'restricoes_experiencias': serializeParam(
          _restricoesExperiencias,
          ParamType.DataStruct,
        ),
        'criado_em': serializeParam(
          _criadoEm,
          ParamType.DateTime,
        ),
        'criado_por': serializeParam(
          _criadoPor,
          ParamType.DocumentReference,
        ),
        'modificacoes_log': serializeParam(
          _modificacoesLog,
          ParamType.DataStruct,
          isList: true,
        ),
        'valor_mensal': serializeParam(
          _valorMensal,
          ParamType.int,
        ),
      }.withoutNulls;

  static PlanosStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlanosStruct(
        id: deserializeParam(
          data['id'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['planos'],
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        restricoesUsuario: deserializeStructParam(
          data['restricoes_usuario'],
          ParamType.DataStruct,
          false,
          structBuilder: RestricoesUsuarioStruct.fromSerializableMap,
        ),
        restricoesLocal: deserializeStructParam(
          data['restricoes_local'],
          ParamType.DataStruct,
          false,
          structBuilder: RestricoesLocalStruct.fromSerializableMap,
        ),
        restricoesEvento: deserializeStructParam(
          data['restricoes_evento'],
          ParamType.DataStruct,
          false,
          structBuilder: RestricoesEventosStruct.fromSerializableMap,
        ),
        restricoesExperiencias: deserializeStructParam(
          data['restricoes_experiencias'],
          ParamType.DataStruct,
          false,
          structBuilder: RestricoesExperienciasStruct.fromSerializableMap,
        ),
        criadoEm: deserializeParam(
          data['criado_em'],
          ParamType.DateTime,
          false,
        ),
        criadoPor: deserializeParam(
          data['criado_por'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        modificacoesLog: deserializeStructParam<ModificadoLogStruct>(
          data['modificacoes_log'],
          ParamType.DataStruct,
          true,
          structBuilder: ModificadoLogStruct.fromSerializableMap,
        ),
        valorMensal: deserializeParam(
          data['valor_mensal'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PlanosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlanosStruct &&
        id == other.id &&
        nome == other.nome &&
        descricao == other.descricao &&
        restricoesUsuario == other.restricoesUsuario &&
        restricoesLocal == other.restricoesLocal &&
        restricoesEvento == other.restricoesEvento &&
        restricoesExperiencias == other.restricoesExperiencias &&
        criadoEm == other.criadoEm &&
        criadoPor == other.criadoPor &&
        listEquality.equals(modificacoesLog, other.modificacoesLog) &&
        valorMensal == other.valorMensal;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nome,
        descricao,
        restricoesUsuario,
        restricoesLocal,
        restricoesEvento,
        restricoesExperiencias,
        criadoEm,
        criadoPor,
        modificacoesLog,
        valorMensal
      ]);
}

PlanosStruct createPlanosStruct({
  DocumentReference? id,
  String? nome,
  String? descricao,
  RestricoesUsuarioStruct? restricoesUsuario,
  RestricoesLocalStruct? restricoesLocal,
  RestricoesEventosStruct? restricoesEvento,
  RestricoesExperienciasStruct? restricoesExperiencias,
  DateTime? criadoEm,
  DocumentReference? criadoPor,
  int? valorMensal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlanosStruct(
      id: id,
      nome: nome,
      descricao: descricao,
      restricoesUsuario: restricoesUsuario ??
          (clearUnsetFields ? RestricoesUsuarioStruct() : null),
      restricoesLocal: restricoesLocal ??
          (clearUnsetFields ? RestricoesLocalStruct() : null),
      restricoesEvento: restricoesEvento ??
          (clearUnsetFields ? RestricoesEventosStruct() : null),
      restricoesExperiencias: restricoesExperiencias ??
          (clearUnsetFields ? RestricoesExperienciasStruct() : null),
      criadoEm: criadoEm,
      criadoPor: criadoPor,
      valorMensal: valorMensal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlanosStruct? updatePlanosStruct(
  PlanosStruct? planos, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    planos
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlanosStructData(
  Map<String, dynamic> firestoreData,
  PlanosStruct? planos,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (planos == null) {
    return;
  }
  if (planos.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && planos.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final planosData = getPlanosFirestoreData(planos, forFieldValue);
  final nestedData = planosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = planos.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlanosFirestoreData(
  PlanosStruct? planos, [
  bool forFieldValue = false,
]) {
  if (planos == null) {
    return {};
  }
  final firestoreData = mapToFirestore(planos.toMap());

  // Handle nested data for "restricoes_usuario" field.
  addRestricoesUsuarioStructData(
    firestoreData,
    planos.hasRestricoesUsuario() ? planos.restricoesUsuario : null,
    'restricoes_usuario',
    forFieldValue,
  );

  // Handle nested data for "restricoes_local" field.
  addRestricoesLocalStructData(
    firestoreData,
    planos.hasRestricoesLocal() ? planos.restricoesLocal : null,
    'restricoes_local',
    forFieldValue,
  );

  // Handle nested data for "restricoes_evento" field.
  addRestricoesEventosStructData(
    firestoreData,
    planos.hasRestricoesEvento() ? planos.restricoesEvento : null,
    'restricoes_evento',
    forFieldValue,
  );

  // Handle nested data for "restricoes_experiencias" field.
  addRestricoesExperienciasStructData(
    firestoreData,
    planos.hasRestricoesExperiencias() ? planos.restricoesExperiencias : null,
    'restricoes_experiencias',
    forFieldValue,
  );

  // Add any Firestore field values
  planos.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlanosListFirestoreData(
  List<PlanosStruct>? planoss,
) =>
    planoss?.map((e) => getPlanosFirestoreData(e, true)).toList() ?? [];
