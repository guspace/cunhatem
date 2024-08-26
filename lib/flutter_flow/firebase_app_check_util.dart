import 'package:firebase_app_check/firebase_app_check.dart';

Future initializeFirebaseAppCheck() => FirebaseAppCheck.instance.activate(
      webProvider:
          ReCaptchaV3Provider('6LfipSkqAAAAAFjFYeb-28WYepJr5Th5OVc_rGkf'),
      androidProvider: AndroidProvider.playIntegrity,
    );
