import 'dart:developer' as dev;
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/accredited_network/accredited_network_failure.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/accredited_network/accredited_network_repository.dart';
import 'package:iamspeapp/app/services/accredited_network/accredited_network_service.dart';
import 'package:iamspeapp/models/rede-credenciada/credenciados.model.dart';
import 'package:iamspeapp/models/rede-credenciada/especialidades.model.dart';
import 'package:iamspeapp/models/rede-credenciada/cidades.model.dart';

class AccreditedNetworkServiceImpl implements AccreditedNetworkService {
  Dio dio = Dio();
  final AccreditedNetworkRepository _accreditedNetworkRepository;

  AccreditedNetworkServiceImpl(
      {required AccreditedNetworkRepository accreditedNetworkRepository})
      : _accreditedNetworkRepository = accreditedNetworkRepository;

  @override
  Future<Either<AccreditedNetworkFailure, List<CredenciadosModel>>>
      getAccredited(
    int? codSpecialties,
    int? codCity,
  ) async {
    try {
      final result = await _accreditedNetworkRepository.getAccredited(
        codSpecialties,
        codCity,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getAccredited service',
        error: e.error.toString(),
      );
      throw Failure(message: 'Erro ao buscar as redes credenciadas!');
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>>
      getCities() async {
    try {
      final result = await _accreditedNetworkRepository.getCities();
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getCities service',
        error: e.error.toString(),
      );
      throw Failure(message: 'Erro ao buscar as cidades credenciadas!');
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>>
      getCitiesBySpecialties(int codSpecialties) async {
    try {
      final result = await _accreditedNetworkRepository
          .getCitiesBySpecialties(codSpecialties);
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getCitiesBySpecialties service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Erro ao buscar as cidades credenciadas por especialidades!',
      );
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialties() async {
    try {
      final result = await _accreditedNetworkRepository.getSpecialties();
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getSpecialties service',
        error: e.error.toString(),
      );
      throw Failure(message: 'Erro ao buscar as especialidades!');
    }
  }

  @override
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialtiesByCity(
    int codCity,
  ) async {
    try {
      final result =
          await _accreditedNetworkRepository.getSpecialtiesByCity(codCity);
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getSpecialtiesByCity service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Erro ao buscar as especialidades por cidades credenciadas!',
      );
    }
  }
}
