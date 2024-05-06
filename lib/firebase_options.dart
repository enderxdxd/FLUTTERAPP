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
    apiKey: 'AIzaSyDTednFbAskhSZ6Bm2QZNIgpq627X83DPg',
    appId: '1:103543937675:web:73700a163ebcbfab4bd28e',
    messagingSenderId: '103543937675',
    projectId: 'flutterapp-a6108',
    authDomain: 'flutterapp-a6108.firebaseapp.com',
    databaseURL: 'https://flutterapp-a6108-default-rtdb.firebaseio.com',
    storageBucket: 'flutterapp-a6108.appspot.com',
    measurementId: 'G-TRYL2TN5DN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBky3VVAwQh-unnZEZNB8OLdkmUx_zdiz0',
    appId: '1:103543937675:android:461f69679633d5b14bd28e',
    messagingSenderId: '103543937675',
    projectId: 'flutterapp-a6108',
    databaseURL: 'https://flutterapp-a6108-default-rtdb.firebaseio.com',
    storageBucket: 'flutterapp-a6108.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDiPgjvUbAuAcZKoX9gZRqsNzzOJc8pSKI',
    appId: '1:103543937675:ios:9394b1c50b5768644bd28e',
    messagingSenderId: '103543937675',
    projectId: 'flutterapp-a6108',
    databaseURL: 'https://flutterapp-a6108-default-rtdb.firebaseio.com',
    storageBucket: 'flutterapp-a6108.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDiPgjvUbAuAcZKoX9gZRqsNzzOJc8pSKI',
    appId: '1:103543937675:ios:9394b1c50b5768644bd28e',
    messagingSenderId: '103543937675',
    projectId: 'flutterapp-a6108',
    databaseURL: 'https://flutterapp-a6108-default-rtdb.firebaseio.com',
    storageBucket: 'flutterapp-a6108.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTednFbAskhSZ6Bm2QZNIgpq627X83DPg',
    appId: '1:103543937675:web:adc23915e405eb8a4bd28e',
    messagingSenderId: '103543937675',
    projectId: 'flutterapp-a6108',
    authDomain: 'flutterapp-a6108.firebaseapp.com',
    databaseURL: 'https://flutterapp-a6108-default-rtdb.firebaseio.com',
    storageBucket: 'flutterapp-a6108.appspot.com',
    measurementId: 'G-X1T90Y72SS',
  );
}