import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocaisRecord extends FirestoreRecord {
  LocaisRecord._(
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

  // "funcionamento" field.
  FuncionamentoLocalStruct? _funcionamento;
  FuncionamentoLocalStruct get funcionamento =>
      _funcionamento ?? FuncionamentoLocalStruct();
  bool hasFuncionamento() => _funcionamento != null;

  // "endereco_logradouro" field.
  String? _enderecoLogradouro;
  String get enderecoLogradouro => _enderecoLogradouro ?? '';
  bool hasEnderecoLogradouro() => _enderecoLogradouro != null;

  // "endereco_numero" field.
  String? _enderecoNumero;
  String get enderecoNumero => _enderecoNumero ?? '';
  bool hasEnderecoNumero() => _enderecoNumero != null;

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

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "criado_em" field.
  DateTime? _criadoEm;
  DateTime? get criadoEm => _criadoEm;
  bool hasCriadoEm() => _criadoEm != null;

  // "criado_por" field.
  DocumentReference? _criadoPor;
  DocumentReference? get criadoPor => _criadoPor;
  bool hasCriadoPor() => _criadoPor != null;

  // "modificacoes_log" field.
  List<ModificadoLogStruct>? _modificacoesLog;
  List<ModificadoLogStruct> get modificacoesLog => _modificacoesLog ?? const [];
  bool hasModificacoesLog() => _modificacoesLog != null;

  // "galeria_fotos" field.
  List<FotosStruct>? _galeriaFotos;
  List<FotosStruct> get galeriaFotos => _galeriaFotos ?? const [];
  bool hasGaleriaFotos() => _galeriaFotos != null;

  // "plano_cunhatem" field.
  DocumentReference? _planoCunhatem;
  DocumentReference? get planoCunhatem => _planoCunhatem;
  bool hasPlanoCunhatem() => _planoCunhatem != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "meta_titulo" field.
  String? _metaTitulo;
  String get metaTitulo => _metaTitulo ?? '';
  bool hasMetaTitulo() => _metaTitulo != null;

  // "meta_descricao" field.
  String? _metaDescricao;
  String get metaDescricao => _metaDescricao ?? '';
  bool hasMetaDescricao() => _metaDescricao != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "pinColor" field.
  Color? _pinColor;
  Color? get pinColor => _pinColor;
  bool hasPinColor() => _pinColor != null;

  // "observacoes_funcionamento" field.
  String? _observacoesFuncionamento;
  String get observacoesFuncionamento => _observacoesFuncionamento ?? '';
  bool hasObservacoesFuncionamento() => _observacoesFuncionamento != null;

  // "endereco_bairro" field.
  String? _enderecoBairro;
  String get enderecoBairro => _enderecoBairro ?? '';
  bool hasEnderecoBairro() => _enderecoBairro != null;

  // "deletado_em" field.
  DateTime? _deletadoEm;
  DateTime? get deletadoEm => _deletadoEm;
  bool hasDeletadoEm() => _deletadoEm != null;

  // "deletado_por" field.
  DocumentReference? _deletadoPor;
  DocumentReference? get deletadoPor => _deletadoPor;
  bool hasDeletadoPor() => _deletadoPor != null;

  // "link_cardapio" field.
  String? _linkCardapio;
  String get linkCardapio => _linkCardapio ?? '';
  bool hasLinkCardapio() => _linkCardapio != null;

  // "formas_pagamento" field.
  List<String>? _formasPagamento;
  List<String> get formasPagamento => _formasPagamento ?? const [];
  bool hasFormasPagamento() => _formasPagamento != null;

  // "sob_agendamento" field.
  bool? _sobAgendamento;
  bool get sobAgendamento => _sobAgendamento ?? false;
  bool hasSobAgendamento() => _sobAgendamento != null;

  // "entrada_paga" field.
  bool? _entradaPaga;
  bool get entradaPaga => _entradaPaga ?? false;
  bool hasEntradaPaga() => _entradaPaga != null;

  // "entradaValores" field.
  List<EntradaPagaStruct>? _entradaValores;
  List<EntradaPagaStruct> get entradaValores => _entradaValores ?? const [];
  bool hasEntradaValores() => _entradaValores != null;

  // "categorias_strings" field.
  List<String>? _categoriasStrings;
  List<String> get categoriasStrings => _categoriasStrings ?? const [];
  bool hasCategoriasStrings() => _categoriasStrings != null;

  // "subcategorias_strings" field.
  List<String>? _subcategoriasStrings;
  List<String> get subcategoriasStrings => _subcategoriasStrings ?? const [];
  bool hasSubcategoriasStrings() => _subcategoriasStrings != null;

  // "tripadvisor_link" field.
  String? _tripadvisorLink;
  String get tripadvisorLink => _tripadvisorLink ?? '';
  bool hasTripadvisorLink() => _tripadvisorLink != null;

  // "visivel" field.
  bool? _visivel;
  bool get visivel => _visivel ?? false;
  bool hasVisivel() => _visivel != null;

  // "lixeira" field.
  bool? _lixeira;
  bool get lixeira => _lixeira ?? false;
  bool hasLixeira() => _lixeira != null;

  // "comodidades_strings" field.
  List<String>? _comodidadesStrings;
  List<String> get comodidadesStrings => _comodidadesStrings ?? const [];
  bool hasComodidadesStrings() => _comodidadesStrings != null;

  // "descricao_reduzida" field.
  String? _descricaoReduzida;
  String get descricaoReduzida => _descricaoReduzida ?? '';
  bool hasDescricaoReduzida() => _descricaoReduzida != null;

  // "selos_strings" field.
  List<String>? _selosStrings;
  List<String> get selosStrings => _selosStrings ?? const [];
  bool hasSelosStrings() => _selosStrings != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _funcionamento =
        FuncionamentoLocalStruct.maybeFromMap(snapshotData['funcionamento']);
    _enderecoLogradouro = snapshotData['endereco_logradouro'] as String?;
    _enderecoNumero = snapshotData['endereco_numero'] as String?;
    _enderecoCidade = snapshotData['endereco_cidade'] as String?;
    _enderecoUf = snapshotData['endereco_uf'] as String?;
    _localizacao = snapshotData['localizacao'] as LatLng?;
    _telefone1 = snapshotData['telefone_1'] as String?;
    _whatsapp1 = snapshotData['whatsapp_1'] as bool?;
    _telefone2 = snapshotData['telefone_2'] as String?;
    _whatsapp2 = snapshotData['whatsapp_2'] as bool?;
    _instagram = snapshotData['instagram'] as String?;
    _email = snapshotData['email'] as String?;
    _website = snapshotData['website'] as String?;
    _criadoEm = snapshotData['criado_em'] as DateTime?;
    _criadoPor = snapshotData['criado_por'] as DocumentReference?;
    _modificacoesLog = getStructList(
      snapshotData['modificacoes_log'],
      ModificadoLogStruct.fromMap,
    );
    _galeriaFotos = getStructList(
      snapshotData['galeria_fotos'],
      FotosStruct.fromMap,
    );
    _planoCunhatem = snapshotData['plano_cunhatem'] as DocumentReference?;
    _slug = snapshotData['slug'] as String?;
    _metaTitulo = snapshotData['meta_titulo'] as String?;
    _metaDescricao = snapshotData['meta_descricao'] as String?;
    _id = snapshotData['id'] as String?;
    _pinColor = getSchemaColor(snapshotData['pinColor']);
    _observacoesFuncionamento =
        snapshotData['observacoes_funcionamento'] as String?;
    _enderecoBairro = snapshotData['endereco_bairro'] as String?;
    _deletadoEm = snapshotData['deletado_em'] as DateTime?;
    _deletadoPor = snapshotData['deletado_por'] as DocumentReference?;
    _linkCardapio = snapshotData['link_cardapio'] as String?;
    _formasPagamento = getDataList(snapshotData['formas_pagamento']);
    _sobAgendamento = snapshotData['sob_agendamento'] as bool?;
    _entradaPaga = snapshotData['entrada_paga'] as bool?;
    _entradaValores = getStructList(
      snapshotData['entradaValores'],
      EntradaPagaStruct.fromMap,
    );
    _categoriasStrings = getDataList(snapshotData['categorias_strings']);
    _subcategoriasStrings = getDataList(snapshotData['subcategorias_strings']);
    _tripadvisorLink = snapshotData['tripadvisor_link'] as String?;
    _visivel = snapshotData['visivel'] as bool?;
    _lixeira = snapshotData['lixeira'] as bool?;
    _comodidadesStrings = getDataList(snapshotData['comodidades_strings']);
    _descricaoReduzida = snapshotData['descricao_reduzida'] as String?;
    _selosStrings = getDataList(snapshotData['selos_strings']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('locais');

  static Stream<LocaisRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LocaisRecord.fromSnapshot(s));

  static Future<LocaisRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LocaisRecord.fromSnapshot(s));

  static LocaisRecord fromSnapshot(DocumentSnapshot snapshot) => LocaisRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LocaisRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LocaisRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LocaisRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LocaisRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLocaisRecordData({
  String? nome,
  String? descricao,
  FuncionamentoLocalStruct? funcionamento,
  String? enderecoLogradouro,
  String? enderecoNumero,
  String? enderecoCidade,
  String? enderecoUf,
  LatLng? localizacao,
  String? telefone1,
  bool? whatsapp1,
  String? telefone2,
  bool? whatsapp2,
  String? instagram,
  String? email,
  String? website,
  DateTime? criadoEm,
  DocumentReference? criadoPor,
  DocumentReference? planoCunhatem,
  String? slug,
  String? metaTitulo,
  String? metaDescricao,
  String? id,
  Color? pinColor,
  String? observacoesFuncionamento,
  String? enderecoBairro,
  DateTime? deletadoEm,
  DocumentReference? deletadoPor,
  String? linkCardapio,
  bool? sobAgendamento,
  bool? entradaPaga,
  String? tripadvisorLink,
  bool? visivel,
  bool? lixeira,
  String? descricaoReduzida,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'descricao': descricao,
      'funcionamento': FuncionamentoLocalStruct().toMap(),
      'endereco_logradouro': enderecoLogradouro,
      'endereco_numero': enderecoNumero,
      'endereco_cidade': enderecoCidade,
      'endereco_uf': enderecoUf,
      'localizacao': localizacao,
      'telefone_1': telefone1,
      'whatsapp_1': whatsapp1,
      'telefone_2': telefone2,
      'whatsapp_2': whatsapp2,
      'instagram': instagram,
      'email': email,
      'website': website,
      'criado_em': criadoEm,
      'criado_por': criadoPor,
      'plano_cunhatem': planoCunhatem,
      'slug': slug,
      'meta_titulo': metaTitulo,
      'meta_descricao': metaDescricao,
      'id': id,
      'pinColor': pinColor,
      'observacoes_funcionamento': observacoesFuncionamento,
      'endereco_bairro': enderecoBairro,
      'deletado_em': deletadoEm,
      'deletado_por': deletadoPor,
      'link_cardapio': linkCardapio,
      'sob_agendamento': sobAgendamento,
      'entrada_paga': entradaPaga,
      'tripadvisor_link': tripadvisorLink,
      'visivel': visivel,
      'lixeira': lixeira,
      'descricao_reduzida': descricaoReduzida,
    }.withoutNulls,
  );

  // Handle nested data for "funcionamento" field.
  addFuncionamentoLocalStructData(
      firestoreData, funcionamento, 'funcionamento');

  return firestoreData;
}

