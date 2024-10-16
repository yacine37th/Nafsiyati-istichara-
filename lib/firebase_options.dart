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
    apiKey: 'AIzaSyDpSk1vzEc99XZwfsarOYklKmv8beWbvxU',
    appId: '1:50600056972:web:82a18ba40798350aebc3a9',
    messagingSenderId: '50600056972',
    projectId: 'nafsiya-368a6',
    authDomain: 'nafsiya-368a6.firebaseapp.com',
    storageBucket: 'nafsiya-368a6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEUyVTa6wwU-K4Jh2xW1yVmrGcAbgUGLw',
    appId: '1:50600056972:android:af5e8b313e8bb974ebc3a9',
    messagingSenderId: '50600056972',
    projectId: 'nafsiya-368a6',
    storageBucket: 'nafsiya-368a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJHsEaSxlLezNOk0ynn69N4QydsqsAO-c',
    appId: '1:50600056972:ios:12f61a1e75ef6b74ebc3a9',
    messagingSenderId: '50600056972',
    projectId: 'nafsiya-368a6',
    storageBucket: 'nafsiya-368a6.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDJHsEaSxlLezNOk0ynn69N4QydsqsAO-c',
    appId: '1:50600056972:ios:12f61a1e75ef6b74ebc3a9',
    messagingSenderId: '50600056972',
    projectId: 'nafsiya-368a6',
    storageBucket: 'nafsiya-368a6.appspot.com',
    iosBundleId: 'com.example.flutterApplication1',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDpSk1vzEc99XZwfsarOYklKmv8beWbvxU',
    appId: '1:50600056972:web:c9c11226012ff096ebc3a9',
    messagingSenderId: '50600056972',
    projectId: 'nafsiya-368a6',
    authDomain: 'nafsiya-368a6.firebaseapp.com',
    storageBucket: 'nafsiya-368a6.appspot.com',
  );
}
