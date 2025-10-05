abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // Add internet_connection_checker package for real implementation
  @override
  Future<bool> get isConnected async {
    // For now, return true
    // In production, use: await InternetConnectionChecker().hasConnection;
    return true;
  }
}
