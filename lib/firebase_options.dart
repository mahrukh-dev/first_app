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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCmhrF2EKRqpnXhze-yVQqw97nyiyr2w8Y',
    appId: '1:261128275046:web:0e78ce3e983890184819a7',
    messagingSenderId: '261128275046',
    projectId: 'lpgenius',
    authDomain: 'lpgenius.firebaseapp.com',
    storageBucket: 'lpgenius.appspot.com',
    measurementId: 'G-R9Y3KR0RFX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqAm5NvKuXuxw3V72MC-b9QKXcV-6TW6s',
    appId: '1:261128275046:android:db8bce7f526bf8ad4819a7',
    messagingSenderId: '261128275046',
    projectId: 'lpgenius',
    storageBucket: 'lpgenius.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgXoKL97PXZCHahTxE7JNmZpk8HOgFYpU',
    appId: '1:261128275046:ios:3e39e811c86dfd8b4819a7',
    messagingSenderId: '261128275046',
    projectId: 'lpgenius',
    storageBucket: 'lpgenius.appspot.com',
    iosBundleId: 'com.se.smartlpgprovider',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCmhrF2EKRqpnXhze-yVQqw97nyiyr2w8Y',
    appId: '1:261128275046:web:c5388c05c510946a4819a7',
    messagingSenderId: '261128275046',
    projectId: 'lpgenius',
    authDomain: 'lpgenius.firebaseapp.com',
    storageBucket: 'lpgenius.appspot.com',
    measurementId: 'G-QMZPXD9D6L',
  );
}
