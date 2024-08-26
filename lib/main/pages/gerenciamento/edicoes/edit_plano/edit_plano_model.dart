import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_plano_widget.dart' show EditPlanoWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class EditPlanoModel extends FlutterFlowModel<EditPlanoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for textNome widget.
  FocusNode? textNomeFocusNode;
  TextEditingController? textNomeTextController;
  String? Function(BuildContext, String?)? textNomeTextControllerValidator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for SwitchAchadosPerdidos widget.
  bool? switchAchadosPerdidosValue;
  // State field(s) for SwitchDisponibilidadeLeitos widget.
  bool? switchDisponibilidadeLeitosValue;
  // State field(s) for SwitchAvaliacaoClientes widget.
  bool? switchAvaliacaoClientesValue;
  // State field(s) for SwitchPainel widget.
  bool? switchPainelValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for SwitchDescricaoCompleta widget.
  bool? switchDescricaoCompletaValue;
  // State field(s) for SwitchComodidades widget.
  bool? switchComodidadesValue;
  // State field(s) for SwitchContatos widget.
  bool? switchContatosValue;
  // State field(s) for SwitchFuncionamento widget.
  bool? switchFuncionamentoValue;
  // State field(s) for SwitchSeloCunhatur widget.
  bool? switchSeloCunhaturValue;
  // State field(s) for countFotosGaleria widget.
  int? countFotosGaleriaValue;
  // State field(s) for countVideosGaleria widget.
  int? countVideosGaleriaValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for SwitchSeloCunhaturEvento widget.
  bool? switchSeloCunhaturEventoValue;
  // State field(s) for countEventos widget.
  int? countEventosValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for SwitchSeloCunhaturExperiencia widget.
  bool? switchSeloCunhaturExperienciaValue;
  // State field(s) for countExperiencias widget.
  int? countExperienciasValue;
  // Stores action output result for [Firestore Query - Query a collection] action in btbSalvar widget.
  List<PlanosRecord>? planos;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textNomeFocusNode?.dispose();
    textNomeTextController?.dispose();

    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
  }
}
