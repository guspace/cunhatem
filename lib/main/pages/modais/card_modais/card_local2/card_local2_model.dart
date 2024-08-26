import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/favoritar/favoritar_widget.dart';
import '/main/pages/modais/local_aberto/local_aberto_widget.dart';
import 'card_local2_widget.dart' show CardLocal2Widget;
import 'package:flutter/material.dart';

class CardLocal2Model extends FlutterFlowModel<CardLocal2Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for favoritar component.
  late FavoritarModel favoritarModel;
  // Model for localAberto component.
  late LocalAbertoModel localAbertoModel;

  @override
  void initState(BuildContext context) {
    favoritarModel = createModel(context, () => FavoritarModel());
    localAbertoModel = createModel(context, () => LocalAbertoModel());
  }

  @override
  void dispose() {
    favoritarModel.dispose();
    localAbertoModel.dispose();
  }
}