class LocaisRecordDocumentEquality implements Equality<LocaisRecord> {
  const LocaisRecordDocumentEquality();

  @override
  bool equals(LocaisRecord? e1, LocaisRecord? e2) {
    const listEquality = ListEquality();
    return e1?.nome == e2?.nome &&
        e1?.descricao == e2?.descricao &&
        e1?.funcionamento == e2?.funcionamento &&
        e1?.enderecoLogradouro == e2?.enderecoLogradouro &&
        e1?.enderecoNumero == e2?.enderecoNumero &&
        e1?.enderecoCidade == e2?.enderecoCidade &&
        e1?.enderecoUf == e2?.enderecoUf &&
        e1?.localizacao == e2?.localizacao &&
        e1?.telefone1 == e2?.telefone1 &&
        e1?.whatsapp1 == e2?.whatsapp1 &&
        e1?.telefone2 == e2?.telefone2 &&
        e1?.whatsapp2 == e2?.whatsapp2 &&
        e1?.instagram == e2?.instagram &&
        e1?.email == e2?.email &&
        e1?.website == e2?.website &&
        e1?.criadoEm == e2?.criadoEm &&
        e1?.criadoPor == e2?.criadoPor &&
        listEquality.equals(e1?.modificacoesLog, e2?.modificacoesLog) &&
        listEquality.equals(e1?.galeriaFotos, e2?.galeriaFotos) &&
        e1?.planoCunhatem == e2?.planoCunhatem &&
        e1?.slug == e2?.slug &&
        e1?.metaTitulo == e2?.metaTitulo &&
        e1?.metaDescricao == e2?.metaDescricao &&
        e1?.id == e2?.id &&
        e1?.pinColor == e2?.pinColor &&
        e1?.observacoesFuncionamento == e2?.observacoesFuncionamento &&
        e1?.enderecoBairro == e2?.enderecoBairro &&
        e1?.deletadoEm == e2?.deletadoEm &&
        e1?.deletadoPor == e2?.deletadoPor &&
        e1?.linkCardapio == e2?.linkCardapio &&
        listEquality.equals(e1?.formasPagamento, e2?.formasPagamento) &&
        e1?.sobAgendamento == e2?.sobAgendamento &&
        e1?.entradaPaga == e2?.entradaPaga &&
        listEquality.equals(e1?.entradaValores, e2?.entradaValores) &&
        listEquality.equals(e1?.categoriasStrings, e2?.categoriasStrings) &&
        listEquality.equals(
            e1?.subcategoriasStrings, e2?.subcategoriasStrings) &&
        e1?.tripadvisorLink == e2?.tripadvisorLink &&
        e1?.visivel == e2?.visivel &&
        e1?.lixeira == e2?.lixeira &&
        listEquality.equals(e1?.comodidadesStrings, e2?.comodidadesStrings) &&
        e1?.descricaoReduzida == e2?.descricaoReduzida &&
        listEquality.equals(e1?.selosStrings, e2?.selosStrings);
  }

