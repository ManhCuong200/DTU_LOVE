import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:DTU_LOVE/firebase_options.dart';
import 'app.dart';
import 'data/repositories/authentication/authentication_repository.dart';

Future<void> main() async {
  // Widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Getx Local Storage
  await GetStorage.init();

  // Await Splash Until Other Items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
