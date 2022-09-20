import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/schedule/schedule_repository.dart';
import 'package:iamspeapp/app/services/schedule/schedule_service.dart';
import 'package:iamspeapp/models/declaracaoComparecimento.model.dart';
import 'package:iamspeapp/models/agenda.model.dart';

class ScheduleServiceImpl implements ScheduleService {
  Dio dio = Dio();
  final ScheduleRepository _scheduleRepository;

  ScheduleServiceImpl(ScheduleRepository scheduleRepository)
      : _scheduleRepository = scheduleRepository;
  @override
  Future<List<AgendaModel>?> getSchedules(
    int? chart,
    String accessToken,
  ) async {
    try {
      final result = await _scheduleRepository.getSchedules(
        chart,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getSchedules service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados da agenda!',
      );
    }
  }

  @override
  Future<List<AgendaModel>?> getSchedulesHistory(
    int? chart,
    String accessToken,
  ) async {
    try {
      final result = await _scheduleRepository.getSchedulesHistory(
        chart,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getSchedulesHistory service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar o histórico de agendas!',
      );
    }
  }

  @override
  Future<List<DeclaracaoComparecimentoModel>> getStatementAttendance(
    int? chart,
    String accessToken,
  ) async {
    try {
      final result = await _scheduleRepository.getStatementAttendance(
        chart,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getStatementAttendance service',
        error: e.error.toString(),
      );
      throw Failure(
        message:
            'Ocorreu um erro ao recuperar o histórico de declarações de comparecimento!',
      );
    }
  }
}
