import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/auth/auth_failure.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/auth/auth_repository.dart';
import 'package:iamspeapp/app/services/auth_service/auth_service.dart';
import 'package:iamspeapp/models/versaoApp.model.dart';
import 'package:iamspeapp/models/user_models.dart';

class AuthServiceImpl implements AuthService {
  Dio dio = Dio();
  final AuthRepository _authRepository;

  AuthServiceImpl(AuthRepository authRepository)
      : _authRepository = authRepository;
  @override
  Future<Either<AuthFailure, dynamic>> auth(
    UsuarioAutenticacaoModel input,
  ) async {
    try {
      final result = await _authRepository.auth(input);
      return right(result);
    } on DioError catch (e) {
      dev.log(
        'Exception auth service',
        error: e.error.toString(),
      );
      return left(
        AuthServerErrorFailure(
          error: 'Ocorreu um erro na autênticação do usuário!',
        ),
      );
    }
  }

  @override
  Future<Either<AuthFailure, Object?>> getData(
    String cpf,
    String accessToken,
  ) async {
    try {
      final result = await _authRepository.getData(cpf, accessToken);
      return right(result);
    } on DioError catch (e) {
      dev.log(
        'Exception getData service',
        error: e.error.toString(),
      );
      return left(
        AuthServerErrorFailure(
          error: 'Ocorreu um erro na recuperação de dados do usuário!',
        ),
      );
    }
  }

  @override
  Future<Either<AuthFailure, Object?>> verifyVersion() async {
    try {
      final result = await _authRepository.verifyVersion();
      return right(result);
    } on DioError catch (e) {
      dev.log(
        'Exception verifyVersion service',
        error: e.error.toString(),
      );
      return left(
        AuthServerErrorFailure(
          error: 'Ocorreu um erro ao verificar a versão do app!',
        ),
      );
    }
  }
}
