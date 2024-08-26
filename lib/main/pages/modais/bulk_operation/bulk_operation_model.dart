import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'bulk_operation_widget.dart' show BulkOperationWidget;
import 'package:flutter/material.dart';

class BulkOperationModel extends FlutterFlowModel<BulkOperationWidget> {
  ///  Local state fields for this component.

  List<LocaisRecord> locais = [];
  void addToLocais(LocaisRecord item) => locais.add(item);
  void removeFromLocais(LocaisRecord item) => locais.remove(item);
  void removeAtIndexFromLocais(int index) => locais.removeAt(index);
  void insertAtIndexInLocais(int index, LocaisRecord item) =>
      locais.insert(index, item);
  void updateLocaisAtIndex(int index, Function(LocaisRecord) updateFn) =>
      locais[index] = updateFn(locais[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<LocaisRecord>? listaLocaisIds;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<LocaisRecord>? listaLocais;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
