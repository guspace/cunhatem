import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventosRecord extends FirestoreRecord {
  EventosRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "comeca_em" field.
  DateTime? _comecaEm;
  DateTime? get comecaEm => _comecaEm;
  bool hasComecaEm() => _comecaEm != null;

  // "termina_em" field.
  DateTime? _terminaEm;
  DateTime? get terminaEm => _terminaEm;
  bool hasTerminaEm() => _terminaEm != null;

  // "galeriaFotos" field.
  List<FotosStruct>? _galeriaFotos;
  List<FotosStruct> get galeriaFotos => _galeriaFotos ?? const [];
  bool hasGaleriaFotos() => _galeriaFotos != null;

  // "visivel" field.
  bool? _visivel;
  bool get visivel => _visivel ?? false;
  bool hasVisivel() => _visivel != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "deletado_em" field.
  DateTime? _deletadoEm;
  DateTime? get deletadoEm => _deletadoEm;
  bool hasDeletadoEm() => _deletadoEm != null;

  // "deletado_por" field.
  DocumentReference? _deletadoPor;
  DocumentReference? get deletadoPor => _deletadoPor;
  bool hasDeletadoPor() => _deletadoPor != null;

  // "lixeira" field.
  bool? _lixeira;
  bool get lixeira => _lixeira ?? false;
  bool hasLixeira() => _lixeira != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  bool hasLocalizacao() => _localizacao != null;

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

  // "vinculado_local" field.
  bool? _vinculadoLocal;
  bool get vinculadoLocal => _vinculadoLocal ?? false;
  bool hasVinculadoLocal() => _vinculadoLocal != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "endereco_localVinculado" field.
  bool? _enderecoLocalVinculado;
  bool get enderecoLocalVinculado => _enderecoLocalVinculado ?? false;
  bool hasEnderecoLocalVinculado() => _enderecoLocalVinculado != null;

  // "valores_entrada" field.
  List<EntradaPagaStruct>? _valoresEntrada;
  List<EntradaPagaStruct> get valoresEntrada => _valoresEntrada ?? const [];
  bool hasValoresEntrada() => _valoresEntrada != null;

  // "evento_pago" field.
  bool? _eventoPago;
  bool get eventoPago => _eventoPago ?? false;
  bool hasEventoPago() => _eventoPago != null;

  // "formas_pagamento" field.
  List<String>? _formasPagamento;
  List<String> get formasPagamento => _formasPagamento ?? const [];
  bool hasFormasPagamento() => _formasPagamento != null;

  // "sob_agendamento" field.
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

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "contatos_localVinculado" field.
  bool? _contatosLocalVinculado;
  bool get contatosLocalVinculado => _contatosLocalVinculado ?? false;
  bool hasContatosLocalVinculado() => _contatosLocalVinculado != null;

  // "diaTodo" field.
  bool? _diaTodo;
  bool get diaTodo => _diaTodo ?? false;
  bool hasDiaTodo() => _diaTodo != null;

  // "semEndereco" field.
  bool? _semEndereco;
  bool get semEndereco => _semEndereco ?? false;
  bool hasSemEndereco() => _semEndereco != null;

  // "vinculo_locais" field.
  List<DocumentReference>? _vinculoLocais;
  List<DocumentReference> get vinculoLocais => _vinculoLocais ?? const [];
  bool hasVinculoLocais() => _vinculoLocais != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _comecaEm = snapshotData['comeca_em'] as DateTime?;
    _terminaEm = snapshotData['termina_em'] as DateTime?;
    _galeriaFotos = getStructList(
      snapshotData['galeriaFotos'],
      FotosStruct.fromMap,
    );
    _visivel = snapshotData['visivel'] as bool?;
    _criadoEm = snapshotData['criado_em'] as DateTime?;
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _deletadoEm = snapshotData['deletado_em'] as DateTime?;
    _deletadoPor = snapshotData['deletado_por'] as DocumentReference?;
    _lixeira = snapshotData['lixeira'] as bool?;
    _id = snapshotData['id'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _enderecoLogradouro = snapshotData['endereco_logradouro'] as String?;
    _enderecoNumero = snapshotData['endereco_numero'] as String?;
    _enderecoBairro = snapshotData['endereco_bairro'] as String?;
    _enderecoCidade = snapshotData['endereco_cidade'] as String?;
    _enderecoUf = snapshotData['endereco_uf'] as String?;
    _telefone1 = snapshotData['telefone_1'] as String?;
    _whatsapp1 = snapshotData['whatsapp_1'] as bool?;
    _telefone2 = snapshotData['telefone_2'] as String?;
    _whatsapp2 = snapshotData['whatsapp_2'] as bool?;
    _vinculadoLocal = snapshotData['vinculado_local'] as bool?;
    _descricao = snapshotData['descricao'] as String?;
    _enderecoLocalVinculado = snapshotData['endereco_localVinculado'] as bool?;
    _valoresEntrada = getStructList(
      snapshotData['valores_entrada'],
      EntradaPagaStruct.fromMap,
    );
    _eventoPago = snapshotData['evento_pago'] as bool?;
    _formasPagamento = getDataList(snapshotData['formas_pagamento']);
    _sobAgendamento = snapshotData['sob_agendamento'] as bool?;
    _instagram = snapshotData['instagram'] as String?;
    _website = snapshotData['website'] as String?;
    _email = snapshotData['email'] as String?;
    _contatosLocalVinculado = snapshotData['contatos_localVinculado'] as bool?;
    _diaTodo = snapshotData['diaTodo'] as bool?;
    _semEndereco = snapshotData['semEndereco'] as bool?;
    _vinculoLocais = getDataList(snapshotData['vinculo_locais']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eventos');

  static Stream<EventosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EventosRecord.fromSnapshot(s));

  static Future<EventosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EventosRecord.fromSnapshot(s));

  static EventosRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EventosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EventosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EventosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EventosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EventosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEventosRecordData({
  String? nome,
  DateTime? comecaEm,
  DateTime? terminaEm,
  bool? visivel,
  DateTime? criadoEm,
  DocumentReference? criadoPor,
  DateTime? deletadoEm,
  DocumentReference? deletadoPor,
  bool? lixeira,
  String? id,
  LatLng? localizacao,
  String? enderecoLogradouro,
  String? enderecoNumero,
  String? enderecoBairro,
  String? enderecoCidade,
  String? enderecoUf,
  String? telefone1,
  bool? whatsapp1,
  String? telefone2,
  bool? whatsapp2,
  bool? vinculadoLocal,
  String? descricao,
  bool? enderecoLocalVinculado,
  bool? eventoPago,
  bool? sobAgendamento,
  String? instagram,
  String? website,
  String? email,
  bool? contatosLocalVinculado,
  bool? diaTodo,
  bool? semEndereco,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'comeca_em': comecaEm,
      'termina_em': terminaEm,
      'visivel': visivel,
      'criado_em': criadoEm,
      'criado_por': criadoPor,
      'deletado_em': deletadoEm,
      'deletado_por': deletadoPor,
      'lixeira': lixeira,
      'id': id,
      'localizacao': localizacao,
      'endereco_logradouro': enderecoLogradouro,
      'endereco_numero': enderecoNumero,
      'endereco_bairro': enderecoBairro,
      'endereco_cidade': enderecoCidade,
      'endereco_uf': enderecoUf,
      'telefone_1': telefone1,
      'whatsapp_1': whatsapp1,
      'telefone_2': telefone2,
      'whatsapp_2': whatsapp2,
      'vinculado_local': vinculadoLocal,
      'descricao': descricao,
      'endereco_localVinculado': enderecoLocalVinculado,
      'evento_pago': eventoPago,
      'sob_agendamento': sobAgendamento,
      'instagram': instagram,
      'website': website,
      'email': email,
      'contatos_localVinculado': contatosLocalVinculado,
      'diaTodo': diaTodo,
      'semEndereco': semEndereco,
    }.withoutNulls,
  );

  return firestoreData;
}

