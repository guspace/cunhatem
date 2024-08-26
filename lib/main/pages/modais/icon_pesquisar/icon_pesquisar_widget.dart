import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/modais/pesquisar/pesquisar_widget.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'icon_pesquisar_model.dart';
export 'icon_pesquisar_model.dart';

class IconPesquisarWidget extends StatefulWidget {
  const IconPesquisarWidget({super.key});

  @override
  State<IconPesquisarWidget> createState() => _IconPesquisarWidgetState();
}

class _IconPesquisarWidgetState extends State<IconPesquisarWidget> {
  late IconPesquisarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconPesquisarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 50.0,
      buttonSize: 60.0,
      icon: const Icon(
        Icons.search_sharp,
        color: Colors.white,
        size: 28.0,
      ),
      onPressed: () async {
        logFirebaseEvent('ICON_PESQUISAR_COMP_iconPesquisar_ON_TAP');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return WebViewAware(
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: const SizedBox(
                  height: double.infinity,
                  child: PesquisarWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      },
    );
  }
}
