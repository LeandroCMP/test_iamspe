import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/escort/escort_repository.dart';
import 'package:iamspeapp/app/services/escort/escort_service.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';

class EscortServiceImpl implements EscortService {
  Dio dio = Dio();
  final EscortRepository _escortRepository;

  EscortServiceImpl(EscortRepository escortRepository)
      : _escortRepository = escortRepository;

  @override
  Future<PacienteAcompanhanteModel> getEscorts(
    int? chart,
    String accessToken,
  ) async {
    try {
      final result = await _escortRepository.getEscorts(
        chart,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getEscorts service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados dos acompanhantes!',
      );
    }
  }

  @override
  Future<PacienteAcompanhanteModel> getEscortsByCpf(
    String? cpf,
    String accessToken,
  ) async {
    try {
      final result = await _escortRepository.getEscortsByCpf(
        cpf,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getEscortsByCpf service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados do acompanhante!',
      );
    }
  }

  @override
  Future<List<AcompanhanteModel>?> getEscortsData(
    String cpfEscort,
    String accessToken,
  ) async {
    try {
      final result = await _escortRepository.getEscortsData(
        cpfEscort,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getEscortsData service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados dos acompanhantes!',
      );
    }
  }

  @override
  Future<bool> postEscort(
    AcompanhanteModel escort,
    String accessToken,
  ) async {
    try {
      final result = await _escortRepository.postEscort(
        escort,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception postEscort service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao cadastrar o acompanhantes!',
      );
    }
  }

  @override
  Future<AcompanhanteModel?> putEscort(
    AcompanhanteModel escort,
    String accessToken,
  ) async {
    try {
      final result = await _escortRepository.putEscort(
        escort,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception putEscort service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao alterar os dados do acompanhante!',
      );
    }
  }
}
