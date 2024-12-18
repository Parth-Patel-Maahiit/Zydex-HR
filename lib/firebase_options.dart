// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDVoKTl9KxWOGjVaKvAmdrlmvBxOdBSq10',
    appId: '1:781523031161:web:37b66d90c27b4e6f5970a8',
    messagingSenderId: '781523031161',
    projectId: 'zydex-hr',
    authDomain: 'zydex-hr.firebaseapp.com',
    storageBucket: 'zydex-hr.firebasestorage.app',
    measurementId: 'G-F54WTF84NE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBczvUGJUTkTKezWwG3YFJhpGDr4gJJkP0',
    appId: '1:781523031161:android:4ee86e8b1a953df15970a8',
    messagingSenderId: '781523031161',
    projectId: 'zydex-hr',
    storageBucket: 'zydex-hr.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuV87G_2xA97YwyCEd2dpdugX7j3-HPm0',
    appId: '1:781523031161:ios:970c1824b54a4fd75970a8',
    messagingSenderId: '781523031161',
    projectId: 'zydex-hr',
    storageBucket: 'zydex-hr.firebasestorage.app',
    iosBundleId: 'com.example.zydexHr',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuV87G_2xA97YwyCEd2dpdugX7j3-HPm0',
    appId: '1:781523031161:ios:970c1824b54a4fd75970a8',
    messagingSenderId: '781523031161',
    projectId: 'zydex-hr',
    storageBucket: 'zydex-hr.firebasestorage.app',
    iosBundleId: 'com.example.zydexHr',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVoKTl9KxWOGjVaKvAmdrlmvBxOdBSq10',
    appId: '1:781523031161:web:29415245ca38b9385970a8',
    messagingSenderId: '781523031161',
    projectId: 'zydex-hr',
    authDomain: 'zydex-hr.firebaseapp.com',
    storageBucket: 'zydex-hr.firebasestorage.app',
    measurementId: 'G-FV0MMVS3S1',
  );

}