class EventosRecordDocumentEquality implements Equality<EventosRecord> {
  const EventosRecordDocumentEquality();

  @override
  bool equals(EventosRecord? e1, EventosRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.comecaEm == e2?.comecaEm &&
        e1?.terminaEm == e2?.terminaEm &&
        listEquality.equals(e1?.galeriaFotos, e2?.galeriaFotos) &&
        e1?.visivel == e2?.visivel &&
        e1?.criadoEm == e2?.criadoEm &&
        e1?.criadoPor == e2?.criadoPor &&
        e1?.deletadoEm == e2?.deletadoEm &&
        e1?.deletadoPor == e2?.deletadoPor &&
        e1?.lixeira == e2?.lixeira &&
        e1?.id == e2?.id &&
        e1?.localizacao == e2?.localizacao &&
        e1?.enderecoLogradouro == e2?.enderecoLogradouro &&
        e1?.enderecoNumero == e2?.enderecoNumero &&
        e1?.enderecoBairro == e2?.enderecoBairro &&
        e1?.enderecoCidade == e2?.enderecoCidade &&
        e1?.enderecoUf == e2?.enderecoUf &&
        e1?.telefone1 == e2?.telefone1 &&
        e1?.whatsapp1 == e2?.whatsapp1 &&
        e1?.telefone2 == e2?.telefone2 &&
        e1?.whatsapp2 == e2?.whatsapp2 &&
        e1?.vinculadoLocal == e2?.vinculadoLocal &&
        e1?.descricao == e2?.descricao &&
        e1?.enderecoLocalVinculado == e2?.enderecoLocalVinculado &&
        listEquality.equals(e1?.valoresEntrada, e2?.valoresEntrada) &&
        e1?.eventoPago == e2?.eventoPago &&
        listEquality.equals(e1?.formasPagamento, e2?.formasPagamento) &&
        e1?.sobAgendamento == e2?.sobAgendamento &&
        e1?.instagram == e2?.instagram &&
        e1?.website == e2?.website &&
        e1?.email == e2?.email &&
        e1?.contatosLocalVinculado == e2?.contatosLocalVinculado &&
        e1?.diaTodo == e2?.diaTodo &&
        e1?.semEndereco == e2?.semEndereco &&
        listEquality.equals(e1?.vinculoLocais, e2?.vinculoLocais);
  }

  @override
  int hash(EventosRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.comecaEm,
        e?.terminaEm,
        e?.galeriaFotos,
        e?.visivel,
        e?.criadoEm,
        e?.criadoPor,
        e?.deletadoEm,
        e?.deletadoPor,
        e?.lixeira,
        e?.id,
        e?.localizacao,
        e?.enderecoLogradouro,
        e?.enderecoNumero,
        e?.enderecoBairro,
        e?.enderecoCidade,
        e?.enderecoUf,
        e?.telefone1,
        e?.whatsapp1,
        e?.telefone2,
        e?.whatsapp2,
        e?.vinculadoLocal,
        e?.descricao,
        e?.enderecoLocalVinculado,
        e?.valoresEntrada,
        e?.eventoPago,
        e?.formasPagamento,
        e?.sobAgendamento,
        e?.instagram,
        e?.website,
        e?.email,
        e?.contatosLocalVinculado,
        e?.diaTodo,
        e?.semEndereco,
        e?.vinculoLocais
      ]);

  @override
  bool isValidKey(Object? o) => o is EventosRecord;
}
