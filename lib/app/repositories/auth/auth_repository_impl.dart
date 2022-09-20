import 'dart:convert';
import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/auth/auth_failure.dart';
import 'package:iamspeapp/app/repositories/auth/auth_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/versaoApp.model.dart';
import 'package:iamspeapp/models/user_models.dart';

class AuthRepositoryImpl implements AuthRepository {
  Dio dio = Dio();
  @override
  Future<Either<AuthFailure, dynamic>> auth(
    UsuarioAutenticacaoModel input,
  ) async {
    try {
      final String url = "${Settings.apiUrlGuardian}auth/token";
      final response = await dio.post(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'auth': 'Basic ' +
                base64.encode(
                  utf8.encode(
                    input.login! + ':' + input.senha!,
                  ),
                ),
            'id-empresa': '1',
            'context': 'APLICATIVO-IAMSPE'
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");

      if (response.statusCode == 200) {
        UsuarioTokenModel user = UsuarioTokenModel();
        user = UsuarioTokenModel.fromJson(response.data);
        return right(user);
      } else {
        EntradaInvalidaModel invalidUser = EntradaInvalidaModel();
        invalidUser = EntradaInvalidaModel.fromJson(response.data);
        invalidUser.message = utf8.decode(invalidUser.message!.codeUnits);
        print('caiu no else');
        print(invalidUser.message);
        return right(invalidUser);
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception auth',
        error: e.response!.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AuthNotFoundFailure());
      }
      return left(AuthServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AuthServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, Object?>> getData(
    String cpf,
    String accessToken,
  ) async {
    try {
      final String url =
          Settings.apiUrl + "beneficiario/buscar-beneficiario/$cpf";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );

      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      UsuarioLogadoModel user = UsuarioLogadoModel();
      user = UsuarioLogadoModel.fromJson(response.data)
        ..token = response.requestOptions.headers['authorization'];
      return right(user);
    } on DioError catch (e) {
      dev.log(
        'Erro de exception auth',
        error: e.response!.toString(),
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AuthNotFoundFailure());
      }
      return left(AuthServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AuthServerErrorFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<AuthFailure, VersaoAppModel?>> verifyVersion() async {
    try {
      final String url = "${Settings.apiUrlGuardian}contexto/versao-app";
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
          },
        ),
      );
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      VersaoAppModel version = VersaoAppModel();
      version = VersaoAppModel.fromJson(response.data);
      return right(version);
    } on DioError catch (e) {
      dev.log(
        "Erro de exception na repository check version",
        error: e.response?.toString() ?? 'Erro veio nulo',
      );
      if (e.response?.statusCode == 404 || e.response?.statusCode == 403) {
        return left(AuthNotFoundFailure());
      }
      return left(AuthServerErrorFailure(error: e.error));
    } catch (e) {
      return left(AuthServerErrorFailure(error: e.toString()));
    }
  }
}
