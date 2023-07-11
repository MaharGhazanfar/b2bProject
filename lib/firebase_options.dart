// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCSZMtr-ibZjYF4q1Bl2VZxxm21ZwVfXQA',
    appId: '1:174324965951:web:8fae721c07c6b4a8f74e8a',
    messagingSenderId: '174324965951',
    projectId: 'b2bservice-4d3b4',
    authDomain: 'b2bservice-4d3b4.firebaseapp.com',
    storageBucket: 'b2bservice-4d3b4.appspot.com',
    measurementId: 'G-PZRKMPSPGE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7FY919GoQY1qOl9Hisfs98ZLEORbVChI',
    appId: '1:174324965951:android:c1a911f40cc49aaff74e8a',
    messagingSenderId: '174324965951',
    projectId: 'b2bservice-4d3b4',
    storageBucket: 'b2bservice-4d3b4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpFs-l_dn3BltuDaxnze55rSXz7BP_P-s',
    appId: '1:174324965951:ios:02caa9e01160590af74e8a',
    messagingSenderId: '174324965951',
    projectId: 'b2bservice-4d3b4',
    storageBucket: 'b2bservice-4d3b4.appspot.com',
    iosClientId: '174324965951-v02qiq0esn4t8krfc33n0b2ccmaradg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.productsDetails',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpFs-l_dn3BltuDaxnze55rSXz7BP_P-s',
    appId: '1:174324965951:ios:9fbd0f1789ba54bcf74e8a',
    messagingSenderId: '174324965951',
    projectId: 'b2bservice-4d3b4',
    storageBucket: 'b2bservice-4d3b4.appspot.com',
    iosClientId: '174324965951-vp4d2ssmvl49rbov6vbhqupollhnn4pg.apps.googleusercontent.com',
    iosBundleId: 'com.example.productsDetails.RunnerTests',
  );
}
