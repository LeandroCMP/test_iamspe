import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/app_widget.dart';
import 'package:iamspeapp/app/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (Platform.isAndroid == true) {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  }
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}
