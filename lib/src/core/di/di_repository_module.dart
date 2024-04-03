import 'package:dio/dio.dart';
import 'package:doti_starter/index.dart';
import 'package:doti_starter/src/core/data/theme_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RepositoryModule {
  @factoryMethod
  ThemeRepository provideAccidentsRepository(ThemeStorage themeStorage) {
    return ThemeRepositoryImpl(themeStorage);
  }

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage {
    return const FlutterSecureStorage();
  }

  @preResolve
  @lazySingleton
  Future<Box<dynamic>> get openBox async {
    await Hive.initFlutter();
    return Hive.openBox<String>(Strings.appCodeName);
  }

  @preResolve
  @lazySingleton
  Future<Dio> get httpClient async {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));
    return dio;
  }
}
