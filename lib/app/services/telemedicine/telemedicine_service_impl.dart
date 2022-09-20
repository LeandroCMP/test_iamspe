import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/telemedicine/telemedicine_repository.dart';
import 'package:iamspeapp/app/services/telemedicine/telemedicine_service.dart';
import 'package:iamspeapp/models/telemedicina.model.dart';

class TelemedicineServiceImpl implements TelemedicineService {
  Dio dio = Dio();
  final TelemedicineRepository _telemedicineRepository;

  TelemedicineServiceImpl(TelemedicineRepository telemedicineRepository)
      : _telemedicineRepository = telemedicineRepository;

  @override
  Future<List<TelemedicinaModel>> getSchedules(
    int? chart,
    String accessToken,
  ) async {
    try {
      final result = await _telemedicineRepository.getSchedules(
        chart,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getDataProfile service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados da agenda!',
      );
    }
  }

  @override
  Future<Object> postCheckIn(int? idItemSchedule, String accessToken) async {
    try {
      final result = await _telemedicineRepository.postCheckIn(
        idItemSchedule,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception postCheckIn service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados de check in!',
      );
    }
  }
}
