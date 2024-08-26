import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'funcionamento_edit_widget.dart' show FuncionamentoEditWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FuncionamentoEditModel extends FlutterFlowModel<FuncionamentoEditWidget> {
  ///  Local state fields for this component.

  FuncionamentoLocalStruct? funcionamento;
  void updateFuncionamentoStruct(Function(FuncionamentoLocalStruct) updateFn) {
    updateFn(funcionamento ??= FuncionamentoLocalStruct());
  }

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for abertoSegunda widget.
  bool? abertoSegundaValue;
  // State field(s) for segunda24h widget.
  bool? segunda24hValue;
  // State field(s) for segundaAbre widget.
  FocusNode? segundaAbreFocusNode;
  TextEditingController? segundaAbreTextController;
  final segundaAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? segundaAbreTextControllerValidator;
  String? _segundaAbreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for segundaFecha widget.
  FocusNode? segundaFechaFocusNode;
  TextEditingController? segundaFechaTextController;
  final segundaFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? segundaFechaTextControllerValidator;
  String? _segundaFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoTerca widget.
  bool? abertoTercaValue;
  // State field(s) for terca24h widget.
  bool? terca24hValue;
  // State field(s) for tercaAbre widget.
  FocusNode? tercaAbreFocusNode;
  TextEditingController? tercaAbreTextController;
  final tercaAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? tercaAbreTextControllerValidator;
  String? _tercaAbreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for tercaFecha widget.
  FocusNode? tercaFechaFocusNode;
  TextEditingController? tercaFechaTextController;
  final tercaFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? tercaFechaTextControllerValidator;
  String? _tercaFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoQuarta widget.
  bool? abertoQuartaValue;
  // State field(s) for quarta24h widget.
  bool? quarta24hValue;
  // State field(s) for quartaAbre widget.
  FocusNode? quartaAbreFocusNode;
  TextEditingController? quartaAbreTextController;
  final quartaAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? quartaAbreTextControllerValidator;
  String? _quartaAbreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for quartaFecha widget.
  FocusNode? quartaFechaFocusNode;
  TextEditingController? quartaFechaTextController;
  final quartaFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? quartaFechaTextControllerValidator;
  String? _quartaFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoQuinta widget.
  bool? abertoQuintaValue;
  // State field(s) for quinta24h widget.
  bool? quinta24hValue;
  // State field(s) for quintaAbre widget.
  FocusNode? quintaAbreFocusNode;
  TextEditingController? quintaAbreTextController;
  final quintaAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? quintaAbreTextControllerValidator;
  String? _quintaAbreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for quintaFecha widget.
  FocusNode? quintaFechaFocusNode;
  TextEditingController? quintaFechaTextController;
  final quintaFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? quintaFechaTextControllerValidator;
  String? _quintaFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoSexta widget.
  bool? abertoSextaValue;
  // State field(s) for sexta24h widget.
  bool? sexta24hValue;
  // State field(s) for sextaAbre widget.
  FocusNode? sextaAbreFocusNode;
  TextEditingController? sextaAbreTextController;
  final sextaAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? sextaAbreTextControllerValidator;
  String? _sextaAbreTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for sextaFecha widget.
  FocusNode? sextaFechaFocusNode;
  TextEditingController? sextaFechaTextController;
  final sextaFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? sextaFechaTextControllerValidator;
  String? _sextaFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoSabado widget.
  bool? abertoSabadoValue;
  // State field(s) for sabado24h widget.
  bool? sabado24hValue;
  // State field(s) for sabadoAbre widget.
  FocusNode? sabadoAbreFocusNode;
  TextEditingController? sabadoAbreTextController;
  final sabadoAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? sabadoAbreTextControllerValidator;
  String? _sabadoAbreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for sabadoFecha widget.
  FocusNode? sabadoFechaFocusNode;
  TextEditingController? sabadoFechaTextController;
  final sabadoFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? sabadoFechaTextControllerValidator;
  String? _sabadoFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for abertoDomingo widget.
  bool? abertoDomingoValue;
  // State field(s) for domingo24h widget.
  bool? domingo24hValue;
  // State field(s) for domingoAbre widget.
  FocusNode? domingoAbreFocusNode;
  TextEditingController? domingoAbreTextController;
  final domingoAbreMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? domingoAbreTextControllerValidator;
  String? _domingoAbreTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  // State field(s) for domingoFecha widget.
  FocusNode? domingoFechaFocusNode;
  TextEditingController? domingoFechaTextController;
  final domingoFechaMask = MaskTextInputFormatter(mask: '##:##');
  String? Function(BuildContext, String?)? domingoFechaTextControllerValidator;
  String? _domingoFechaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp('^([01]?[0-9]|2[0-3]):[0-5][0-9]\$').hasMatch(val)) {
      return 'Horário inválido';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    segundaAbreTextControllerValidator = _segundaAbreTextControllerValidator;
    segundaFechaTextControllerValidator = _segundaFechaTextControllerValidator;
    tercaAbreTextControllerValidator = _tercaAbreTextControllerValidator;
    tercaFechaTextControllerValidator = _tercaFechaTextControllerValidator;
    quartaAbreTextControllerValidator = _quartaAbreTextControllerValidator;
    quartaFechaTextControllerValidator = _quartaFechaTextControllerValidator;
    quintaAbreTextControllerValidator = _quintaAbreTextControllerValidator;
    quintaFechaTextControllerValidator = _quintaFechaTextControllerValidator;
    sextaAbreTextControllerValidator = _sextaAbreTextControllerValidator;
    sextaFechaTextControllerValidator = _sextaFechaTextControllerValidator;
    sabadoAbreTextControllerValidator = _sabadoAbreTextControllerValidator;
    sabadoFechaTextControllerValidator = _sabadoFechaTextControllerValidator;
    domingoAbreTextControllerValidator = _domingoAbreTextControllerValidator;
    domingoFechaTextControllerValidator = _domingoFechaTextControllerValidator;
  }

  @override
  void dispose() {
    segundaAbreFocusNode?.dispose();
    segundaAbreTextController?.dispose();

    segundaFechaFocusNode?.dispose();
    segundaFechaTextController?.dispose();

    tercaAbreFocusNode?.dispose();
    tercaAbreTextController?.dispose();

    tercaFechaFocusNode?.dispose();
    tercaFechaTextController?.dispose();

    quartaAbreFocusNode?.dispose();
    quartaAbreTextController?.dispose();

    quartaFechaFocusNode?.dispose();
    quartaFechaTextController?.dispose();

    quintaAbreFocusNode?.dispose();
    quintaAbreTextController?.dispose();

    quintaFechaFocusNode?.dispose();
    quintaFechaTextController?.dispose();

    sextaAbreFocusNode?.dispose();
    sextaAbreTextController?.dispose();

    sextaFechaFocusNode?.dispose();
    sextaFechaTextController?.dispose();

    sabadoAbreFocusNode?.dispose();
    sabadoAbreTextController?.dispose();

    sabadoFechaFocusNode?.dispose();
    sabadoFechaTextController?.dispose();

    domingoAbreFocusNode?.dispose();
    domingoAbreTextController?.dispose();

    domingoFechaFocusNode?.dispose();
    domingoFechaTextController?.dispose();
  }
}
