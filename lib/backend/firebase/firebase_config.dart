import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx4P3ShmWTYQcsu7QW68PhA7V6HqQg1K4",
            authDomain: "zeeed2-38d64.firebaseapp.com",
            projectId: "zeeed2-38d64",
            storageBucket: "zeeed2-38d64.appspot.com",
            messagingSenderId: "728145948761",
            appId: "1:728145948761:web:48a2d49e99ec6951304148",
            measurementId: "G-QFL39WB24X"));
  } else {
    await Firebase.initializeApp();
  }
}
