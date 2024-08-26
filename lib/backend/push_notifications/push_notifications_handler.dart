import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primary,
          child: Center(
            child: Image.asset(
              'assets/images/logo-android.png',
              width: 300.0,
              height: 300.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'home': ParameterData.none(),
  'eventos': ParameterData.none(),
  'favoritos': ParameterData.none(),
  'gerenciamentoAdm': ParameterData.none(),
  'local': (data) async {
    final allParams = {
      'refLocal': getParameter<DocumentReference>(data, 'refLocal'),
    };
    return ParameterData(
      requiredParams: {
        'refLocal': serializeParam(
          allParams['refLocal'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'boasVindas': ParameterData.none(),
  'criarConta': ParameterData.none(),
  'login': ParameterData.none(),
  'esqueciSenha': ParameterData.none(),
  'evento': (data) async {
    final allParams = {
      'refEvento': getParameter<DocumentReference>(data, 'refEvento'),
    };
    return ParameterData(
      requiredParams: {
        'refEvento': serializeParam(
          allParams['refEvento'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'mapaLista': ParameterData.none(),
  'experiencia': (data) async {
    final allParams = {
      'refExperiencia': getParameter<DocumentReference>(data, 'refExperiencia'),
    };
    return ParameterData(
      requiredParams: {
        'refExperiencia': serializeParam(
          allParams['refExperiencia'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'menu': ParameterData.none(),
  'termosUso': (data) async {
    final allParams = {
      'conteudo': getParameter<String>(data, 'conteudo'),
    };
    return ParameterData(
      requiredParams: {
        'conteudo': serializeParam(
          allParams['conteudo'],
          ParamType.String,
        ),
      },
      allParams: allParams,
    );
  },
  'suporte': ParameterData.none(),
  'listaUsuarios': ParameterData.none(),
  'listaLocais': ParameterData.none(),
  'listaEventos': ParameterData.none(),
  'listaExperiencias': ParameterData.none(),
  'listaPlanos': ParameterData.none(),
  'listaCategorias': ParameterData.none(),
  'listaComodidades': ParameterData.none(),
  'listaFAQ': ParameterData.none(),
  'experienciaEdit': (data) async => ParameterData(
        allParams: {
          'refExperiencia':
              getParameter<DocumentReference>(data, 'refExperiencia'),
          'novo': getParameter<bool>(data, 'novo'),
        },
      ),
  'localEdit': (data) async => ParameterData(
        allParams: {
          'refLocal': getParameter<DocumentReference>(data, 'refLocal'),
          'novo': getParameter<bool>(data, 'novo'),
        },
      ),
  'explore': ParameterData.none(),
  'listaStories': ParameterData.none(),
  'listaExperiencia': ParameterData.none(),
  'webIndisponivel': ParameterData.none(),
  'semConexao': ParameterData.none(),
  'eventoEdit': (data) async => ParameterData(
        allParams: {
          'refEvento': getParameter<DocumentReference>(data, 'refEvento'),
          'novo': getParameter<bool>(data, 'novo'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
