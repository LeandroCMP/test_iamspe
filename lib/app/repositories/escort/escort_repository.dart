import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';

abstract class EscortRepository {
  Future<PacienteAcompanhanteModel> getEscorts(
    int? chart,
    String accessToken,
  );
  Future<PacienteAcompanhanteModel> getEscortsByCpf(
    String? cpf,
    String accessToken,
  );
  Future<List<AcompanhanteModel>?> getEscortsData(
    String cpfEscort,
    String accessToken,
  );
  Future<bool> postEscort(
    AcompanhanteModel escort,
    String accessToken,
  );
  Future<AcompanhanteModel?> putEscort(
    AcompanhanteModel escort,
    String accessToken,
  );
}
