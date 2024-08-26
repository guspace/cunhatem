import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExperienciasRecord extends FirestoreRecord {
  ExperienciasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "galeriaFotos" field.
  List<FotosStruct>? _galeriaFotos;
  List<FotosStruct> get galeriaFotos => _galeriaFotos ?? const [];
  bool hasGaleriaFotos() => _galeriaFotos != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "endereco_logradouro" field.
  String? _enderecoLogradouro;
  String get enderecoLogradouro => _enderecoLogradouro ?? '';
  bool hasEnderecoLogradouro() => _enderecoLogradouro != null;

  // "endereco_numero" field.
  String? _enderecoNumero;
  String get enderecoNumero => _enderecoNumero ?? '';
  bool hasEnderecoNumero() => _enderecoNumero != null;

  // "endereco_bairro" field.
  String? _enderecoBairro;
  String get enderecoBairro => _enderecoBairro ?? '';
  bool hasEnderecoBairro() => _enderecoBairro != null;

  // "endereco_cidade" field.
  String? _enderecoCidade;
  String get enderecoCidade => _enderecoCidade ?? '';
  bool hasEnderecoCidade() => _enderecoCidade != null;

  // "endereco_uf" field.
  String? _enderecoUf;
  String get enderecoUf => _enderecoUf ?? '';
  bool hasEnderecoUf() => _enderecoUf != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

  // "telefone_1" field.
  String? _telefone1;
  String get telefone1 => _telefone1 ?? '';
  bool hasTelefone1() => _telefone1 != null;

  // "whatsapp_1" field.
  bool? _whatsapp1;
  bool get whatsapp1 => _whatsapp1 ?? false;
  bool hasWhatsapp1() => _whatsapp1 != null;

  // "telefone_2" field.
  String? _telefone2;
  String get telefone2 => _telefone2 ?? '';
  bool hasTelefone2() => _telefone2 != null;

  // "whatsapp_2" field.
  bool? _whatsapp2;
  bool get whatsapp2 => _whatsapp2 ?? false;
  bool hasWhatsapp2() => _whatsapp2 != null;

  // "visivel" field.
  bool? _visivel;
  bool get visivel => _visivel ?? false;
  bool hasVisivel() => _visivel != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  // "deletado_em" field.
  DateTime? _deletadoEm;
  DateTime? get deletadoEm => _deletadoEm;
  bool hasDeletadoEm() => _deletadoEm != null;

  // "deletado_por" field.
  DocumentReference? _deletadoPor;
  DocumentReference? get deletadoPor => _deletadoPor;
  bool hasDeletadoPor() => _deletadoPor != null;

  // "experienciaPaga" field.
  bool? _experienciaPaga;
  bool get experienciaPaga => _experienciaPaga ?? false;
  bool hasExperienciaPaga() => _experienciaPaga != null;

  // "valores" field.
  List<EntradaPagaStruct>? _valores;
  List<EntradaPagaStruct> get valores => _valores ?? const [];
  bool hasValores() => _valores != null;

  // "sobAgendamento" field.
  bool? _sobAgendamento;
  bool get sobAgendamento => _sobAgendamento ?? false;
  bool hasSobAgendamento() => _sobAgendamento != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "tripadvisor" field.
  String? _tripadvisor;
  String get tripadvisor => _tripadvisor ?? '';
  bool hasTripadvisor() => _tripadvisor != null;

  // "formasPagamento" field.
  List<String>? _formasPagamento;
  List<String> get formasPagamento => _formasPagamento ?? const [];
  bool hasFormasPagamento() => _formasPagamento != null;

  // "lixeira" field.
  bool? _lixeira;
  bool get lixeira => _lixeira ?? false;
  bool hasLixeira() => _lixeira != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "duracaoHoras" field.
  String? _duracaoHoras;
  String get duracaoHoras => _duracaoHoras ?? '';
  bool hasDuracaoHoras() => _duracaoHoras != null;

  // "endereco_localVinculado" field.
  bool? _enderecoLocalVinculado;
  bool get enderecoLocalVinculado => _enderecoLocalVinculado ?? false;
  bool hasEnderecoLocalVinculado() => _enderecoLocalVinculado != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "contatos_localVinculado" field.
  bool? _contatosLocalVinculado;
  bool get contatosLocalVinculado => _contatosLocalVinculado ?? false;
  bool hasContatosLocalVinculado() => _contatosLocalVinculado != null;

  // "vinculo_locais" field.
  List<DocumentReference>? _vinculoLocais;
  List<DocumentReference> get vinculoLocais => _vinculoLocais ?? const [];
  bool hasVinculoLocais() => _vinculoLocais != null;

  // "vinculado_local" field.
  bool? _vinculadoLocal;
  bool get vinculadoLocal => _vinculadoLocal ?? false;
  bool hasVinculadoLocal() => _vinculadoLocal != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _galeriaFotos = getStructList(
      snapshotData['galeriaFotos'],
      FotosStruct.fromMap,
    );
    _descricao = snapshotData['descricao'] as String?;
    _enderecoLogradouro = snapshotData['endereco_logradouro'] as String?;
    _enderecoNumero = snapshotData['endereco_numero'] as String?;
    _enderecoBairro = snapshotData['endereco_bairro'] as String?;
    _enderecoCidade = snapshotData['endereco_cidade'] as String?;
    _enderecoUf = snapshotData['endereco_uf'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _telefone1 = snapshotData['telefone_1'] as String?;
    _whatsapp1 = snapshotData['whatsapp_1'] as bool?;
    _telefone2 = snapshotData['telefone_2'] as String?;
    _whatsapp2 = snapshotData['whatsapp_2'] as bool?;
    _visivel = snapshotData['visivel'] as bool?;
    _criadoEm = snapshotData['criado_em'] as DateTime?;
    _deletadoEm = snapshotData['deletado_em'] as DateTime?;
    _deletadoPor = snapshotData['deletado_por'] as DocumentReference?;
    _experienciaPaga = snapshotData['experienciaPaga'] as bool?;
    _valores = getStructList(
      snapshotData['valores'],
      EntradaPagaStruct.fromMap,
    );
    _sobAgendamento = snapshotData['sobAgendamento'] as bool?;
    _instagram = snapshotData['instagram'] as String?;
    _website = snapshotData['website'] as String?;
    _tripadvisor = snapshotData['tripadvisor'] as String?;
    _formasPagamento = getDataList(snapshotData['formasPagamento']);
    _lixeira = snapshotData['lixeira'] as bool?;
    _id = snapshotData['id'] as String?;
    _duracaoHoras = snapshotData['duracaoHoras'] as String?;
    _enderecoLocalVinculado = snapshotData['endereco_localVinculado'] as bool?;
    _email = snapshotData['email'] as String?;
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _contatosLocalVinculado = snapshotData['contatos_localVinculado'] as bool?;
    _vinculoLocais = getDataList(snapshotData['vinculo_locais']);
    _vinculadoLocal = snapshotData['vinculado_local'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('experiencias');

  static Stream<ExperienciasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExperienciasRecord.fromSnapshot(s));

  static Future<ExperienciasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExperienciasRecord.fromSnapshot(s));

  static ExperienciasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExperienciasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExperienciasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExperienciasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExperienciasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExperienciasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExperienciasRecordData({
  String? nome,
  String? descricao,
  String? enderecoLogradouro,
  String? enderecoNumero,
  String? enderecoBairro,
  String? enderecoCidade,
  String? enderecoUf,
  LatLng? localizacao,
  String? telefone1,
  bool? whatsapp1,
  String? telefone2,
  bool? whatsapp2,
  bool? visivel,
  DateTime? criadoEm,
  DateTime? deletadoEm,
  DocumentReference? deletadoPor,
  bool? experienciaPaga,
  bool? sobAgendamento,
  String? instagram,
  String? website,
  String? tripadvisor,
  bool? lixeira,
  String? id,
  String? duracaoHoras,
  bool? enderecoLocalVinculado,
  String? email,
  DocumentReference? criadoPor,
  bool? contatosLocalVinculado,
  bool? vinculadoLocal,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'endereco_logradouro': enderecoLogradouro,
      'endereco_numero': enderecoNumero,
      'endereco_bairro': enderecoBairro,
      'endereco_cidade': enderecoCidade,
      'endereco_uf': enderecoUf,
      'localizacao': localizacao,
      'telefone_1': telefone1,
      'whatsapp_1': whatsapp1,
      'telefone_2': telefone2,
      'whatsapp_2': whatsapp2,
      'visivel': visivel,
      'criado_em': criadoEm,
      'deletado_em': deletadoEm,
      'deletado_por': deletadoPor,
      'experienciaPaga': experienciaPaga,
      'sobAgendamento': sobAgendamento,
      'instagram': instagram,
      'website': website,
      'tripadvisor': tripadvisor,
      'lixeira': lixeira,
      'id': id,
      'duracaoHoras': duracaoHoras,
      'endereco_localVinculado': enderecoLocalVinculado,
      'email': email,
      'criado_por': criadoPor,
      'contatos_localVinculado': contatosLocalVinculado,
      'vinculado_local': vinculadoLocal,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExperienciasRecordDocumentEquality
    implements Equality<ExperienciasRecord> {
  const ExperienciasRecordDocumentEquality();

  @override
  bool equals(ExperienciasRecord? e1, ExperienciasRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        listEquality.equals(e1?.galeriaFotos, e2?.galeriaFotos) &&
        e1?.descricao == e2?.descricao &&
        e1?.enderecoLogradouro == e2?.enderecoLogradouro &&
        e1?.enderecoNumero == e2?.enderecoNumero &&
        e1?.enderecoBairro == e2?.enderecoBairro &&
        e1?.enderecoCidade == e2?.enderecoCidade &&
        e1?.enderecoUf == e2?.enderecoUf &&
        e1?.localizacao == e2?.localizacao &&
        e1?.telefone1 == e2?.telefone1 &&
        e1?.whatsapp1 == e2?.whatsapp1 &&
        e1?.telefone2 == e2?.telefone2 &&
        e1?.whatsapp2 == e2?.whatsapp2 &&
        e1?.visivel == e2?.visivel &&
        e1?.criadoEm == e2?.criadoEm &&
        e1?.deletadoEm == e2?.deletadoEm &&
        e1?.deletadoPor == e2?.deletadoPor &&
        e1?.experienciaPaga == e2?.experienciaPaga &&
        listEquality.equals(e1?.valores, e2?.valores) &&
        e1?.sobAgendamento == e2?.sobAgendamento &&
        e1?.instagram == e2?.instagram &&
        e1?.website == e2?.website &&
        e1?.tripadvisor == e2?.tripadvisor &&
        listEquality.equals(e1?.formasPagamento, e2?.formasPagamento) &&
        e1?.lixeira == e2?.lixeira &&
        e1?.id == e2?.id &&
        e1?.duracaoHoras == e2?.duracaoHoras &&
        e1?.enderecoLocalVinculado == e2?.enderecoLocalVinculado &&
        e1?.email == e2?.email &&
        e1?.criadoPor == e2?.criadoPor &&
        e1?.contatosLocalVinculado == e2?.contatosLocalVinculado &&
        listEquality.equals(e1?.vinculoLocais, e2?.vinculoLocais) &&
        e1?.vinculadoLocal == e2?.vinculadoLocal;
  }

  @override
  int hash(ExperienciasRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.galeriaFotos,
        e?.descricao,
        e?.enderecoLogradouro,
        e?.enderecoNumero,
        e?.enderecoBairro,
        e?.enderecoCidade,
        e?.enderecoUf,
        e?.localizacao,
        e?.telefone1,
        e?.whatsapp1,
        e?.telefone2,
        e?.whatsapp2,
        e?.visivel,
        e?.criadoEm,
        e?.deletadoEm,
        e?.deletadoPor,
        e?.experienciaPaga,
        e?.valores,
        e?.sobAgendamento,
        e?.instagram,
        e?.website,
        e?.tripadvisor,
        e?.formasPagamento,
        e?.lixeira,
        e?.id,
        e?.duracaoHoras,
        e?.enderecoLocalVinculado,
        e?.email,
        e?.criadoPor,
        e?.contatosLocalVinculado,
        e?.vinculoLocais,
        e?.vinculadoLocal
      ]);

  @override
  bool isValidKey(Object? o) => o is ExperienciasRecord;
}
