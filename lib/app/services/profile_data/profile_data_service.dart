import 'package:iamspeapp/models/beneficiario.model.dart';
import 'package:iamspeapp/models/dados-perfil/contribuinteEditar.model.dart';

abstract class ProfileDataService {
  Future<ContribuinteEditarModel?> getDataProfile(
    String? idBeneficiary,
    String accessToken,
  );
  Future<BeneficiarioModel?> postData(
    String? idBeneficiary,
    BeneficiarioModel taxPayer,
    String accessToken,
  );
}
