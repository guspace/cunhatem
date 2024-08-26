// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class FuncionamentoLocalStruct extends FFFirebaseStruct {
  FuncionamentoLocalStruct({
    bool? segunda24h,
    String? segundaAbre,
    String? segundaFecha,
    bool? terca24h,
    String? tercaAbre,
    String? tercaFecha,
    bool? quarta24h,
    String? quartaAbre,
    String? quartaFecha,
    bool? quinta24h,
    String? quintaAbre,
    String? quintaFecha,
    bool? sexta24h,
    String? sextaAbre,
    String? sextaFecha,
    bool? sabado24h,
    String? sabadoAbre,
    String? sabadoFecha,
    bool? domingo24h,
    String? domingoAbre,
    String? domingoFecha,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _segunda24h = segunda24h,
        _segundaAbre = segundaAbre,
        _segundaFecha = segundaFecha,
        _terca24h = terca24h,
        _tercaAbre = tercaAbre,
        _tercaFecha = tercaFecha,
        _quarta24h = quarta24h,
        _quartaAbre = quartaAbre,
        _quartaFecha = quartaFecha,
        _quinta24h = quinta24h,
        _quintaAbre = quintaAbre,
        _quintaFecha = quintaFecha,
        _sexta24h = sexta24h,
        _sextaAbre = sextaAbre,
        _sextaFecha = sextaFecha,
        _sabado24h = sabado24h,
        _sabadoAbre = sabadoAbre,
        _sabadoFecha = sabadoFecha,
        _domingo24h = domingo24h,
        _domingoAbre = domingoAbre,
        _domingoFecha = domingoFecha,
        super(firestoreUtilData);

  // "segunda24h" field.
  bool? _segunda24h;
  bool get segunda24h => _segunda24h ?? false;
  set segunda24h(bool? val) => _segunda24h = val;

  bool hasSegunda24h() => _segunda24h != null;

  // "segundaAbre" field.
  String? _segundaAbre;
  String get segundaAbre => _segundaAbre ?? '';
  set segundaAbre(String? val) => _segundaAbre = val;

  bool hasSegundaAbre() => _segundaAbre != null;

  // "segundaFecha" field.
  String? _segundaFecha;
  String get segundaFecha => _segundaFecha ?? '';
  set segundaFecha(String? val) => _segundaFecha = val;

  bool hasSegundaFecha() => _segundaFecha != null;

  // "terca24h" field.
  bool? _terca24h;
  bool get terca24h => _terca24h ?? false;
  set terca24h(bool? val) => _terca24h = val;

  bool hasTerca24h() => _terca24h != null;

  // "tercaAbre" field.
  String? _tercaAbre;
  String get tercaAbre => _tercaAbre ?? '';
  set tercaAbre(String? val) => _tercaAbre = val;

  bool hasTercaAbre() => _tercaAbre != null;

  // "tercaFecha" field.
  String? _tercaFecha;
  String get tercaFecha => _tercaFecha ?? '';
  set tercaFecha(String? val) => _tercaFecha = val;

  bool hasTercaFecha() => _tercaFecha != null;

  // "quarta24h" field.
  bool? _quarta24h;
  bool get quarta24h => _quarta24h ?? false;
  set quarta24h(bool? val) => _quarta24h = val;

  bool hasQuarta24h() => _quarta24h != null;

  // "quartaAbre" field.
  String? _quartaAbre;
  String get quartaAbre => _quartaAbre ?? '';
  set quartaAbre(String? val) => _quartaAbre = val;

  bool hasQuartaAbre() => _quartaAbre != null;

  // "quartaFecha" field.
  String? _quartaFecha;
  String get quartaFecha => _quartaFecha ?? '';
  set quartaFecha(String? val) => _quartaFecha = val;

  bool hasQuartaFecha() => _quartaFecha != null;

  // "quinta24h" field.
  bool? _quinta24h;
  bool get quinta24h => _quinta24h ?? false;
  set quinta24h(bool? val) => _quinta24h = val;

  bool hasQuinta24h() => _quinta24h != null;

  // "quintaAbre" field.
  String? _quintaAbre;
  String get quintaAbre => _quintaAbre ?? '';
  set quintaAbre(String? val) => _quintaAbre = val;

  bool hasQuintaAbre() => _quintaAbre != null;

  // "quintaFecha" field.
  String? _quintaFecha;
  String get quintaFecha => _quintaFecha ?? '';
  set quintaFecha(String? val) => _quintaFecha = val;

  bool hasQuintaFecha() => _quintaFecha != null;

  // "sexta24h" field.
  bool? _sexta24h;
  bool get sexta24h => _sexta24h ?? false;
  set sexta24h(bool? val) => _sexta24h = val;

  bool hasSexta24h() => _sexta24h != null;

  // "sextaAbre" field.
  String? _sextaAbre;
  String get sextaAbre => _sextaAbre ?? '';
  set sextaAbre(String? val) => _sextaAbre = val;

  bool hasSextaAbre() => _sextaAbre != null;

  // "sextaFecha" field.
  String? _sextaFecha;
  String get sextaFecha => _sextaFecha ?? '';
  set sextaFecha(String? val) => _sextaFecha = val;

  bool hasSextaFecha() => _sextaFecha != null;

  // "sabado24h" field.
  bool? _sabado24h;
  bool get sabado24h => _sabado24h ?? false;
  set sabado24h(bool? val) => _sabado24h = val;

  bool hasSabado24h() => _sabado24h != null;

  // "sabadoAbre" field.
  String? _sabadoAbre;
  String get sabadoAbre => _sabadoAbre ?? '';
  set sabadoAbre(String? val) => _sabadoAbre = val;

  bool hasSabadoAbre() => _sabadoAbre != null;

  // "sabadoFecha" field.
  String? _sabadoFecha;
  String get sabadoFecha => _sabadoFecha ?? '';
  set sabadoFecha(String? val) => _sabadoFecha = val;

  bool hasSabadoFecha() => _sabadoFecha != null;

  // "domingo24h" field.
  bool? _domingo24h;
  bool get domingo24h => _domingo24h ?? false;
  set domingo24h(bool? val) => _domingo24h = val;

  bool hasDomingo24h() => _domingo24h != null;

  // "domingoAbre" field.
  String? _domingoAbre;
  String get domingoAbre => _domingoAbre ?? '';
  set domingoAbre(String? val) => _domingoAbre = val;

  bool hasDomingoAbre() => _domingoAbre != null;

  // "domingoFecha" field.
  String? _domingoFecha;
  String get domingoFecha => _domingoFecha ?? '';
  set domingoFecha(String? val) => _domingoFecha = val;

  bool hasDomingoFecha() => _domingoFecha != null;

  static FuncionamentoLocalStruct fromMap(Map<String, dynamic> data) =>
      FuncionamentoLocalStruct(
        segunda24h: data['segunda24h'] as bool?,
        segundaAbre: data['segundaAbre'] as String?,
        segundaFecha: data['segundaFecha'] as String?,
        terca24h: data['terca24h'] as bool?,
        tercaAbre: data['tercaAbre'] as String?,
        tercaFecha: data['tercaFecha'] as String?,
        quarta24h: data['quarta24h'] as bool?,
        quartaAbre: data['quartaAbre'] as String?,
        quartaFecha: data['quartaFecha'] as String?,
        quinta24h: data['quinta24h'] as bool?,
        quintaAbre: data['quintaAbre'] as String?,
        quintaFecha: data['quintaFecha'] as String?,
        sexta24h: data['sexta24h'] as bool?,
        sextaAbre: data['sextaAbre'] as String?,
        sextaFecha: data['sextaFecha'] as String?,
        sabado24h: data['sabado24h'] as bool?,
        sabadoAbre: data['sabadoAbre'] as String?,
        sabadoFecha: data['sabadoFecha'] as String?,
        domingo24h: data['domingo24h'] as bool?,
        domingoAbre: data['domingoAbre'] as String?,
        domingoFecha: data['domingoFecha'] as String?,
      );

  static FuncionamentoLocalStruct? maybeFromMap(dynamic data) => data is Map
      ? FuncionamentoLocalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'segunda24h': _segunda24h,
        'segundaAbre': _segundaAbre,
        'segundaFecha': _segundaFecha,
        'terca24h': _terca24h,
        'tercaAbre': _tercaAbre,
        'tercaFecha': _tercaFecha,
        'quarta24h': _quarta24h,
        'quartaAbre': _quartaAbre,
        'quartaFecha': _quartaFecha,
        'quinta24h': _quinta24h,
        'quintaAbre': _quintaAbre,
        'quintaFecha': _quintaFecha,
        'sexta24h': _sexta24h,
        'sextaAbre': _sextaAbre,
        'sextaFecha': _sextaFecha,
        'sabado24h': _sabado24h,
        'sabadoAbre': _sabadoAbre,
        'sabadoFecha': _sabadoFecha,
        'domingo24h': _domingo24h,
        'domingoAbre': _domingoAbre,
        'domingoFecha': _domingoFecha,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'segunda24h': serializeParam(
          _segunda24h,
          ParamType.bool,
        ),
        'segundaAbre': serializeParam(
          _segundaAbre,
          ParamType.String,
        ),
        'segundaFecha': serializeParam(
          _segundaFecha,
          ParamType.String,
        ),
        'terca24h': serializeParam(
          _terca24h,
          ParamType.bool,
        ),
        'tercaAbre': serializeParam(
          _tercaAbre,
          ParamType.String,
        ),
        'tercaFecha': serializeParam(
          _tercaFecha,
          ParamType.String,
        ),
        'quarta24h': serializeParam(
          _quarta24h,
          ParamType.bool,
        ),
        'quartaAbre': serializeParam(
          _quartaAbre,
          ParamType.String,
        ),
        'quartaFecha': serializeParam(
          _quartaFecha,
          ParamType.String,
        ),
        'quinta24h': serializeParam(
          _quinta24h,
          ParamType.bool,
        ),
        'quintaAbre': serializeParam(
          _quintaAbre,
          ParamType.String,
        ),
        'quintaFecha': serializeParam(
          _quintaFecha,
          ParamType.String,
        ),
        'sexta24h': serializeParam(
          _sexta24h,
          ParamType.bool,
        ),
        'sextaAbre': serializeParam(
          _sextaAbre,
          ParamType.String,
        ),
        'sextaFecha': serializeParam(
          _sextaFecha,
          ParamType.String,
        ),
        'sabado24h': serializeParam(
          _sabado24h,
          ParamType.bool,
        ),
        'sabadoAbre': serializeParam(
          _sabadoAbre,
          ParamType.String,
        ),
        'sabadoFecha': serializeParam(
          _sabadoFecha,
          ParamType.String,
        ),
        'domingo24h': serializeParam(
          _domingo24h,
          ParamType.bool,
        ),
        'domingoAbre': serializeParam(
          _domingoAbre,
          ParamType.String,
        ),
        'domingoFecha': serializeParam(
          _domingoFecha,
          ParamType.String,
        ),
      }.withoutNulls;

  static FuncionamentoLocalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FuncionamentoLocalStruct(
        segunda24h: deserializeParam(
          data['segunda24h'],
          ParamType.bool,
          false,
        ),
        segundaAbre: deserializeParam(
          data['segundaAbre'],
          ParamType.String,
          false,
        ),
        segundaFecha: deserializeParam(
          data['segundaFecha'],
          ParamType.String,
          false,
        ),
        terca24h: deserializeParam(
          data['terca24h'],
          ParamType.bool,
          false,
        ),
        tercaAbre: deserializeParam(
          data['tercaAbre'],
          ParamType.String,
          false,
        ),
        tercaFecha: deserializeParam(
          data['tercaFecha'],
          ParamType.String,
          false,
        ),
        quarta24h: deserializeParam(
          data['quarta24h'],
          ParamType.bool,
          false,
        ),
        quartaAbre: deserializeParam(
          data['quartaAbre'],
          ParamType.String,
          false,
        ),
        quartaFecha: deserializeParam(
          data['quartaFecha'],
          ParamType.String,
          false,
        ),
        quinta24h: deserializeParam(
          data['quinta24h'],
          ParamType.bool,
          false,
        ),
        quintaAbre: deserializeParam(
          data['quintaAbre'],
          ParamType.String,
          false,
        ),
        quintaFecha: deserializeParam(
          data['quintaFecha'],
          ParamType.String,
          false,
        ),
        sexta24h: deserializeParam(
          data['sexta24h'],
          ParamType.bool,
          false,
        ),
        sextaAbre: deserializeParam(
          data['sextaAbre'],
          ParamType.String,
          false,
        ),
        sextaFecha: deserializeParam(
          data['sextaFecha'],
          ParamType.String,
          false,
        ),
        sabado24h: deserializeParam(
          data['sabado24h'],
          ParamType.bool,
          false,
        ),
        sabadoAbre: deserializeParam(
          data['sabadoAbre'],
          ParamType.String,
          false,
        ),
        sabadoFecha: deserializeParam(
          data['sabadoFecha'],
          ParamType.String,
          false,
        ),
        domingo24h: deserializeParam(
          data['domingo24h'],
          ParamType.bool,
          false,
        ),
        domingoAbre: deserializeParam(
          data['domingoAbre'],
          ParamType.String,
          false,
        ),
        domingoFecha: deserializeParam(
          data['domingoFecha'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FuncionamentoLocalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FuncionamentoLocalStruct &&
        segunda24h == other.segunda24h &&
        segundaAbre == other.segundaAbre &&
        segundaFecha == other.segundaFecha &&
        terca24h == other.terca24h &&
        tercaAbre == other.tercaAbre &&
        tercaFecha == other.tercaFecha &&
        quarta24h == other.quarta24h &&
        quartaAbre == other.quartaAbre &&
        quartaFecha == other.quartaFecha &&
        quinta24h == other.quinta24h &&
        quintaAbre == other.quintaAbre &&
        quintaFecha == other.quintaFecha &&
        sexta24h == other.sexta24h &&
        sextaAbre == other.sextaAbre &&
        sextaFecha == other.sextaFecha &&
        sabado24h == other.sabado24h &&
        sabadoAbre == other.sabadoAbre &&
        sabadoFecha == other.sabadoFecha &&
        domingo24h == other.domingo24h &&
        domingoAbre == other.domingoAbre &&
        domingoFecha == other.domingoFecha;
  }

  @override
  int get hashCode => const ListEquality().hash([
        segunda24h,
        segundaAbre,
        segundaFecha,
        terca24h,
        tercaAbre,
        tercaFecha,
        quarta24h,
        quartaAbre,
        quartaFecha,
        quinta24h,
        quintaAbre,
        quintaFecha,
        sexta24h,
        sextaAbre,
        sextaFecha,
        sabado24h,
        sabadoAbre,
        sabadoFecha,
        domingo24h,
        domingoAbre,
        domingoFecha
      ]);
}

FuncionamentoLocalStruct createFuncionamentoLocalStruct({
  bool? segunda24h,
  String? segundaAbre,
  String? segundaFecha,
  bool? terca24h,
  String? tercaAbre,
  String? tercaFecha,
  bool? quarta24h,
  String? quartaAbre,
  String? quartaFecha,
  bool? quinta24h,
  String? quintaAbre,
  String? quintaFecha,
  bool? sexta24h,
  String? sextaAbre,
  String? sextaFecha,
  bool? sabado24h,
  String? sabadoAbre,
  String? sabadoFecha,
  bool? domingo24h,
  String? domingoAbre,
  String? domingoFecha,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FuncionamentoLocalStruct(
      segunda24h: segunda24h,
      segundaAbre: segundaAbre,
      segundaFecha: segundaFecha,
      terca24h: terca24h,
      tercaAbre: tercaAbre,
      tercaFecha: tercaFecha,
      quarta24h: quarta24h,
      quartaAbre: quartaAbre,
      quartaFecha: quartaFecha,
      quinta24h: quinta24h,
      quintaAbre: quintaAbre,
      quintaFecha: quintaFecha,
      sexta24h: sexta24h,
      sextaAbre: sextaAbre,
      sextaFecha: sextaFecha,
      sabado24h: sabado24h,
      sabadoAbre: sabadoAbre,
      sabadoFecha: sabadoFecha,
      domingo24h: domingo24h,
      domingoAbre: domingoAbre,
      domingoFecha: domingoFecha,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FuncionamentoLocalStruct? updateFuncionamentoLocalStruct(
  FuncionamentoLocalStruct? funcionamentoLocal, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    funcionamentoLocal
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFuncionamentoLocalStructData(
  Map<String, dynamic> firestoreData,
  FuncionamentoLocalStruct? funcionamentoLocal,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (funcionamentoLocal == null) {
    return;
  }
  if (funcionamentoLocal.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && funcionamentoLocal.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final funcionamentoLocalData =
      getFuncionamentoLocalFirestoreData(funcionamentoLocal, forFieldValue);
  final nestedData =
      funcionamentoLocalData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      funcionamentoLocal.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFuncionamentoLocalFirestoreData(
  FuncionamentoLocalStruct? funcionamentoLocal, [
  bool forFieldValue = false,
]) {
  if (funcionamentoLocal == null) {
    return {};
  }
  final firestoreData = mapToFirestore(funcionamentoLocal.toMap());

  // Add any Firestore field values
  funcionamentoLocal.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFuncionamentoLocalListFirestoreData(
  List<FuncionamentoLocalStruct>? funcionamentoLocals,
) =>
    funcionamentoLocals
        ?.map((e) => getFuncionamentoLocalFirestoreData(e, true))
        .toList() ??
    [];