  @override
  int hash(LocaisRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.descricao,
        e?.funcionamento,
        e?.enderecoLogradouro,
        e?.enderecoNumero,
        e?.enderecoCidade,
        e?.enderecoUf,
        e?.localizacao,
        e?.telefone1,
        e?.whatsapp1,
        e?.telefone2,
        e?.whatsapp2,
        e?.instagram,
        e?.email,
        e?.website,
        e?.criadoEm,
        e?.criadoPor,
        e?.modificacoesLog,
        e?.galeriaFotos,
        e?.planoCunhatem,
        e?.slug,
        e?.metaTitulo,
        e?.metaDescricao,
        e?.id,
        e?.pinColor,
        e?.observacoesFuncionamento,
        e?.enderecoBairro,
        e?.deletadoEm,
        e?.deletadoPor,
        e?.linkCardapio,
        e?.formasPagamento,
        e?.sobAgendamento,
        e?.entradaPaga,
        e?.entradaValores,
        e?.categoriasStrings,
        e?.subcategoriasStrings,
        e?.tripadvisorLink,
        e?.visivel,
        e?.lixeira,
        e?.comodidadesStrings,
        e?.descricaoReduzida,
        e?.selosStrings
      ]);

  @override
  bool isValidKey(Object? o) => o is LocaisRecord;
}
