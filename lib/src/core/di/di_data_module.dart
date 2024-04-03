import 'package:doti_starter/src/core/data/theme_storage.dart';
import 'package:doti_starter/src/core/di/di_container.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DIDataModule {
  @lazySingleton
  ThemeStorage get themeStorage =>
      SharedPreferencesThemeStorage(diContainer.get());
}
