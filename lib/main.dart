import 'package:doti_starter/app_runner.dart';
import 'package:doti_starter/src/core/config/app_config.dart';
import 'package:doti_starter/src/core/config/build_type.dart';
import 'package:doti_starter/src/core/config/environment.dart';

void main(List<String> args) {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: '',
    ),
  );
  run();
}
