import '../constants/constants.dart';

/// Connection is an enum of supported network states
enum Connection {
  /// When connection state is [Constants.wifi]
  wifi,

  /// When connection state is [Constants.cellular]
  cellular,

  /// When connection state is [Constants.disconnected]
  disconnected,

  /// When connection state is [Constants.unknown]
  unknown
}

/// converts the network events to the appropriate values of
/// the [Connection] enum
Connection intToConnection(int connectionInt) {
  var connection = Connection.unknown;
  switch (connectionInt) {
    case Constants.wifi:
      connection = Connection.wifi;
      break;
    case Constants.cellular:
      connection = Connection.cellular;
      break;
    case Constants.disconnected:
      connection = Connection.disconnected;
      break;
    case Constants.unknown:
      connection = Connection.unknown;
      break;
  }
  return connection;
}
