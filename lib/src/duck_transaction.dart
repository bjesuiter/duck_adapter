library duck_adapter;

import 'package:logging/logging.dart';

class DuckTransaction {
  final Logger _log = new Logger("duck_adapter.duck_transaction");

  ///argument list for duck to execute
  final List<String> arguments = [];

  DuckTransaction() {

  }


}