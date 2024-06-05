import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyANkeedvcJFzYcE01pSIbU3Z6L8jshAEPg',
    appId: '1:332185912082:web:b7b1b6b7cfa49bc716a9cb',
    messagingSenderId: '332185912082',
    projectId: 'clone-94623',
    authDomain: 'clone-94623.firebaseapp.com',
    storageBucket: 'clone-94623.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyACVIXCsrd7vA44ScG8RfkdgR64cWNM_1I',
    appId: '1:332185912082:android:b06240119b3522b816a9cb',
    messagingSenderId: '332185912082',
    projectId: 'clone-94623',
    storageBucket: 'clone-94623.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAo0F9ND0DPk_3-EQQ8czjq9UzxYQUZHD0',
    appId: '1:332185912082:ios:5e4242583118157616a9cb',
    messagingSenderId: '332185912082',
    projectId: 'clone-94623',
    storageBucket: 'clone-94623.appspot.com',
    iosBundleId: 'com.example.youtubeClone',
  );
}
