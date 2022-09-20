import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';

abstract class EscortService {
  Future<PacienteAcompanhanteModel> getEscorts(
    int? chart,
    String accesToken,
  );
  Future<PacienteAcompanhanteModel> getEscortsByCpf(
    String? cpf,
    String accesToken,
  );
  Future<List<AcompanhanteModel>?> getEscortsData(
    String cpfEscort,
    String accesToken,
  );
  Future<bool> postEscort(
    AcompanhanteModel escort,
    String accesToken,
  );
  Future<AcompanhanteModel?> putEscort(
    AcompanhanteModel escort,
    String accesToken,
  );
}
