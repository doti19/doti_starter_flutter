import 'package:doti_starter/src/core/di/di_container.dart';
import 'package:doti_starter/src/core/di/di_initializer.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectableInit
Future<GetIt> initDI(GetIt getIt, String environment) async {
  registerDependencies();
  await diContainer.isReady<SharedPreferences>();
  return getIt.init(environment: environment);
}

@module
void registerDependencies() {
  // Register SharedPreferences dependency
  diContainer.registerLazySingletonAsync<SharedPreferences>(() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  });
}
