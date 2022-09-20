class AuthFailure implements Exception {}

class AuthServerErrorFailure extends AuthFailure {
  final String error;
  AuthServerErrorFailure({required this.error});
}

class AuthNotFoundFailure extends AuthFailure {}
