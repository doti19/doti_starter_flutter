import 'dart:async';

import 'package:dio/dio.dart';
import 'package:doti_starter/src/core/app/app.dart';
import 'package:doti_starter/src/core/di/di_container.dart';
import 'package:doti_starter/src/core/di/di_initializer.dart';
import 'package:doti_starter/src/features/auth/infrastructure/auth_interceptor.dart';
import 'package:doti_starter/src/features/core/presentation/onboarding/intro.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

Future<void> run([
  List<DeviceOrientation> orientations = const [
    DeviceOrientation.portraitUp,
  ],
]) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(orientations);

  await initDI(diContainer, 'dev');
  // print(x.isReadySync());
  diContainer<Dio>()
    ..options = BaseOptions(
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
      validateStatus: (status) {
        return true;
      },
      baseUrl: 'http://10.0.2.2:3000/',
    )
    ..interceptors.add(diContainer<AuthInterceptor>());

  _runApp();
}

void _runApp() {
  runApp(const Intro());
}
