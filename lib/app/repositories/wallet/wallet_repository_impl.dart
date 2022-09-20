import 'dart:developer' as dev;
import 'package:dio/dio.dart';
import 'package:iamspeapp/app/core/exceptions/failure.dart';
import 'package:iamspeapp/app/repositories/wallet/wallet_repository.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/carteira.model.dart';
import 'package:iamspeapp/models/carteiraDados.model.dart';

class WalletRepositoryImpl implements WalletRepository {
  Dio dio = Dio();
  @override
  Future<CarteiraDadosModel?> getWalletData(
    String? idHolder,
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final String url =
          "${Settings.apiUrl}perfis/$idHolder/carteiras/$idBeneficiary";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      dev.log("carteira ${response.data}");
      if (response.statusCode == 200) {
        return CarteiraDadosModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioError catch (e) {
      dev.log(
        'Erro de exception get wallet data',
        error: e.response!.data.toString(),
      );
      throw Failure();
    }
  }

  @override
  Future getWallets(
    String? idBeneficiary,
    String accessToken,
  ) async {
    try {
      final String url = "${Settings.apiUrl}perfis/$idBeneficiary/carteiras";
      dev.log("url----------------" + url);
      dev.log("token----------------" + accessToken);
      final response = await dio.get(
        url,
        options: Options(
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + accessToken,
          },
        ),
      );
      List<CarteiraModel> carteiras = (response.data as List)
          .map((i) => CarteiraModel.fromJson(i))
          .toList();
      return carteiras;
    } on DioError catch (e) {
      dev.log(
        'Erro de exception repository getWallets',
        error: e.response!.data.toString(),
      );
      throw Failure();
    }
  }
}
