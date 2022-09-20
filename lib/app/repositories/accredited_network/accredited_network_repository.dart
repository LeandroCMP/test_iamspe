import 'package:dartz/dartz.dart';
import 'package:iamspeapp/app/core/exceptions/accredited_network/accredited_network_failure.dart';
import 'package:iamspeapp/models/rede-credenciada/cidades.model.dart';
import 'package:iamspeapp/models/rede-credenciada/credenciados.model.dart';
import 'package:iamspeapp/models/rede-credenciada/especialidades.model.dart';

abstract class AccreditedNetworkRepository {
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>> getCities();
  Future<Either<AccreditedNetworkFailure, List<CidadesModel>>>
      getCitiesBySpecialties(
    int codSpecialties,
  );
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialties();
  Future<Either<AccreditedNetworkFailure, List<EspecialidadesModel>>>
      getSpecialtiesByCity(
    int codCity,
  );
  Future<Either<AccreditedNetworkFailure, List<CredenciadosModel>>>
      getAccredited(
    int? codSpecialties,
    int? codCity,
  );
}
