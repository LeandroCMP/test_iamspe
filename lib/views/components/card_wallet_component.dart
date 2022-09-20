import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/carteira.model.dart';
import 'package:iamspeapp/stores/wallet_store.dart';

class CardWallet extends StatelessWidget {
  final CarteiraModel? cardWallet;
  const CardWallet({Key? key, this.cardWallet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final loginController = Modular.get<LoginController>();
    final walletStore = Modular.get<WalletStore>();
    final status = cardWallet!.statusBen!.idAtivo;
    return GestureDetector(
      onTap: status == 0
          ? null
          : () {
              if (!loginController.tokenExpired(context)) {
                walletStore.setWalletData(
                  cardWallet!.idTitular,
                  cardWallet!.idBeneficiario,
                  1,
                );
              }
            },
      child: SizedBox(
        height: 110,
        child: Card(
          color:
              status == 0 ? const Color(0xFFf8d7da) : const Color(0xFFd1e7dd),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(05),
            ),
            side: BorderSide(
              color: status == 0
                  ? const Color(0xFFf5c2c7)
                  : const Color(0xFFbadbcc),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 05, 10, 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cardWallet!.nome!,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: status == 0
                            ? const Color(0xFF842029)
                            : const Color(0xFF13633e),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Icon(
                      Icons.credit_card_rounded,
                      color: status == 0
                          ? const Color(0xFF842029)
                          : const Color(0xFF13633e),
                      size: 32,
                    ),
                  ],
                ),
                Text(
                  cardWallet!.vinculoPessoal!.descVinculo!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: status == 0
                        ? const Color(0xFF842029)
                        : const Color(0xFF13633e),
                  ),
                ),
                Row(
                  children: [
                    status == 0
                        ? const Icon(
                            Icons.close_rounded,
                            color: Color(0xFF842029),
                            size: 20,
                          )
                        : const Icon(
                            Icons.check_circle_outline_rounded,
                            color: Color(0xFF13633e),
                            size: 20,
                          ),
                    const SizedBox(width: 10),
                    Text(
                      cardWallet!.statusBen!.descStatus!,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: status == 0
                            ? const Color(0xFF842029)
                            : const Color(0xFF13633e),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
