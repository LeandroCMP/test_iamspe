import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_beneficiary.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/aggregate_escort_store.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';

import '../../config/settings.dart';
import 'loading_component.dart';

class BeneficiaryDataPage extends StatelessWidget {
  final bool edicaoPerfil;
  BeneficiaryDataPage({
    Key? key,
    required this.edicaoPerfil,
  }) : super(key: key);

  final loginController = Modular.get<LoginController>();
  final beneficiaryStore = Modular.get<BeneficiaryStore>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return beneficiaryStore.isLoading == true
          ? LoadingComponent(
              isLoading: beneficiaryStore.isLoading,
              child: null,
            )
          : (beneficiaryStore.listaBeneficiarios.isEmpty) ||
                  (beneficiaryStore.listaBeneficiarios.length == 1 &&
                      beneficiaryStore.listaBeneficiarios[0].nome !=
                          Settings.usuario!.nome &&
                      beneficiaryStore.listaBeneficiarios[0].cpf !=
                          Settings.usuario!.cpf)
              ? Container(
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
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: beneficiaryStore.listaBeneficiarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(beneficiaryStore
                        .listaBeneficiarios[index].statusBen!.idMotivoStatus);
                    return beneficiaryStore.listaBeneficiarios[index].nome !=
                                Settings.usuario!.nome &&
                            beneficiaryStore.listaBeneficiarios[index].cpf !=
                                Settings.usuario!.cpf &&
                            beneficiaryStore.listaBeneficiarios[index]
                                    .statusBen!.idMotivoStatus !=
                                7 &&
                            !edicaoPerfil &&
                            beneficiaryStore.listaBeneficiarios[index]
                                    .statusBen!.idAtivo !=
                                0
                        ? cartaoLista(context, index)
                        : beneficiaryStore.listaBeneficiarios[index].nome !=
                                    Settings.usuario!.nome &&
                                beneficiaryStore
                                        .listaBeneficiarios[index].cpf !=
                                    Settings.usuario!.cpf &&
                                beneficiaryStore.listaBeneficiarios[index]
                                        .statusBen!.idMotivoStatus !=
                                    7 &&
                                edicaoPerfil
                            ? cartaoLista(context, index)
                            : Container();
                  },
                );
    });
  }

  Widget cartaoLista(context, int index) {
    final aggregateStore = Modular.get<AggregateEscortStore>();
    final registrationDataStore = Modular.get<RegistrationDataStore>();
    final beneficiaryAlert = AlertBeneficiary();
    return GestureDetector(
      onTap: () {
        dev.log(
          "------lista-----"
          "${beneficiaryStore.listaBeneficiarios[index].cpf}",
        );
        if (!loginController.tokenExpired(context)) {
          if (edicaoPerfil) {
            registrationDataStore.callPage(
              context,
              beneficiaryStore.listaBeneficiarios[index].idBeneficiario,
            );
          } else {
            if (beneficiaryStore.listaBeneficiarios[index].cpf != null) {
              aggregateStore.callPage(
                context,
                beneficiaryStore.listaBeneficiarios[index].cpf,
                beneficiaryStore.listaBeneficiarios[index].nome,
              );
            } else {
              beneficiaryAlert.showBeneficiaryAlert(context);
            }
          }
        }
      },
      child: Container(
        height: 110,
        margin: const EdgeInsets.only(top: 05, bottom: 05),
        child: Card(
          color:
              beneficiaryStore.listaBeneficiarios[index].statusBen!.idAtivo == 0
                  ? const Color(0xFFf8d7da)
                  : const Color(0xFFd1e7dd),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(05),
            ),
            side: BorderSide(
              color: beneficiaryStore
                          .listaBeneficiarios[index].statusBen!.idAtivo ==
                      0
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
                    TextComponent(
                      text: beneficiaryStore.listaBeneficiarios[index].nome!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      textColor: beneficiaryStore.listaBeneficiarios[index]
                                  .statusBen!.idAtivo ==
                              0
                          ? const Color(0xFF842029)
                          : const Color(0xFF13633e),
                    ),
                    Icon(
                      beneficiaryStore.listaBeneficiarios[index].statusBen!
                                  .idAtivo ==
                              0
                          ? Icons.person_off_outlined
                          : Icons.person_outline_outlined,
                      color: beneficiaryStore.listaBeneficiarios[index]
                                  .statusBen!.idAtivo ==
                              0
                          ? const Color(0xFF842029)
                          : const Color(0xFF13633e),
                      size: 32,
                    ),
                  ],
                ),
                TextComponent(
                  text: beneficiaryStore
                      .listaBeneficiarios[index].vinculoPessoal!.descVinculo!,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textColor: beneficiaryStore
                              .listaBeneficiarios[index].statusBen!.idAtivo ==
                          0
                      ? const Color(0xFF842029)
                      : const Color(0xFF13633e),
                ),
                Row(
                  children: [
                    beneficiaryStore
                                .listaBeneficiarios[index].statusBen!.idAtivo ==
                            0
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
                    TextComponent(
                      text: beneficiaryStore
                          .listaBeneficiarios[index].statusBen!.descStatus!,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      textColor: beneficiaryStore.listaBeneficiarios[index]
                                  .statusBen!.idAtivo ==
                              0
                          ? const Color(0xFF842029)
                          : const Color(0xFF13633e),
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
