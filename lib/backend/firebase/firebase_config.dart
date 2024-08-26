import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAIWImABKGPpXD-dt3NaxGQKAGz9xQ-53E",
            authDomain: "cunhatem-app.firebaseapp.com",
            projectId: "cunhatem-app",
            storageBucket: "cunhatem-app.appspot.com",
            messagingSenderId: "1090586376485",
            appId: "1:1090586376485:web:f2c254ade6389f925442cc",
            measurementId: "G-FM5Q10P62X"));
  } else {
    await Firebase.initializeApp();
  }
}
