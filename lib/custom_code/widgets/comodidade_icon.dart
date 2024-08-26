// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '../widgets/grid_icons.dart';

class ComodidadeIcon extends StatefulWidget {
  const ComodidadeIcon({
    super.key,
    this.width,
    this.height,
    required this.iconName,
    required this.iconSize,
    required this.color,
  });

  final double? width;
  final double? height;
  final String iconName;
  final double iconSize;
  final Color color;

  @override
  State<ComodidadeIcon> createState() => _ComodidadeIconState();
}

class _ComodidadeIconState extends State<ComodidadeIcon> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconsUtil.getByName(widget.iconName),
      size: widget.iconSize,
      color: widget.color,
    );
  }
}
