import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/telemedicine_controller.dart';
import 'package:iamspeapp/app/repositories/telemedicine/telemedicine_repository_impl.dart';
import 'package:iamspeapp/models/retornoAtendimento.model.dart';
import 'package:iamspeapp/models/telemedicina.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/stores/telemedicine_store.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:iamspeapp/widgets/size-config.dart';

class TelemedicinePage extends StatelessWidget {
  const TelemedicinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final telemedicineStore = Modular.get<TelemedicineStore>();
    final telemedicineController = Modular.get<TelemedicineController>();
    return Scaffold(
      backgroundColor: const Color.fromRGBO(218, 222, 217, 1),
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Telemedicina',
        helperTitle: 'Telemedicina',
        msg:
            'Aqui você pode visualizar todas as suas consultas feitas e/ou futuras através da telemedicina!',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: FutureBuilder<List<TelemedicinaModel>?>(
              future: telemedicineController.carregarDados(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<TelemedicinaModel>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (telemedicineStore.listaAgendamentos!.isEmpty) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Nenhum item disponível.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: telemedicineStore.listaAgendamentos!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return agendamentoLista(context, index);
                      },
                    );
                  }
                } else {
                  return LoadingComponent(
                    isLoading: telemedicineStore.isLoading,
                    child: null,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget agendamentoLista(context, int index) {
    final telemedicineStore = Modular.get<TelemedicineStore>();
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    return GestureDetector(
      onTap: () {
        _mensagemAceiteCheckin(
          telemedicineStore.listaAgendamentos![index].idItemAgenda,
          context,
        );
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(),
                        Text(
                          //"TELEMEDICINA",
                          telemedicineStore.listaAgendamentos![index]
                              .itemAgendamento!.descricao!,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          telemedicineStore
                              .listaAgendamentos![index].horaAgenda!,
                          //"20/02/2020",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: sizeConfig.dynamicScaleSize(
                        size: 100, scaleFactorTablet: 2, scaleFactorMini: 1),
                    width: sizeConfig.dynamicScaleSize(
                        size: 120, scaleFactorTablet: 2, scaleFactorMini: 0.5),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        )),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/video-chamada.png",
                          color: Colors.blue,
                          alignment: Alignment.center,
                          width: 60,
                          height: 80,
                        ),
                        Text(
                          "Check in",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: sizeConfig.dynamicScaleSize(
                                size: 12,
                                scaleFactorTablet: 2,
                                scaleFactorMini: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    color: Colors.black,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "O check in só estará disponível com 15min de antecedência da sua consulta e 30min após o horário marcado!",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: sizeConfig.dynamicScaleSize(
                              size: 12,
                              scaleFactorTablet: 2,
                              scaleFactorMini: 0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  realizarEntrada(int? idItemAgenda, context) async {
    final telemedicineStore = Modular.get<TelemedicineStore>();
    try {
      var resposta = await TelemedicineRepositoryImpl()
          .postCheckIn(idItemAgenda, telemedicineStore.user!.token!);

      if (resposta is RetornoAtendimentoModel) {
        telemedicineStore.retornoAtendimento = resposta;
        _mensagemCheckinResultado(
          telemedicineStore.retornoAtendimento!.mensagem,
          true,
          context,
        );
      }
      if (resposta is EntradaInvalidaModel) {
        EntradaInvalidaModel erro = EntradaInvalidaModel();
        erro = resposta;
        _mensagemCheckinResultado(
          erro.message,
          false,
          context,
        );
      }
      return resposta;
    } catch (ex) {
      dev.log(
        'Erro de exception ao realizar entrada',
        error: ex.toString(),
      );
      return null;
    }
  }

  void _mensagemAceiteCheckin(int? idItemAgenda, context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: const Text(
            "Está ciente que fará o check in na consulta sujeito as normas previstas?",
            textAlign: TextAlign.left,
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text("Sim"),
              onPressed: () async {
                Modular.to.pop();
                await realizarEntrada(idItemAgenda, context);
              },
            ),
            TextButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _mensagemCheckinResultado(String? mensagem, bool checkin, context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    final telemedicineStore = Modular.get<TelemedicineStore>();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Atenção"),
          content: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
              style: TextStyle(
                fontSize: sizeConfig.dynamicScaleSize(
                    size: 16, scaleFactorTablet: 2, scaleFactorMini: 0.8),
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: mensagem! + "\n\n"),
                const TextSpan(
                    text:
                        "Para uma melhor experiência, faça download do Navegador Chrome."
                        "\n",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          actions: <Widget>[
            // define os botões na base do dialogo
            TextButton(
              child: const Text(
                "Ir para link de download do Google Chrome",
                style: TextStyle(color: Colors.green),
                textAlign: TextAlign.end,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                telemedicineStore.launchDownloadChrome();
              },
            ),
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
                if (checkin == true) {
                  telemedicineStore.launchBrowser(
                    telemedicineStore.retornoAtendimento!.idAtendimento,
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
