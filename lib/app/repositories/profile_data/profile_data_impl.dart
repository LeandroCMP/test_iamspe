import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/profile_data/profile_data_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/dados-perfil/contribuinteEditar.model.dart';
import 'package:iamspeapp/models/beneficiario.model.dart';

class ProfileDataImpl implements ProfileDataRepository {
  Dio dio = Dio();
  @override
  Future<ContribuinteEditarModel?> getDataProfile(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}beneficiario/buscar-beneficiario-por-id/$idBeneficiary";
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
      if (response.statusCode == 200) {
        return ContribuinteEditarModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getDataProfile',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<BeneficiarioModel?> postData(
    String? idBeneficiary,
    BeneficiarioModel taxPayer,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}beneficiario/corrigir-cpf-e-nome-mae/$idBeneficiary";

      final response = await dio.post(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
        data: taxPayer,
      );
      dev.log("response ${response.statusCode}");
      dev.log("body ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BeneficiarioModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception postData',
        error: e.response!,
      );
      throw Failure();
    }
  }
}
