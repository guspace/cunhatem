import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SuporteRecord extends FirestoreRecord {
  SuporteRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tipo" field.
  SuporteTipo? _tipo;
  SuporteTipo? get tipo => _tipo;
  bool hasTipo() => _tipo != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "requisicao_texto" field.
  String? _requisicaoTexto;
  String get requisicaoTexto => _requisicaoTexto ?? '';
  bool hasRequisicaoTexto() => _requisicaoTexto != null;

  // "enviado_em" field.
  DateTime? _enviadoEm;
  DateTime? get enviadoEm => _enviadoEm;
  bool hasEnviadoEm() => _enviadoEm != null;

  // "enviado_por" field.
  DocumentReference? _enviadoPor;
  DocumentReference? get enviadoPor => _enviadoPor;
  bool hasEnviadoPor() => _enviadoPor != null;

  // "info_dispositivo" field.
  String? _infoDispositivo;
  String get infoDispositivo => _infoDispositivo ?? '';
  bool hasInfoDispositivo() => _infoDispositivo != null;

  // "status" field.
  StatusSuporte? _status;
  StatusSuporte? get status => _status;
  bool hasStatus() => _status != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "telefone1" field.
  String? _telefone1;
  String get telefone1 => _telefone1 ?? '';
  bool hasTelefone1() => _telefone1 != null;

  void _initializeFields() {
    _tipo = deserializeEnum<SuporteTipo>(snapshotData['tipo']);
    _email = snapshotData['email'] as String?;
    _requisicaoTexto = snapshotData['requisicao_texto'] as String?;
    _enviadoEm = snapshotData['enviado_em'] as DateTime?;
    _enviadoPor = snapshotData['enviado_por'] as DocumentReference?;
    _infoDispositivo = snapshotData['info_dispositivo'] as String?;
    _status = deserializeEnum<StatusSuporte>(snapshotData['status']);
    _id = snapshotData['id'] as String?;
    _telefone1 = snapshotData['telefone1'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('suporte');

  static Stream<SuporteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SuporteRecord.fromSnapshot(s));

  static Future<SuporteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SuporteRecord.fromSnapshot(s));

  static SuporteRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SuporteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SuporteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SuporteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SuporteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SuporteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSuporteRecordData({
  SuporteTipo? tipo,
  String? email,
  String? requisicaoTexto,
  DateTime? enviadoEm,
  DocumentReference? enviadoPor,
  String? infoDispositivo,
  StatusSuporte? status,
  String? id,
  String? telefone1,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tipo': tipo,
      'email': email,
      'requisicao_texto': requisicaoTexto,
      'enviado_em': enviadoEm,
      'enviado_por': enviadoPor,
      'info_dispositivo': infoDispositivo,
      'status': status,
      'id': id,
      'telefone1': telefone1,
    }.withoutNulls,
  );

  return firestoreData;
}

class SuporteRecordDocumentEquality implements Equality<SuporteRecord> {
  const SuporteRecordDocumentEquality();

  @override
  bool equals(SuporteRecord? e1, SuporteRecord? e2) {
    return e1?.tipo == e2?.tipo &&
        e1?.email == e2?.email &&
        e1?.requisicaoTexto == e2?.requisicaoTexto &&
        e1?.enviadoEm == e2?.enviadoEm &&
        e1?.enviadoPor == e2?.enviadoPor &&
        e1?.infoDispositivo == e2?.infoDispositivo &&
        e1?.status == e2?.status &&
        e1?.id == e2?.id &&
        e1?.telefone1 == e2?.telefone1;
  }

  @override
  int hash(SuporteRecord? e) => const ListEquality().hash([
        e?.tipo,
        e?.email,
        e?.requisicaoTexto,
        e?.enviadoEm,
        e?.enviadoPor,
        e?.infoDispositivo,
        e?.status,
        e?.id,
        e?.telefone1
      ]);

  @override
  bool isValidKey(Object? o) => o is SuporteRecord;
}
