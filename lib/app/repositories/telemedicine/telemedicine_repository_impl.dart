import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/telemedicine/telemedicine_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/checkinAgendamento.model.dart';
import 'package:iamspeapp/models/retornoAtendimento.model.dart';
import 'package:iamspeapp/models/telemedicina.model.dart';
import 'package:iamspeapp/models/user_models.dart';

class TelemedicineRepositoryImpl implements TelemedicineRepository {
  Dio dio = Dio();
  @override
  Future<List<TelemedicinaModel>> getSchedules(
      int? chart, String accessToken) async {
    try {
      final String url = "${Settings.apiUrlTele}/agendas/$chart/telemedicina";

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
      dev.log("response status: ${response.statusCode}");
      dev.log("response body: ${response.data}");

      List<TelemedicinaModel> schedulesList;
      schedulesList = (response.data as List)
          .map((i) => TelemedicinaModel.fromJson(i))
          .toList();
      return schedulesList;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getSchedules',
        error: e.response!.data.toString(),
      );
      throw Failure();
    }
  }

  @override
  Future<Object> postCheckIn(int? idItemSchedule, String accessToken) async {
    try {
      var url = "${Settings.apiUrlTele}/atendimento/telemedicina";
      CheckinAgendamentoModel checkIn = CheckinAgendamentoModel()
        ..idItemAgenda = idItemSchedule;
      final response = await dio.post(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
        data: checkIn,
      );
      dev.log(checkIn.toString());
      dev.log("Response status: ${response.statusCode}");
      dev.log("Response body: ${response.data}");
      if (response.statusCode == 200) {
        return RetornoAtendimentoModel.fromJson(response.data);
      }
      if (response.statusCode == 400) {
        EntradaInvalidaModel errorCheckin = EntradaInvalidaModel();
        errorCheckin = EntradaInvalidaModel.fromJson(response.data);
        return errorCheckin;
      } else {
        return '';
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception getSchedules',
        error: e.response!.data.toString(),
      );
      throw Failure();
    }
  }
}
