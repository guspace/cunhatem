import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/card_modais/favoritar/favoritar_widget.dart';
import 'card_experiencia1_widget.dart' show CardExperiencia1Widget;
import 'package:flutter/material.dart';

class CardExperiencia1Model extends FlutterFlowModel<CardExperiencia1Widget> {
  ///  State fields for stateful widgets in this component.

  // Model for favoritar component.
  late FavoritarModel favoritarModel;

  @override
  void initState(BuildContext context) {
    favoritarModel = createModel(context, () => FavoritarModel());
  }

  @override
  void dispose() {
    favoritarModel.dispose();
  }
}
