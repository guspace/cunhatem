import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/appbar_text/appbar_text_widget.dart';
import '/main/pages/modais/card_modais/card_experiencia1/card_experiencia1_widget.dart';
import '/main/pages/modais/card_modais/card_local1/card_local1_widget.dart';
import '/main/pages/modais/menu_bar/menu_bar_widget.dart';
import 'favoritos_widget.dart' show FavoritosWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class FavoritosModel extends FlutterFlowModel<FavoritosWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for appbarText component.
  late AppbarTextModel appbarTextModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Models for cardLocal1 dynamic component.
  late FlutterFlowDynamicModels<CardLocal1Model> cardLocal1Models;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Models for cardExperiencia1 dynamic component.
  late FlutterFlowDynamicModels<CardExperiencia1Model> cardExperiencia1Models;
  // Model for menuBar component.
  late MenuBarModel menuBarModel;

  @override
  void initState(BuildContext context) {
    appbarTextModel = createModel(context, () => AppbarTextModel());
    cardLocal1Models = FlutterFlowDynamicModels(() => CardLocal1Model());
    cardExperiencia1Models =
        FlutterFlowDynamicModels(() => CardExperiencia1Model());
    menuBarModel = createModel(context, () => MenuBarModel());
  }

  @override
  void dispose() {
    appbarTextModel.dispose();
    expandableExpandableController1.dispose();
    cardLocal1Models.dispose();
    expandableExpandableController2.dispose();
    cardExperiencia1Models.dispose();
    menuBarModel.dispose();
  }
}
