import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _favoritosLocais = prefs
              .getStringList('ff_favoritosLocais')
              ?.map((path) => path.ref)
              .toList() ??
          _favoritosLocais;
    });
    _safeInit(() {
      _favoritosExperiencias = prefs
              .getStringList('ff_favoritosExperiencias')
              ?.map((path) => path.ref)
              .toList() ??
          _favoritosExperiencias;
    });
    _safeInit(() {
      _favoritosEventos = prefs
              .getStringList('ff_favoritosEventos')
              ?.map((path) => path.ref)
              .toList() ??
          _favoritosEventos;
    });
    _safeInit(() {
      _androidIdentifier =
          prefs.getString('ff_androidIdentifier') ?? _androidIdentifier;
    });
    _safeInit(() {
      _iosIdentifier = prefs.getString('ff_iosIdentifier') ?? _iosIdentifier;
    });
    _safeInit(() {
      _ativacoes = prefs
              .getStringList('ff_ativacoes')
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _ativacoes;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  Abas? _abaAtiva = Abas.inicio;
  Abas? get abaAtiva => _abaAtiva;
  set abaAtiva(Abas? value) {
    _abaAtiva = value;
  }

  DateTime? _currentTime = DateTime.fromMillisecondsSinceEpoch(1723471200000);
  DateTime? get currentTime => _currentTime;
  set currentTime(DateTime? value) {
    _currentTime = value;
  }

  int _explorarTab = 0;
  int get explorarTab => _explorarTab;
  set explorarTab(int value) {
    _explorarTab = value;
  }

  CategoriasStruct _categoriaSelecionada = CategoriasStruct();
  CategoriasStruct get categoriaSelecionada => _categoriaSelecionada;
  set categoriaSelecionada(CategoriasStruct value) {
    _categoriaSelecionada = value;
  }

  void updateCategoriaSelecionadaStruct(Function(CategoriasStruct) updateFn) {
    updateFn(_categoriaSelecionada);
  }

  SubCategoriasStruct _subcategoriaSelecionada = SubCategoriasStruct();
  SubCategoriasStruct get subcategoriaSelecionada => _subcategoriaSelecionada;
  set subcategoriaSelecionada(SubCategoriasStruct value) {
    _subcategoriaSelecionada = value;
  }

  void updateSubcategoriaSelecionadaStruct(
      Function(SubCategoriasStruct) updateFn) {
    updateFn(_subcategoriaSelecionada);
  }

  List<DocumentReference> _favoritosLocais = [];
  List<DocumentReference> get favoritosLocais => _favoritosLocais;
  set favoritosLocais(List<DocumentReference> value) {
    _favoritosLocais = value;
    prefs.setStringList(
        'ff_favoritosLocais', value.map((x) => x.path).toList());
  }

  void addToFavoritosLocais(DocumentReference value) {
    favoritosLocais.add(value);
    prefs.setStringList(
        'ff_favoritosLocais', _favoritosLocais.map((x) => x.path).toList());
  }

  void removeFromFavoritosLocais(DocumentReference value) {
    favoritosLocais.remove(value);
    prefs.setStringList(
        'ff_favoritosLocais', _favoritosLocais.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoritosLocais(int index) {
    favoritosLocais.removeAt(index);
    prefs.setStringList(
        'ff_favoritosLocais', _favoritosLocais.map((x) => x.path).toList());
  }

  void updateFavoritosLocaisAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favoritosLocais[index] = updateFn(_favoritosLocais[index]);
    prefs.setStringList(
        'ff_favoritosLocais', _favoritosLocais.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoritosLocais(int index, DocumentReference value) {
    favoritosLocais.insert(index, value);
    prefs.setStringList(
        'ff_favoritosLocais', _favoritosLocais.map((x) => x.path).toList());
  }

  List<DocumentReference> _favoritosExperiencias = [];
  List<DocumentReference> get favoritosExperiencias => _favoritosExperiencias;
  set favoritosExperiencias(List<DocumentReference> value) {
    _favoritosExperiencias = value;
    prefs.setStringList(
        'ff_favoritosExperiencias', value.map((x) => x.path).toList());
  }

  void addToFavoritosExperiencias(DocumentReference value) {
    favoritosExperiencias.add(value);
    prefs.setStringList('ff_favoritosExperiencias',
        _favoritosExperiencias.map((x) => x.path).toList());
  }

  void removeFromFavoritosExperiencias(DocumentReference value) {
    favoritosExperiencias.remove(value);
    prefs.setStringList('ff_favoritosExperiencias',
        _favoritosExperiencias.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoritosExperiencias(int index) {
    favoritosExperiencias.removeAt(index);
    prefs.setStringList('ff_favoritosExperiencias',
        _favoritosExperiencias.map((x) => x.path).toList());
  }

  void updateFavoritosExperienciasAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favoritosExperiencias[index] = updateFn(_favoritosExperiencias[index]);
    prefs.setStringList('ff_favoritosExperiencias',
        _favoritosExperiencias.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoritosExperiencias(
      int index, DocumentReference value) {
    favoritosExperiencias.insert(index, value);
    prefs.setStringList('ff_favoritosExperiencias',
        _favoritosExperiencias.map((x) => x.path).toList());
  }

  List<DocumentReference> _favoritosEventos = [];
  List<DocumentReference> get favoritosEventos => _favoritosEventos;
  set favoritosEventos(List<DocumentReference> value) {
    _favoritosEventos = value;
    prefs.setStringList(
        'ff_favoritosEventos', value.map((x) => x.path).toList());
  }

  void addToFavoritosEventos(DocumentReference value) {
    favoritosEventos.add(value);
    prefs.setStringList(
        'ff_favoritosEventos', _favoritosEventos.map((x) => x.path).toList());
  }

  void removeFromFavoritosEventos(DocumentReference value) {
    favoritosEventos.remove(value);
    prefs.setStringList(
        'ff_favoritosEventos', _favoritosEventos.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavoritosEventos(int index) {
    favoritosEventos.removeAt(index);
    prefs.setStringList(
        'ff_favoritosEventos', _favoritosEventos.map((x) => x.path).toList());
  }

  void updateFavoritosEventosAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    favoritosEventos[index] = updateFn(_favoritosEventos[index]);
    prefs.setStringList(
        'ff_favoritosEventos', _favoritosEventos.map((x) => x.path).toList());
  }

  void insertAtIndexInFavoritosEventos(int index, DocumentReference value) {
    favoritosEventos.insert(index, value);
    prefs.setStringList(
        'ff_favoritosEventos', _favoritosEventos.map((x) => x.path).toList());
  }

  String _androidIdentifier =
      'br.com.app.gpuu2578177.gpuu8a8d5ccfc67742ddc9d4645c75ba8823';
  String get androidIdentifier => _androidIdentifier;
  set androidIdentifier(String value) {
    _androidIdentifier = value;
    prefs.setString('ff_androidIdentifier', value);
  }

  String _iosIdentifier = 'br.com.fabricadeaplicativos.app2578177a';
  String get iosIdentifier => _iosIdentifier;
  set iosIdentifier(String value) {
    _iosIdentifier = value;
    prefs.setString('ff_iosIdentifier', value);
  }

  List<DateTime> _ativacoes = [];
  List<DateTime> get ativacoes => _ativacoes;
  set ativacoes(List<DateTime> value) {
    _ativacoes = value;
    prefs.setStringList('ff_ativacoes',
        value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToAtivacoes(DateTime value) {
    ativacoes.add(value);
    prefs.setStringList('ff_ativacoes',
        _ativacoes.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeFromAtivacoes(DateTime value) {
    ativacoes.remove(value);
    prefs.setStringList('ff_ativacoes',
        _ativacoes.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void removeAtIndexFromAtivacoes(int index) {
    ativacoes.removeAt(index);
    prefs.setStringList('ff_ativacoes',
        _ativacoes.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void updateAtivacoesAtIndex(
    int index,
    DateTime Function(DateTime) updateFn,
  ) {
    ativacoes[index] = updateFn(_ativacoes[index]);
    prefs.setStringList('ff_ativacoes',
        _ativacoes.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void insertAtIndexInAtivacoes(int index, DateTime value) {
    ativacoes.insert(index, value);
    prefs.setStringList('ff_ativacoes',
        _ativacoes.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  final _locaisManager = FutureRequestManager<List<LocaisRecord>>();
  Future<List<LocaisRecord>> locais({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LocaisRecord>> Function() requestFn,
  }) =>
      _locaisManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLocaisCache() => _locaisManager.clear();
  void clearLocaisCacheKey(String? uniqueKey) =>
      _locaisManager.clearRequest(uniqueKey);

  final _experienciasManager = FutureRequestManager<List<ExperienciasRecord>>();
  Future<List<ExperienciasRecord>> experiencias({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ExperienciasRecord>> Function() requestFn,
  }) =>
      _experienciasManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearExperienciasCache() => _experienciasManager.clear();
  void clearExperienciasCacheKey(String? uniqueKey) =>
      _experienciasManager.clearRequest(uniqueKey);

  final _appConfiguracoesManager =
      FutureRequestManager<List<AppConfiguracoesRecord>>();
  Future<List<AppConfiguracoesRecord>> appConfiguracoes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<AppConfiguracoesRecord>> Function() requestFn,
  }) =>
      _appConfiguracoesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAppConfiguracoesCache() => _appConfiguracoesManager.clear();
  void clearAppConfiguracoesCacheKey(String? uniqueKey) =>
      _appConfiguracoesManager.clearRequest(uniqueKey);

  final _eventosManager = FutureRequestManager<List<EventosRecord>>();
  Future<List<EventosRecord>> eventos({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<EventosRecord>> Function() requestFn,
  }) =>
      _eventosManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventosCache() => _eventosManager.clear();
  void clearEventosCacheKey(String? uniqueKey) =>
      _eventosManager.clearRequest(uniqueKey);

  final _usersManager = FutureRequestManager<List<UsersRecord>>();
  Future<List<UsersRecord>> users({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRecord>> Function() requestFn,
  }) =>
      _usersManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUsersCache() => _usersManager.clear();
  void clearUsersCacheKey(String? uniqueKey) =>
      _usersManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
