import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/schedule/schedule_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/declaracaoComparecimento.model.dart';
import 'package:iamspeapp/models/agenda.model.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  Dio dio = Dio();
  @override
  Future<List<AgendaModel>?> getSchedules(
    int? chart,
    String accesToken,
  ) async {
    try {
      final String url = "${Settings.apiUrlMv}/pacientes/$chart/agendas-futura";
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
        List<AgendaModel> mySchedules = [];
        mySchedules = (response.data as List)
            .map((i) => AgendaModel.fromJson(i))
            .toList();
        return mySchedules;
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception na repository getSchedules',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<List<AgendaModel>?> getSchedulesHistory(
    int? chart,
    String accesToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrlMv}pacientes/$chart/agendas-historico";

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
        List<AgendaModel> mySchedules = [];
        mySchedules = (response.data as List)
            .map((i) => AgendaModel.fromJson(i))
            .toList();
        return mySchedules;
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception na repository getSchedulesHistory',
        error: e.response!,
      );
      throw Failure();
    }
  }

  @override
  Future<List<DeclaracaoComparecimentoModel>> getStatementAttendance(
    int? chart,
    String accesToken,
  ) async {
    try {
      var url = "${Settings.apiUrlMv}declaracao/$chart";
      dev.log("aqui------------------$chart");
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

      dev.log("response status: ${response.statusCode}");
      dev.log("response body: ${response.data}");

      List<DeclaracaoComparecimentoModel> statements;
      statements = (response.data as List)
          .map((i) => DeclaracaoComparecimentoModel.fromJson(i))
          .toList();
      return statements;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception na repository getStatementAttendance',
        error: e.response!,
      );
      throw Failure();
    }
  }
}
