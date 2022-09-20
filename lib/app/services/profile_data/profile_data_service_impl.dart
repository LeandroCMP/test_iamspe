import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/profile_data/profile_data_repository.dart';
import 'package:iamspeapp/app/services/profile_data/profile_data_service.dart';
import 'package:iamspeapp/models/beneficiario.model.dart';
import 'package:iamspeapp/models/dados-perfil/contribuinteEditar.model.dart';

class ProfileDataServiceImpl implements ProfileDataService {
  Dio dio = Dio();
  final ProfileDataRepository _profileDataRepository;

  ProfileDataServiceImpl(ProfileDataRepository profileDataRepository)
      : _profileDataRepository = profileDataRepository;

  @override
  Future<ContribuinteEditarModel?> getDataProfile(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final result = await _profileDataRepository.getDataProfile(
        idBeneficiary,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getDataProfile service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados do usuário!',
      );
    }
  }

  @override
  Future<BeneficiarioModel?> postData(
    String? idBeneficiary,
    BeneficiarioModel taxPayer,
    String accessToken,
  ) async {
    try {
      final result = await _profileDataRepository.postData(
        idBeneficiary,
        taxPayer,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception postData service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao atualizar os dados do usuário!',
      );
    }
  }
}
