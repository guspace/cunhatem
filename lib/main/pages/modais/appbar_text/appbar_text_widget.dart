import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appbar_text_model.dart';
export 'appbar_text_model.dart';

class AppbarTextWidget extends StatefulWidget {
  const AppbarTextWidget({
    super.key,
    String? text,
  }) : text = text ?? 'CunhaTem';

  final String text;

  @override
  State<AppbarTextWidget> createState() => _AppbarTextWidgetState();
}

class _AppbarTextWidgetState extends State<AppbarTextWidget> {
  late AppbarTextModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppbarTextModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      valueOrDefault<String>(
        widget.text,
        'AppBar',
      ),
      style: FlutterFlowTheme.of(context).headlineMedium.override(
            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
            color: Colors.white,
            fontSize: 22.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.bold,
            useGoogleFonts: GoogleFonts.asMap()
                .containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
          ),
    );
  }
}
