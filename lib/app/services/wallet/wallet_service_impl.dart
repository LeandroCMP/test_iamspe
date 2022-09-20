import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/wallet/wallet_repository.dart';
import 'package:iamspeapp/app/services/wallet/wallet_service.dart';
import 'package:iamspeapp/models/carteiraDados.model.dart';

class WalletServiceImpl implements WalletService {
  final WalletRepository _walletRepository;
  WalletServiceImpl(WalletRepository walletRepository)
      : _walletRepository = walletRepository;
  @override
  Future<CarteiraDadosModel?> getWalletData(
    String? idHolder,
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final result = await _walletRepository.getWalletData(
        idHolder,
        idBeneficiary,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getWalletData service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar os dados da carteirinha!',
      );
    }
  }

  @override
  Future getWallets(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final result = await _walletRepository.getWallets(
        idBeneficiary,
        accessToken,
      );
      return result;
    } on DioError catch (e) {
      dev.log(
        'Exception getWallets service',
        error: e.error.toString(),
      );
      throw Failure(
        message: 'Ocorreu um erro ao recuperar as carteirinhas!',
      );
    }
  }
}
