import 'package:firebase_core/firebase_core.dart';

import '../app/functions.dart';
//import '../firebase_options.dart';

class FirebaseService {
  static Future<void> setup() async {
    try {
      await Firebase.initializeApp(
          //options: DefaultFirebaseOptions.currentPlatform,
          );
    } catch (e, stackTrace) {
      AppFunctions.logException(e, stackTrace);
    }
  }
}
