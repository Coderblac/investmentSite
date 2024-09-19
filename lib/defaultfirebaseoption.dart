import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get web {
    return const FirebaseOptions(
      apiKey: "AIzaSyCd93XENFMqGUGmhsEqZABc8jw0QLwSV-Y",
      authDomain: "investmentweb-66e9e.firebaseapp.com",
      projectId: "investmentweb-66e9e",
      storageBucket: "investmentweb-66e9e.appspot.com",
      messagingSenderId: "918909445721",
      appId: "1:918909445721:web:bba1794ea42fe2aab53348",
      measurementId: "G-8JFV1R3D65",
    );
  }

  static FirebaseOptions get android {
    return const FirebaseOptions(
      apiKey: "YOUR_ANDROID_API_KEY",
      authDomain: "YOUR_ANDROID_AUTH_DOMAIN",
      projectId: "investmentweb-66e9e",
      storageBucket: "investmentweb-66e9e.appspot.com",
      messagingSenderId: "918909445721",
      appId: "1:918909445721:android:06dd80825cdc100ab53348",
    );
  }
}
