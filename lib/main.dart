import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'application/enum/enum_env.dart';
import 'core/navigation/navigation_services.dart';
import 'core/routes/routes.dart';
import 'core/routes/routes_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: EnumEnv.dev.value);
  if (kDebugMode) {
    log("\n:: RUNNING ON :: ${dotenv.env[EnumEnv.nodeEnv.value]?.toUpperCase()} MODE");
    log("\n:: VERSION APP :: ${dotenv.env[EnumEnv.appVersion.value]?.toUpperCase()} \n");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base Flutter Qyra Pentadakosta',
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      initialRoute: '/',
      navigatorObservers: [
        IRouteObserver(),
      ],
    );
  }
}
