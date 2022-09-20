import 'dart:developer' as dev;
import 'package:iamspeapp/app/repositories/accredited_network/accredited_network_repository.dart';
import 'package:iamspeapp/app/repositories/accredited_network/accredited_network_repository_impl.dart';
import 'package:iamspeapp/app/services/accredited_network/accredited_network_service_impl.dart';
import 'package:iamspeapp/models/rede-credenciada/cidades.model.dart';
import 'package:iamspeapp/models/rede-credenciada/credenciados.model.dart';
import 'package:iamspeapp/models/rede-credenciada/especialidades.model.dart';

class AccreditedController {
  /*AccreditedController(
      {required AccreditedNetworkService accreditedNetworkService})
      : _accreditedNetworkService = accreditedNetworkService;*/
  //Future<List<CredenciadosModel>?> searchAccredited(
  Future<Object?> searchAccredited(
    specialtiesId,
    cityId,
  ) async {
    try {
      final AccreditedNetworkRepository repository =
          AccreditedNetworkRepositoryImpl();
      final service =
          AccreditedNetworkServiceImpl(accreditedNetworkRepository: repository);
      var response = await service.getAccredited(
        specialtiesId,
        cityId,
      );
      return response;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar credenciados na controller',
        error: ex.toString(),
      );
      return null;
    }
  }

  //Future<List<CidadesModel>?> getCities(filtro) async {
  Future<Object?> getCities(filtro) async {
    try {
      var repository = AccreditedNetworkRepositoryImpl();
      if (filtro == null) {
        var response = await repository.getCities();
        return response;
      } else {
        var response = await repository.getCitiesBySpecialties(filtro);
        return response;
      }
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar cidades na controller',
        error: ex.toString(),
      );
      return null;
    }
  }

  //Future<List<EspecialidadesModel>?> carregarEspecialidades() async {
  Future<Object?> carregarEspecialidades() async {
    try {
      var repository = AccreditedNetworkRepositoryImpl();
      var response = await repository.getSpecialties();
      return response;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar especialidades na controller',
        error: ex.toString(),
      );
      return null;
    }
  }
}
