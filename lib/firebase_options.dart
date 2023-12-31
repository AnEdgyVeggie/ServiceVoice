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
    apiKey: 'AIzaSyCy1UfvfyLBdPLKCjfw6c7S8JXeCgop70s',
    appId: '1:659724449082:web:59a0acb7f3daa80f05cc03',
    messagingSenderId: '659724449082',
    projectId: 'service-voice-43aa9',
    authDomain: 'service-voice-43aa9.firebaseapp.com',
    storageBucket: 'service-voice-43aa9.appspot.com',
    measurementId: 'G-5H535L6MJM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPs8Mjx25YTKAqmjNwod7BqCezoSc5Whg',
    appId: '1:659724449082:android:e743474977af9f0905cc03',
    messagingSenderId: '659724449082',
    projectId: 'service-voice-43aa9',
    storageBucket: 'service-voice-43aa9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDlEg-DOB6q3jsW7JUaARFGmqmu4plhU9c',
    appId: '1:659724449082:ios:e2859b2a046391d605cc03',
    messagingSenderId: '659724449082',
    projectId: 'service-voice-43aa9',
    storageBucket: 'service-voice-43aa9.appspot.com',
    iosBundleId: 'com.example.serviceVoice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDlEg-DOB6q3jsW7JUaARFGmqmu4plhU9c',
    appId: '1:659724449082:ios:79782b595e92e62d05cc03',
    messagingSenderId: '659724449082',
    projectId: 'service-voice-43aa9',
    storageBucket: 'service-voice-43aa9.appspot.com',
    iosBundleId: 'com.example.serviceVoice.RunnerTests',
  );
}
