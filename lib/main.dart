import 'package:corelab_app_challenge/app_widget.dart';
import 'package:corelab_app_challenge/core/service_locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();

  runApp(const AppWidget());
}
