import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlanosRecord extends FirestoreRecord {
  PlanosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "restricoes_usuario" field.
  RestricoesUsuarioStruct? _restricoesUsuario;
  RestricoesUsuarioStruct get restricoesUsuario =>
      _restricoesUsuario ?? RestricoesUsuarioStruct();
  bool hasRestricoesUsuario() => _restricoesUsuario != null;

  // "restricoes_local" field.
  RestricoesLocalStruct? _restricoesLocal;
  RestricoesLocalStruct get restricoesLocal =>
      _restricoesLocal ?? RestricoesLocalStruct();
  bool hasRestricoesLocal() => _restricoesLocal != null;

  // "restricoes_eventos" field.
  RestricoesEventosStruct? _restricoesEventos;
  RestricoesEventosStruct get restricoesEventos =>
      _restricoesEventos ?? RestricoesEventosStruct();
  bool hasRestricoesEventos() => _restricoesEventos != null;

  // "restricoes_experiencias" field.
  RestricoesExperienciasStruct? _restricoesExperiencias;
  RestricoesExperienciasStruct get restricoesExperiencias =>
      _restricoesExperiencias ?? RestricoesExperienciasStruct();
  bool hasRestricoesExperiencias() => _restricoesExperiencias != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "modificacoes_logs" field.
  List<ModificadoLogStruct>? _modificacoesLogs;
  List<ModificadoLogStruct> get modificacoesLogs =>
      _modificacoesLogs ?? const [];
  bool hasModificacoesLogs() => _modificacoesLogs != null;

  // "arquivado" field.
  bool? _arquivado;
  bool get arquivado => _arquivado ?? false;
  bool hasArquivado() => _arquivado != null;

  // "valor_mensal" field.
  int? _valorMensal;
  int get valorMensal => _valorMensal ?? 0;
  bool hasValorMensal() => _valorMensal != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _restricoesUsuario = RestricoesUsuarioStruct.maybeFromMap(
        snapshotData['restricoes_usuario']);
    _restricoesLocal =
        RestricoesLocalStruct.maybeFromMap(snapshotData['restricoes_local']);
    _restricoesEventos = RestricoesEventosStruct.maybeFromMap(
        snapshotData['restricoes_eventos']);
    _restricoesExperiencias = RestricoesExperienciasStruct.maybeFromMap(
        snapshotData['restricoes_experiencias']);
    _criadoEm = snapshotData['criado_em'] as DateTime?;
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _modificacoesLogs = getStructList(
      snapshotData['modificacoes_logs'],
      ModificadoLogStruct.fromMap,
    );
    _arquivado = snapshotData['arquivado'] as bool?;
    _valorMensal = castToType<int>(snapshotData['valor_mensal']);
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('planos');

  static Stream<PlanosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanosRecord.fromSnapshot(s));

  static Future<PlanosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanosRecord.fromSnapshot(s));

  static PlanosRecord fromSnapshot(DocumentSnapshot snapshot) => PlanosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanosRecordData({
  String? nome,
  String? descricao,
  RestricoesUsuarioStruct? restricoesUsuario,
  RestricoesLocalStruct? restricoesLocal,
  RestricoesEventosStruct? restricoesEventos,
  RestricoesExperienciasStruct? restricoesExperiencias,
  DateTime? criadoEm,
  DocumentReference? criadoPor,
  bool? arquivado,
  int? valorMensal,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'restricoes_usuario': RestricoesUsuarioStruct().toMap(),
      'restricoes_local': RestricoesLocalStruct().toMap(),
      'restricoes_eventos': RestricoesEventosStruct().toMap(),
      'restricoes_experiencias': RestricoesExperienciasStruct().toMap(),
      'criado_em': criadoEm,
      'criado_por': criadoPor,
      'arquivado': arquivado,
      'valor_mensal': valorMensal,
      'id': id,
    }.withoutNulls,
  );

  // Handle nested data for "restricoes_usuario" field.
  addRestricoesUsuarioStructData(
      firestoreData, restricoesUsuario, 'restricoes_usuario');

  // Handle nested data for "restricoes_local" field.
  addRestricoesLocalStructData(
      firestoreData, restricoesLocal, 'restricoes_local');

  // Handle nested data for "restricoes_eventos" field.
  addRestricoesEventosStructData(
      firestoreData, restricoesEventos, 'restricoes_eventos');

  // Handle nested data for "restricoes_experiencias" field.
  addRestricoesExperienciasStructData(
      firestoreData, restricoesExperiencias, 'restricoes_experiencias');

  return firestoreData;
}

class PlanosRecordDocumentEquality implements Equality<PlanosRecord> {
  const PlanosRecordDocumentEquality();

  @override
  bool equals(PlanosRecord? e1, PlanosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.restricoesUsuario == e2?.restricoesUsuario &&
        e1?.restricoesLocal == e2?.restricoesLocal &&
        e1?.restricoesEventos == e2?.restricoesEventos &&
        e1?.restricoesExperiencias == e2?.restricoesExperiencias &&
        e1?.criadoEm == e2?.criadoEm &&
        e1?.criadoPor == e2?.criadoPor &&
        listEquality.equals(e1?.modificacoesLogs, e2?.modificacoesLogs) &&
        e1?.arquivado == e2?.arquivado &&
        e1?.valorMensal == e2?.valorMensal &&
        e1?.id == e2?.id;
  }

  @override
  int hash(PlanosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.descricao,
        e?.restricoesUsuario,
        e?.restricoesLocal,
        e?.restricoesEventos,
        e?.restricoesExperiencias,
        e?.criadoEm,
        e?.criadoPor,
        e?.modificacoesLogs,
        e?.arquivado,
        e?.valorMensal,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is PlanosRecord;
}
