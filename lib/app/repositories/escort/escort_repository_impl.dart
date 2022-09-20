import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/escort/escort_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';

class EscortRepositoryImpl implements EscortRepository {
  Dio dio = Dio();

  @override
  Future<PacienteAcompanhanteModel> getEscorts(
    int? chart,
    String accesToken,
  ) async {
    try {
      final String url = "${Settings.apiUrlMv}pacientes/$chart/id";
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accesToken,
          },
        ),
      );
      dev.log("response body: ${response.data}");
      dev.log("response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        var escortList = PacienteAcompanhanteModel.fromJson(
          response.data,
        );
        return escortList;
      } else {
        return PacienteAcompanhanteModel();
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception ao carregar acompanhantes',
        error: e.toString(),
      );
      throw Failure();
    }
  }

  @override
  Future<PacienteAcompanhanteModel> getEscortsByCpf(
    String? cpf,
    String accesToken,
  ) async {
    try {
      final String url = '${Settings.apiUrlMv}pacientes/$cpf/cpf';
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accesToken,
          },
        ),
      );
      dev.log(url);
      dev.log("response $cpf body: ${response.data}");
      if (response.statusCode! == 200) {
        var listaAcompanhante = PacienteAcompanhanteModel.fromJson(
          response.data,
        );
        return listaAcompanhante;
      } else {
        return PacienteAcompanhanteModel();
      }
    } catch (e) {
      dev.log(
        'Erro de exception getAcompanhantesPorCpf repository',
        error: e.toString(),
      );
      throw Failure();
    }
  }

  @override
  Future<List<AcompanhanteModel>?> getEscortsData(
    String cpfEscort,
    String accesToken,
  ) async {
    try {
      final String url = "${Settings.apiUrlMv}acompanhantes/$cpfEscort/cpf";

      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accesToken,
          },
        ),
      );
      dev.log("response body: ${response.data}");
      dev.log("response status: ${response.statusCode}");
      if (response.statusCode == 200) {
        List<AcompanhanteModel> escortList;
        escortList = (response.data as List)
            .map((i) => AcompanhanteModel.fromJson(i))
            .toList();
        return escortList;
      } else {
        return null;
      }
    } catch (e) {
      dev.log(
        'Erro de exception getAcompanhantesPorCpf repository',
        error: e.toString(),
      );
      throw Failure();
    }
  }

  @override
  Future<bool> postEscort(
    AcompanhanteModel escort,
    String accesToken,
  ) async {
    try {
      final String url = "${Settings.apiUrlMv}acompanhantes/";
      dev.log("cadastro---------------------------");
      final response = await dio.post(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accesToken,
          },
        ),
        data: escort,
      );

      dev.log("response body: ${response.data}");
      dev.log("response status: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception ao cadastrar acompanhante',
        error: e.response!,
      );
      throw Failure(message: e.error);
    }
  }

  @override
  Future<AcompanhanteModel?> putEscort(
    AcompanhanteModel escort,
    String accesToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrlMv}acompanhantes/${escort.numeroCpfAcompanhante}"
          "/${escort.codigoPaciente}/acompanhate";
      final response = await dio.patch(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accesToken,
          },
        ),
        data: escort,
      );

      dev.log("response body: ${response.data}");
      dev.log("response status: ${response.statusCode}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return AcompanhanteModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception ao alterar acompanhante',
        error: e.response!,
      );
      throw Failure();
    }
  }
}
