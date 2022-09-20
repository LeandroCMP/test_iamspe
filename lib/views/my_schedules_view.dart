import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_helper.dart';
import 'package:iamspeapp/stores/schedule_store.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class MySchedulesPage extends StatefulWidget {
  const MySchedulesPage({Key? key}) : super(key: key);

  @override
  _MySchedulesPageState createState() => _MySchedulesPageState();
}

class _MySchedulesPageState extends State<MySchedulesPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final scheduleStore = Modular.get<ScheduleStore>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: scheduleStore.tabIndex,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() async {
          scheduleStore.tabIndex = tabController.index;
          scheduleStore.tabIndex == 0
              ? await scheduleStore.getDataHistory()
              : await scheduleStore.getData();
        });
        return Scaffold(
          key: scaffoldKey,
          endDrawer: const MenuLateral(),
          appBar: AppBar(
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const TextComponent(
              text: 'Agendas',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              textColor: Colors.white,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.help_outline_outlined),
                color: Colors.white,
                iconSize: 25,
                onPressed: () {
                  final alertHelper = AlertHelper();
                  alertHelper.showHelperAlert(
                    context,
                    'Histórico e Agendas Futuras',
                    'Aqui você pode visualizar seu histórico de agendas e suas agendas futuras!',
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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Modular.to.pop(context),
            ),
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
            bottom: const TabBar(
              indicatorColor: Colors.white,
              //controller: _tabController,
              tabs: <Widget>[
                Text(
                  "Hitórico de Agendas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Agendas Futuras",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              conteudoTab(
                "Minhas Agendas",
                "Aqui você pode consultar seu histórico",
                0,
              ),
              conteudoTab(
                "Agendas Futuras",
                "Aqui você pode consultar suas próximas agendas",
                1,
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget conteudoTab(titulo, subtitulo, chamada) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextComponent(
            text: titulo,
            textColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          TextComponent(
            text: subtitulo,
            textColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          const SizedBox(height: 20),
          Observer(builder: (_) {
            return scheduleStore.isLoading == true
                ? LoadingComponent(
                    isLoading: scheduleStore.isLoading,
                    child: null,
                  )
                : scheduleStore.scheduleList == null
                    ? const TextComponent(
                        text: "Nenhum dado retornado.",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )
                    : scheduleStore.scheduleList[0].listaItemAgenda == null ||
                            (scheduleStore.scheduleList[0].listaItemAgenda !=
                                    null &&
                                scheduleStore
                                    .scheduleList[0].listaItemAgenda!.isEmpty)
                        ? scheduleStore.tabIndex == 0
                            ? const TextComponent(
                                text: 'Nenhum histórico de agenda encontrado.',
                                textColor: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )
                            : const TextComponent(
                                text: 'Nenhuma agenda futura encontrada.',
                                textColor: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )
                        : Expanded(
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemCount: scheduleStore
                                          .scheduleList[0].listaItemAgenda !=
                                      null
                                  ? scheduleStore
                                      .scheduleList[0].listaItemAgenda!.length
                                  : 0,
                              itemBuilder: (BuildContext context, int index) {
                                return agendaLista(context, index);
                              },
                            ),
                          );
          }),
        ],
      ),
    );
  }

  Widget agendaLista(context, int index) {
    final result = scheduleStore.scheduleList[0].listaItemAgenda![index];
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFf0f0f0),
            border: Border.all(color: const Color(0xFFececec)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(
              Icons.calendar_month_outlined,
              size: 36,
              color: Colors.black87,
            ),
            title: TextComponent(
              text: result.horaAgenda ?? '',
              textColor: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              maxLines: 4,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                TextComponent(
                  text: result.itemAgendamento?.descricao ?? '',
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  maxLines: 4,
                ),
                const SizedBox(height: 05),
                result.prestador != null
                    ? TextComponent(
                        text: result.prestador?.nomePrestador ?? '',
                        textColor: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        maxLines: 4,
                      )
                    : const SizedBox(),
                result.prestador != null
                    ? const SizedBox(height: 15)
                    : const SizedBox(),
                TextComponent(
                  text: result.unidadeAtendimento?.descricao ?? '',
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  maxLines: 4,
                ),
                const SizedBox(height: 15),
                TextComponent(
                  text:
                      result.unidadeAtendimento?.enderecoLocalAtendimento ?? '',
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
