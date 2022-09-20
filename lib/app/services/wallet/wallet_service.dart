import 'package:iamspeapp/models/carteiraDados.model.dart';

abstract class WalletService {
  Future getWallets(
    String? idBeneficiary,
    String accessToken,
  );
  Future<CarteiraDadosModel?> getWalletData(
    String? idHolder,
    String? idBeneficiary,
    String accessToken,
  );
}
