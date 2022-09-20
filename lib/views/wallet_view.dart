import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/models/carteira.model.dart';
import 'package:iamspeapp/stores/wallet_store.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/views/components/card_wallet_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walletStore = Modular.get<WalletStore>();
    return Scaffold(
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Carteirinhas',
        helperTitle: 'Carteirinhas',
        msg:
            'Aqui você tem acesso a lista de carteirinhas de seus beneficiários!',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<CarteiraModel>?>(
                future: walletStore.getData(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<CarteiraModel>?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (walletStore.walletList == null ||
                        (walletStore.walletList != null &&
                            walletStore.walletList!.isEmpty)) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Nenhum item encontrado.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return ListView.separated(
                        separatorBuilder: (
                          BuildContext context,
                          int index,
                        ) =>
                            const SizedBox(height: 15),
                        physics: const BouncingScrollPhysics(),
                        itemCount: walletStore.walletList!.length,
                        itemBuilder: (
                          BuildContext context,
                          int index,
                        ) {
                          return walletStore.walletList![index].statusBen!
                                      .idMotivoStatus !=
                                  7 //id obito
                              ? CardWallet(
                                  cardWallet: walletStore.walletList![index],
                                )
                              : Container();
                        },
                      );
                    }
                  } else {
                    return LoadingComponent(
                      isLoading: walletStore.isLoading,
                      child: null,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
