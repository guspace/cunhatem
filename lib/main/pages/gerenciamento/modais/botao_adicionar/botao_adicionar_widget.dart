import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/pages/gerenciamento/modais/criar_novo/criar_novo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'botao_adicionar_model.dart';
export 'botao_adicionar_model.dart';

class BotaoAdicionarWidget extends StatefulWidget {
  const BotaoAdicionarWidget({
    super.key,
    required this.tipoGerenciar,
  });

  final TipoGerenciar? tipoGerenciar;

  @override
  State<BotaoAdicionarWidget> createState() => _BotaoAdicionarWidgetState();
}

class _BotaoAdicionarWidgetState extends State<BotaoAdicionarWidget> {
  late BotaoAdicionarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BotaoAdicionarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(),
        child: Material(
          color: Colors.transparent,
          elevation: 4.0,
          shape: const CircleBorder(),
          child: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: FlutterFlowIconButton(
              borderColor: FlutterFlowTheme.of(context).primary,
              borderRadius: 50.0,
              borderWidth: 1.0,
              buttonSize: 50.0,
              fillColor: FlutterFlowTheme.of(context).primary,
              icon: const Icon(
                Icons.add,
                color: Colors.white,
                size: 30.0,
              ),
              onPressed: () async {
                logFirebaseEvent('BOTAO_ADICIONAR_COMP_add_ICN_ON_TAP');
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  enableDrag: false,
                  useSafeArea: true,
                  context: context,
                  builder: (context) {
                    return WebViewAware(
                      child: Padding(
                        padding: MediaQuery.viewInsetsOf(context),
                        child: CriarNovoWidget(
                          tipoGerenciar: widget.tipoGerenciar!,
                        ),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));

                HapticFeedback.lightImpact();
              },
            ),
          ),
        ),
      ),
    );
  }
}
