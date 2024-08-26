import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppConfiguracoesRecord extends FirestoreRecord {
  AppConfiguracoesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "categorias" field.
  List<CategoriasStruct>? _categorias;
  List<CategoriasStruct> get categorias => _categorias ?? const [];
  bool hasCategorias() => _categorias != null;

  // "subCategorias" field.
  List<SubCategoriasStruct>? _subCategorias;
  List<SubCategoriasStruct> get subCategorias => _subCategorias ?? const [];
  bool hasSubCategorias() => _subCategorias != null;

  // "comodidades_geral" field.
  List<ComodidadesStruct>? _comodidadesGeral;
  List<ComodidadesStruct> get comodidadesGeral => _comodidadesGeral ?? const [];
  bool hasComodidadesGeral() => _comodidadesGeral != null;

  // "storiesHome" field.
  List<FotosStruct>? _storiesHome;
  List<FotosStruct> get storiesHome => _storiesHome ?? const [];
  bool hasStoriesHome() => _storiesHome != null;

  // "perguntasFrequentes" field.
  List<FaqStruct>? _perguntasFrequentes;
  List<FaqStruct> get perguntasFrequentes => _perguntasFrequentes ?? const [];
  bool hasPerguntasFrequentes() => _perguntasFrequentes != null;

  // "termos_uso" field.
  String? _termosUso;
  String get termosUso => _termosUso ?? '';
  bool hasTermosUso() => _termosUso != null;

  // "politica_privacidade" field.
  String? _politicaPrivacidade;
  String get politicaPrivacidade => _politicaPrivacidade ?? '';
  bool hasPoliticaPrivacidade() => _politicaPrivacidade != null;

  // "admin_emails" field.
  List<String>? _adminEmails;
  List<String> get adminEmails => _adminEmails ?? const [];
  bool hasAdminEmails() => _adminEmails != null;

  // "selos" field.
  List<SelosStruct>? _selos;
  List<SelosStruct> get selos => _selos ?? const [];
  bool hasSelos() => _selos != null;

  // "backup" field.
  bool? _backup;
  bool get backup => _backup ?? false;
  bool hasBackup() => _backup != null;

  void _initializeFields() {
    _categorias = getStructList(
      snapshotData['categorias'],
      CategoriasStruct.fromMap,
    );
    _subCategorias = getStructList(
      snapshotData['subCategorias'],
      SubCategoriasStruct.fromMap,
    );
    _comodidadesGeral = getStructList(
      snapshotData['comodidades_geral'],
      ComodidadesStruct.fromMap,
    );
    _storiesHome = getStructList(
      snapshotData['storiesHome'],
      FotosStruct.fromMap,
    );
    _perguntasFrequentes = getStructList(
      snapshotData['perguntasFrequentes'],
      FaqStruct.fromMap,
    );
    _termosUso = snapshotData['termos_uso'] as String?;
    _politicaPrivacidade = snapshotData['politica_privacidade'] as String?;
    _adminEmails = getDataList(snapshotData['admin_emails']);
    _selos = getStructList(
      snapshotData['selos'],
      SelosStruct.fromMap,
    );
    _backup = snapshotData['backup'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('appConfiguracoes');

  static Stream<AppConfiguracoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppConfiguracoesRecord.fromSnapshot(s));

  static Future<AppConfiguracoesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppConfiguracoesRecord.fromSnapshot(s));

  static AppConfiguracoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppConfiguracoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppConfiguracoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppConfiguracoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppConfiguracoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppConfiguracoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppConfiguracoesRecordData({
  String? termosUso,
  String? politicaPrivacidade,
  bool? backup,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'termos_uso': termosUso,
      'politica_privacidade': politicaPrivacidade,
      'backup': backup,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppConfiguracoesRecordDocumentEquality
    implements Equality<AppConfiguracoesRecord> {
  const AppConfiguracoesRecordDocumentEquality();

  @override
  bool equals(AppConfiguracoesRecord? e1, AppConfiguracoesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.categorias, e2?.categorias) &&
        listEquality.equals(e1?.subCategorias, e2?.subCategorias) &&
        listEquality.equals(e1?.comodidadesGeral, e2?.comodidadesGeral) &&
        listEquality.equals(e1?.storiesHome, e2?.storiesHome) &&
        listEquality.equals(e1?.perguntasFrequentes, e2?.perguntasFrequentes) &&
        e1?.termosUso == e2?.termosUso &&
        e1?.politicaPrivacidade == e2?.politicaPrivacidade &&
        listEquality.equals(e1?.adminEmails, e2?.adminEmails) &&
        listEquality.equals(e1?.selos, e2?.selos) &&
        e1?.backup == e2?.backup;
  }

  @override
  int hash(AppConfiguracoesRecord? e) => const ListEquality().hash([
        e?.categorias,
        e?.subCategorias,
        e?.comodidadesGeral,
        e?.storiesHome,
        e?.perguntasFrequentes,
        e?.termosUso,
        e?.politicaPrivacidade,
        e?.adminEmails,
        e?.selos,
        e?.backup
      ]);

  @override
  bool isValidKey(Object? o) => o is AppConfiguracoesRecord;
}
