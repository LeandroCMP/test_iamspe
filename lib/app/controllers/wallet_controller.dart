import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/repositories/wallet/wallet_repository_impl.dart';
import 'package:iamspeapp/models/carteira.model.dart';
import 'package:iamspeapp/models/carteiraDados.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/config/settings.dart';

class WalletController {
  final loginController = Modular.get<LoginController>();
  final repository = WalletRepositoryImpl();
  CarteiraDadosModel? wallet = CarteiraDadosModel();
  UsuarioLogadoModel? user = UsuarioLogadoModel();
  String? idHolder;
  String? idBeneficiary;

  Future<List<CarteiraModel>?> getData() async {
    UsuarioLogadoModel? user = UsuarioLogadoModel();
    try {
      user = Settings.usuario;
      final response = await repository.getWallets(
        user!.idBeneficiario,
        user.token!,
      );
      return response;
    } catch (ex) {
      dev.log('Erro de exception getData', error: ex.toString());
      return null;
    }
  }

  getWallet() async {
    try {
      loginController.carregarUsuario();
      user = Settings.usuario;
      final response = await repository.getWalletData(
        idHolder,
        idBeneficiary,
        user!.token!,
      );
      wallet = response;
      Modular.to.pushNamed('/wallet/user');
    } catch (ex) {
      dev.log(ex.toString());
    }
  }
}
