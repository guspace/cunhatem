import 'package:collection/collection.dart';

enum Abas {
  inicio,
  explorar,
  eventos,
  menu,
}

enum LocalVisibilidade {
  galeriaReduzida,
  descricao,
  contatos,
  funcionamento,
}

enum TipoUser {
  admin,
  colaborador,
  empreendedor,
  turista,
}

enum TipoGerenciar {
  local,
  evento,
  experiencia,
}

enum SuporteTipo {
  feedback,
  suporte,
}

enum StatusSuporte {
  aguardando,
  respondido,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Abas):
      return Abas.values.deserialize(value) as T?;
    case (LocalVisibilidade):
      return LocalVisibilidade.values.deserialize(value) as T?;
    case (TipoUser):
      return TipoUser.values.deserialize(value) as T?;
    case (TipoGerenciar):
      return TipoGerenciar.values.deserialize(value) as T?;
    case (SuporteTipo):
      return SuporteTipo.values.deserialize(value) as T?;
    case (StatusSuporte):
      return StatusSuporte.values.deserialize(value) as T?;
    default:
      return null;
  }
}
