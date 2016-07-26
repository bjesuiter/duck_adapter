library duck_adapter.example.main;

import 'package:logging/logging.dart';
import 'package:logging_handlers/server_logging_handlers.dart';

import 'package:duck_adapter/duck_adapter.dart';

Logger _libLog = new Logger("duck_adapter");

main() {
  hierarchicalLoggingEnabled = true;
  Logger.root.onRecord.listen(new LogPrintHandler());
  Logger.root.level = Level.FINE;
  _libLog.level = Level.FINEST;

  new Session("sftp://ssh.strato.de/",
      user: "fewo-birkennest.de", identityFile: "/home/bjesuiter/.ssh/fewo-birkennest.de");
}
