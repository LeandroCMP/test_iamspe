import 'package:dartz/dartz.dart';
import 'package:iamspeapp/app/core/exceptions/auth/auth_failure.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/models/versaoApp.model.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, dynamic>> auth(UsuarioAutenticacaoModel input);
  Future<Either<AuthFailure, VersaoAppModel?>> verifyVersion();
  Future<Either<AuthFailure, Object?>> getData(
    String cpf,
    String accessToken,
  );
}
