library duck_adapter.example.main;

import 'package:logging/logging.dart';
import 'package:logging_handlers/server_logging_handlers.dart';

Logger _libLog = new Logger("duck_adapter");

main() {
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(new LogPrintHandler());
  Logger.root.level = Level.FINE;
  _libLog.level = Level.FINEST;


}