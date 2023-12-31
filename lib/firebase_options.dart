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
    apiKey: 'AIzaSyDhCEBqn7oVrlYGlRJw6X6JtlU1soo82BY',
    appId: '1:460920808849:web:3fe6bc56ff10cebb92a630',
    messagingSenderId: '460920808849',
    projectId: 'pes-buzz',
    authDomain: 'pes-buzz.firebaseapp.com',
    storageBucket: 'pes-buzz.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBUCUxxOF-2piBk4nn8Za2oa2Uq7bDDe7Q',
    appId: '1:460920808849:android:c42126dc99119d1992a630',
    messagingSenderId: '460920808849',
    projectId: 'pes-buzz',
    storageBucket: 'pes-buzz.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAKaf9b1Bpf3pCZQBdSnPKIk2xrUgGnkKY',
    appId: '1:460920808849:ios:349064adffcfd24292a630',
    messagingSenderId: '460920808849',
    projectId: 'pes-buzz',
    storageBucket: 'pes-buzz.appspot.com',
    iosBundleId: 'com.example.pesbuzz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAKaf9b1Bpf3pCZQBdSnPKIk2xrUgGnkKY',
    appId: '1:460920808849:ios:b62a488b3ef3f46e92a630',
    messagingSenderId: '460920808849',
    projectId: 'pes-buzz',
    storageBucket: 'pes-buzz.appspot.com',
    iosBundleId: 'com.example.pesbuzz.RunnerTests',
  );
}
