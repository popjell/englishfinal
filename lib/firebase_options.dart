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
    apiKey: 'AIzaSyCmpUUJk5cKXbND2-IwpbVyjTXEJJ3s37A',
    appId: '1:322364530075:web:8ee9e5963aa40321d5553e',
    messagingSenderId: '322364530075',
    projectId: 'englishculm',
    authDomain: 'englishculm.firebaseapp.com',
    storageBucket: 'englishculm.appspot.com',
    measurementId: 'G-1H06P9FM1X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDJF5QKoncmDm1Uo66pkbd2uBEFvkDrUjY',
    appId: '1:322364530075:android:3c26744e5f746736d5553e',
    messagingSenderId: '322364530075',
    projectId: 'englishculm',
    storageBucket: 'englishculm.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBTFaq-dSUDYkHRP5kY6H9pvFc4Ah-8h4c',
    appId: '1:322364530075:ios:e0e7624cfa88417dd5553e',
    messagingSenderId: '322364530075',
    projectId: 'englishculm',
    storageBucket: 'englishculm.appspot.com',
    iosClientId: '322364530075-rjtqqrqg98scrgqe8dmv6c25dpi4je4e.apps.googleusercontent.com',
    iosBundleId: 'com.example.englishCulminating',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBTFaq-dSUDYkHRP5kY6H9pvFc4Ah-8h4c',
    appId: '1:322364530075:ios:e0e7624cfa88417dd5553e',
    messagingSenderId: '322364530075',
    projectId: 'englishculm',
    storageBucket: 'englishculm.appspot.com',
    iosClientId: '322364530075-rjtqqrqg98scrgqe8dmv6c25dpi4je4e.apps.googleusercontent.com',
    iosBundleId: 'com.example.englishCulminating',
  );
}
