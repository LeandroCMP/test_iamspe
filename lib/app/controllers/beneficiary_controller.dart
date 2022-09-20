import 'package:iamspeapp/app/repositories/wallet/wallet_repository_impl.dart';
import 'package:iamspeapp/config/settings.dart';

class BeneficiaryController {
  final repository = WalletRepositoryImpl();

  getData() async {
    final user = Settings.usuario;
    var response = await repository.getWallets(
      user!.idBeneficiario,
      user.token!,
    );
    return response;
  }
}
