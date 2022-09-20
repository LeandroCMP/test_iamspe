class AccreditedNetworkFailure implements Exception {}

class AccreditedNetworkServerErrorFailure extends AccreditedNetworkFailure {
  final String error;
  AccreditedNetworkServerErrorFailure({
    required this.error,
  });
}

class AccreditedNetworkNotFoundFailure extends AccreditedNetworkFailure {}
