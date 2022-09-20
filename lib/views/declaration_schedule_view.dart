import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/declaration_schedule_list_store.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class DeclarationSchedulePage extends StatelessWidget {
  const DeclarationSchedulePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final declarationScheduleStore =
        Modular.get<DeclarationScheduleListStore>();
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Declaração',
        helperTitle: 'Declaração de Comparecimento',
        msg: 'Aqui você pode visualizar sua Declaração de Comparecimento!',
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Observer(builder: (_) {
                return declarationScheduleStore.isLoading == true
                    ? LoadingComponent(
                        isLoading: declarationScheduleStore.isLoading,
                        child: null,
                      )
                    : declarationScheduleStore.listaDeclaracoes.isEmpty
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Nenhum dado retornado.",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        : declarationScheduleStore.listaDeclaracoes == null
                            ? const Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text('Nenhuma declaração encontrada.'),
                              )
                            : SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .85,
                                child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 15),
                                  itemCount: declarationScheduleStore
                                              .listaDeclaracoes !=
                                          null
                                      ? declarationScheduleStore
                                          .listaDeclaracoes.length
                                      : 0,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return declaracaoLista(context, index);
                                  },
                                ),
                              );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget declaracaoLista(context, int index) {
    final declarationScheduleStore =
        Modular.get<DeclarationScheduleListStore>();
    return GestureDetector(
      onTap: () {
        if (declarationScheduleStore.listaDeclaracoes[index].paciente != null) {
          declarationScheduleStore.avaliarDeclaracao(
            context,
            true,
            declarationScheduleStore.listaDeclaracoes[index],
          );
        } else if (declarationScheduleStore
                .listaDeclaracoes[index].acompanhante !=
            null) {
          declarationScheduleStore.avaliarDeclaracao(
            context,
            false,
            declarationScheduleStore.listaDeclaracoes[index],
          );
        } else {
          null;
        }
      },
      child: Container(
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
          children: <Widget>[
            Icon(
              Icons.picture_as_pdf_rounded,
              color: Colors.grey[600],
              size: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                declarationScheduleStore
                            .listaDeclaracoes[index].dataHoraEntradaPaciente !=
                        null
                    ? TextComponent(
                        text: "Data Atendimento: "
                            "${declarationScheduleStore.listaDeclaracoes[index].dataHoraEntradaPaciente}",
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )
                    : const Text(''),
                const SizedBox(height: 10),
                declarationScheduleStore.listaDeclaracoes[index].acompanhante !=
                            null &&
                        declarationScheduleStore.listaDeclaracoes[index]
                                .acompanhante!.nomeAcompanhante !=
                            null
                    ? TextComponent(
                        text: "Acompanhante: "
                            "${declarationScheduleStore.listaDeclaracoes[index].acompanhante!.nomeAcompanhante!}",
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )
                    : const Text(''),
                const SizedBox(height: 10),
                declarationScheduleStore.listaDeclaracoes[index].acompanhante !=
                            null &&
                        declarationScheduleStore.listaDeclaracoes[index]
                                .acompanhante!.nomeAcompanhante !=
                            null
                    ? TextComponent(
                        text: "Acompanhante "
                            "${declarationScheduleStore.listaDeclaracoes[index].acompanhante!.nomeAcompanhante}",
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )
                    : const Text(''),
                declarationScheduleStore.listaDeclaracoes[index].paciente !=
                        null
                    ? const TextComponent(
                        text: "Paciente",
                        textColor: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )
                    : const Text('')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
