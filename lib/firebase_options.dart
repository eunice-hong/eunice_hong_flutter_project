import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for fuchsia - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }
  }

  static final FirebaseOptions web = FirebaseOptions(
    apiKey: dotenv.env['WEB_API_KEY'] ?? '',
    appId: dotenv.env['WEB_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['WEB_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['WEB_PROJECT_ID'] ?? '',
    authDomain: dotenv.env['WEB_AUTH_DOMAIN'] ?? '',
    databaseURL: dotenv.env['WEB_DATABASE_URL'] ?? '',
    storageBucket: dotenv.env['WEB_STORAGE_BUCKET'] ?? '',
    measurementId: dotenv.env['WEB_MEASUREMENT_ID'] ?? '',
  );

  static final FirebaseOptions android = FirebaseOptions(
    apiKey: dotenv.env['ANDROID_API_KEY'] ?? '',
    appId: dotenv.env['ANDROID_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['ANDROID_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['ANDROID_PROJECT_ID'] ?? '',
    databaseURL: dotenv.env['ANDROID_DATABASE_URL'] ?? '',
    storageBucket: dotenv.env['ANDROID_STORAGE_BUCKET'] ?? '',
  );

  static final FirebaseOptions ios = FirebaseOptions(
    apiKey: dotenv.env['IOS_API_KEY'] ?? '',
    appId: dotenv.env['IOS_APP_ID'] ?? '',
    messagingSenderId: dotenv.env['IOS_MESSAGING_SENDER_ID'] ?? '',
    projectId: dotenv.env['IOS_PROJECT_ID'] ?? '',
    databaseURL: dotenv.env['IOS_DATABASE_URL'] ?? '',
    storageBucket: dotenv.env['IOS_STORAGE_BUCKET'] ?? '',
    iosClientId: dotenv.env['IOS_CLIENT_ID'] ?? '',
    iosBundleId: dotenv.env['IOS_BUNDLE_ID'] ?? '',
  );
}
