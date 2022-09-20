import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_helper.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/stores/qr_escort_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/beneficiary_list_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:switcher_button/switcher_button.dart';

class EscortsPage extends StatefulWidget {
  const EscortsPage({
    Key? key,
  }) : super(key: key);

  @override
  _EscortsPageState createState() => _EscortsPageState();
}

class _EscortsPageState extends State<EscortsPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final escortStore = Modular.get<ScortsStore>();
  final beneficiaryStore = Modular.get<BeneficiaryStore>();
  final initialStore = Modular.get<InitialStore>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: escortStore.tabIndex,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() async {
          escortStore.tabIndex = tabController.index;
          tabController.index == 0
              ? await escortStore.getData(context)
              : await beneficiaryStore.getData();
        });
        return Scaffold(
          key: scaffoldKey,
          endDrawer: const MenuLateral(),
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.help_outline_outlined),
                color: Colors.white,
                iconSize: 25,
                onPressed: () {
                  final alertHelper = AlertHelper();
                  alertHelper.showHelperAlert(
                    context,
                    'Acompanhantes e Beneficiários',
                    'Aqui você pode visualizar seu acompanhantes e seus beneficiários!',
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.menu_outlined),
                color: Colors.white,
                iconSize: 25,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
              ),
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF7ec345),
                    Color(0xFF03aabd),
                  ],
                  stops: [0.4, 0.8],
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () =>
                  Settings.usuario!.vinculoPessoal!.descVinculo! == 'TITULAR'
                      ? escortStore.callPage(context)
                      : initialStore.callPage(),
            ),
            title: const TextComponent(
              text: 'Acompanhantes',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: Colors.white,
            ),
            bottom: TabBar(
              indicatorColor: Colors.white,
              controller: tabController,
              tabs: <Widget>[
                const Text(
                  "Meus Acompanhantes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Settings.usuario!.vinculoPessoal!.descVinculo! == 'TITULAR'
                    ? const Text(
                        "Beneficiários",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              conteudoTab("Acompanhantes de: " + Settings.usuario!.nome!, 0),
              Settings.usuario!.vinculoPessoal!.descVinculo! == 'TITULAR'
                  ? conteudoTabBeneficiarios(
                      "Beneficiários de: " + Settings.usuario!.nome!,
                      1,
                    )
                  : Container(),
            ],
          ),
        );
      }),
    );
  }

  Widget conteudoTab(subtitulo, chamada) {
    final escortsStore = Modular.get<ScortsStore>();
    final insertEscortStore = Modular.get<InsertEscortStore>();
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextComponent(
            text: subtitulo,
            textColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          const SizedBox(height: 20),
          Observer(builder: (_) {
            return escortStore.isLoading == true
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
                          child: TextComponent(
                            text:
                                "Não há nenhum dado do beneficiário para trazer a lista de acompanhantes.",
                            textColor: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    : escortsStore.escortsList!.acompanhantes == null ||
                            (escortsStore.escortsList!.acompanhantes != null &&
                                escortsStore
                                    .escortsList!.acompanhantes!.isEmpty)
                        ? const Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text('Nenhum acompanhante cadastrado.'),
                          )
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 15),
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
                          );
          }),
          const SizedBox(height: 10),
          Observer(builder: (_) {
            return Visibility(
              visible: escortStore.isLoading == false,
              child: ElevatedButtonComponent(
                onPressed: () {
                  insertEscortStore.callPage(
                    context,
                    chart: escortsStore.userRecord,
                  );
                },
                height: 60,
                width: double.maxFinite,
                color: const Color(0xFF004d02),
                loadingLogin: false,
                text: const TextComponent(
                  text: 'Novo Acompanhante',
                  textColor: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget escortsList(context, int index) {
    final escortsStore = Modular.get<ScortsStore>();
    final qrEscortStore = Modular.get<QrEscortStore>();
    final insertEscortStore = Modular.get<InsertEscortStore>();

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

  Widget conteudoTabBeneficiarios(subtitulo, chamada) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextComponent(
            text: subtitulo,
            textColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(),
              child: BeneficiaryDataPage(
                edicaoPerfil: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
