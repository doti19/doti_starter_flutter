import 'package:logger/logger.dart';

class CustomLogger extends Logger {
  CustomLogger()
      : super(
            printer: PrettyPrinter(
                methodCount: 2,
                errorMethodCount: 8,
                lineLength: 120,
                colors: true,
                printEmojis: true,
                printTime: true),
            output: ConsoleOutput(),
            filter: ProductionFilter());
}

final logger = CustomLogger();
