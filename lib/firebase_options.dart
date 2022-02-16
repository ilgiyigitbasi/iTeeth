// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDqRiNhKW3Zo2AF183pX2r7Z6Bma55imuY',
    appId: '1:544755295245:android:9f9acc2b428191e9dda144',
    messagingSenderId: '544755295245',
    projectId: 'iteeth-520c4',
    storageBucket: 'iteeth-520c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA_VSRBJd3qpRBpCoOrFERLrhWbMD5_j3g',
    appId: '1:544755295245:ios:cba4adff1dc653f7dda144',
    messagingSenderId: '544755295245',
    projectId: 'iteeth-520c4',
    storageBucket: 'iteeth-520c4.appspot.com',
    iosClientId: '544755295245-gia1nhk0kup8pnvlf27eo6kdf2q01qae.apps.googleusercontent.com',
    iosBundleId: 'com.example.iteeth',
  );
}