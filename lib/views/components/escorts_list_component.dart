import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/aggregate_escort_store.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/stores/qr_escort_store.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:switcher_button/switcher_button.dart';

import 'loading_component.dart';

class EscortsList extends StatefulWidget {
  const EscortsList({Key? key}) : super(key: key);
  @override
  _EscortsListState createState() => _EscortsListState();
}

class _EscortsListState extends State<EscortsList> {
  final loginController = Modular.get<LoginController>();
  final escortsStore = Modular.get<ScortsStore>();
  final qrEscortStore = Modular.get<QrEscortStore>();
  final insertEscortStore = Modular.get<InsertEscortStore>();
  final aggregateStore = Modular.get<AggregateEscortStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return escortsStore.isLoading == true
          ? LoadingComponent(
              isLoading: escortsStore.isLoading,
              child: null,
            )
          : escortsStore.escortsList == null
              ? Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Center(
                    child: Text(
                      "Não há nenhum dado do beneficiário para trazer a lista de acompanhantes.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      escortsStore.escortsList!.acompanhantes == null ||
                              (escortsStore.escortsList!.acompanhantes !=
                                      null &&
                                  escortsStore
                                      .escortsList!.acompanhantes!.isEmpty)
                          ? const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text('Nenhum acompanhante cadastrado.'),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * .5,
                              child: ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 10),
                                scrollDirection: Axis.vertical,
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    escortsStore.escortsList!.acompanhantes !=
                                            null
                                        ? escortsStore
                                            .escortsList!.acompanhantes!.length
                                        : 0,
                                itemBuilder: (BuildContext context, int index) {
                                  return escortsList(context, index);
                                },
                              ),
                            ),
                    ],
                  ),
                );
    });
  }

  Widget escortsList(context, int index) {
    return Observer(builder: (_) {
      return InkWell(
        onTap: !escortsStore.escortsList!.acompanhantes![index].ativo!
            ? null
            : () {
                insertEscortStore.callPage(
                  context,
                  escort: escortsStore.escortsList!.acompanhantes![index],
                  chart: escortsStore.userRecord,
                  accredited: escortsStore.addedCompanion,
                  cpf: escortsStore.cpfEscorts,
                  name: escortsStore.escortName,
                );
              },
        child: Container(
          height: 80,
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFf0f0f0),
            border: Border.all(
              color: const Color(0xFFe6e6e6),
            ),
            borderRadius: BorderRadius.circular(05),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Observer(builder: (_) {
                return TextComponent(
                  text: escortsStore
                      .escortsList!.acompanhantes![index].nomeAcompanhante!
                      .toUpperCase(),
                  textColor:
                      !escortsStore.escortsList!.acompanhantes![index].ativo!
                          ? Colors.grey
                          : Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                );
              }),
              SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: !escortsStore
                              .escortsList!.acompanhantes![index].ativo!
                          ? null
                          : () {
                              qrEscortStore.callPage(
                                context,
                                escortsStore.escortsList!.acompanhantes![index],
                              );
                            },
                      child: Container(
                        height: 40,
                        width: 40,
                        padding: const EdgeInsets.all(01),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(03),
                        ),
                        child: Observer(builder: (_) {
                          return Icon(
                            Icons.qr_code_2_rounded,
                            color: !escortsStore
                                    .escortsList!.acompanhantes![index].ativo!
                                ? Colors.red[300]
                                : const Color(0xFF004d02),
                            size: 40,
                          );
                        }),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFF004d02)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SwitcherButton(
                        value: escortsStore
                            .escortsList!.acompanhantes![index].ativo!,
                        offColor: Colors.white,
                        onColor: const Color(0xFF004d02),
                        onChange: (value) {
                          escortsStore.changeEscortStatus(
                            value,
                            escortsStore.escortsList!.acompanhantes![index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
