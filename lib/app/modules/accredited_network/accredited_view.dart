import 'package:dropdown_search/dropdown_search.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_accredited.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class AccreditedPage extends StatefulWidget {
  const AccreditedPage({Key? key}) : super(key: key);

  @override
  _AccreditedPageState createState() => _AccreditedPageState();
}

class _AccreditedPageState extends State<AccreditedPage> {
  final accreditedStore = Modular.get<AccreditedStore>();
  final accreditedAlert = AccreditedAlert();
  final _busca = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        limparRotas: true,
        hasLogo: false,
        hasSection: true,
        section: 'Rede Credenciada',
        helperTitle: 'Rede Credenciada',
        msg: 'Aqui você pode consultar todas as redes credenciadas ao IAMSPE!',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              cardDados(),
              const SizedBox(height: 40),
              Observer(builder: (_) {
                return Visibility(
                  visible: accreditedStore.visibilityResult == false,
                  child: cardBusca(context),
                );
              }),
              Observer(builder: (_) {
                return Visibility(
                  visible: accreditedStore.visibilityResult == true,
                  child: cardRedes(context),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardDados() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      decoration: BoxDecoration(
        color: const Color(0xFFf0f0f0),
        border: Border.all(
          color: const Color(0xFFe6e6e6),
        ),
        borderRadius: BorderRadius.circular(05),
      ),
      child: ExpandablePanel(
        header: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextComponent(
              text: 'Mais Informações',
              textColor: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 05),
            Text(
              'Consulte aqui para obter mais informações',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 20),
            Text(
              "* O Agendamento de consultas e exames da Rede Credenciada é realizado diretamente com o consultório ou laboratório escolhido, com comodidade e sem custo adicional.",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Divider(
                height: 5,
                thickness: 1,
                color: Colors.black,
              ),
            ),
            Text(
              "O agendamento no Hospital do Servidor Público Estadual está disponível na Central de Atendimento Telefônico",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Tel: (011) 5583-7001",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "Segunda à sexta das 7h às 19h",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        collapsed: Container(),
      ),
    );
  }

  Widget cardBusca(context) {
    return !accreditedStore.getData
        ? Form(
            key: _busca,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return Visibility(
                      visible: accreditedStore.visibilitySearch,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextComponent(
                            text: 'Rede Credenciada',
                            textColor: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 05),
                          const TextComponent(
                            text: 'Buscar por especialista e/ou cidade',
                            textColor: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFf6f6f6),
                              border: Border.all(
                                color: const Color(0xFFe6e6e6),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownSearch<String>(
                              dropdownButtonProps: const IconButtonProps(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                ),
                              ),
                              showClearButton: true,
                              onBeforeChange: (a, b) {
                                return Future.value(true);
                              },
                              popupProps: PopupProps.modalBottomSheet(
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                                showSearchBox: true,
                                fit: FlexFit.tight,
                                isFilterOnline: true,
                                searchFieldProps: const TextFieldProps(
                                  scrollPhysics: BouncingScrollPhysics(),
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  decoration: InputDecoration(
                                    hintText:
                                        'Informe a especialidade desejada aqui',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Modular.to.pop(),
                                      child: const TextComponent(
                                        text: 'Fechar',
                                        textColor: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              items: accreditedStore.specialties!
                                  .map((e) => (e.especialidade))
                                  .toList()
                                  .cast<String>(),
                              dropdownSearchDecoration: const InputDecoration(
                                hintText: "Selecione uma Especialidade",
                                hintStyle: TextStyle(
                                  color: Color(0xFFbababa),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                accreditedStore.selecaoEspecialidade(value);
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFf6f6f6),
                              border: Border.all(
                                color: const Color(0xFFe6e6e6),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownSearch<String>(
                              dropdownButtonProps: const IconButtonProps(
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                ),
                              ),
                              showClearButton: true,
                              onBeforeChange: (a, b) async {
                                return await Future.value(true);
                              },
                              popupProps: PopupProps.modalBottomSheet(
                                showSelectedItems: true,
                                disabledItemFn: (String s) => s.startsWith('I'),
                                showSearchBox: true,
                                fit: FlexFit.tight,
                                isFilterOnline: true,
                                searchFieldProps: const TextFieldProps(
                                  scrollPhysics: BouncingScrollPhysics(),
                                  autocorrect: true,
                                  enableSuggestions: true,
                                  decoration: InputDecoration(
                                    hintText: 'Informe a cidade desejada aqui',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () => Modular.to.pop(),
                                      child: const TextComponent(
                                        text: 'Fechar',
                                        textColor: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              items: accreditedStore.cities
                                  .map((e) => (e.municipio))
                                  .toList()
                                  .cast<String>(),
                              dropdownSearchDecoration: const InputDecoration(
                                hintText: "Selecione uma Cidade",
                                hintStyle: TextStyle(
                                  color: Color(0xFFbababa),
                                  fontSize: 18,
                                ),
                                border: InputBorder.none,
                              ),
                              onChanged: (newValue) {
                                accreditedStore.selectCity(newValue);
                              },
                            ),
                          ),
                          const SizedBox(height: 25),
                          ElevatedButtonComponent(
                            height: 60,
                            width: double.maxFinite,
                            color: const Color(0xFF004d02),
                            text: const TextComponent(
                              text: 'Pesquisar',
                              textColor: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                            loadingLogin: accreditedStore.loadingRequest,
                            onPressed: () {
                              if (accreditedStore.specialtiesId != null ||
                                  accreditedStore.cityId != null) {
                                accreditedStore.searchData(context);
                              } else {
                                accreditedAlert.showDialogAccredited(context);
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        : LoadingComponent(
            isLoading: accreditedStore.getData,
            child: Container(),
          );
  }

  Widget cardRedes(context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      return Column(
        children: [
          SizedBox(
            height: size.height / 2.2,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: accreditedStore.accredited!.isNotEmpty
                  ? accreditedStore.accredited!.length
                  : 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: const Color.fromRGBO(190, 222, 182, 1),
                                width: MediaQuery.of(context).size.width * .8,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: "Município: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: accreditedStore
                                            .accredited![index].municipio,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: const Color.fromRGBO(190, 222, 182, 1),
                                width: MediaQuery.of(context).size.width * .8,
                                child: RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      const TextSpan(
                                        text: "Especialidade: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                      TextSpan(
                                        text: accreditedStore
                                            .accredited![index].especialidade
                                            .toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: Colors.green[100],
                                width: MediaQuery.of(context).size.width * .8,
                                child: Text(
                                  accreditedStore
                                      .accredited![index].nome_credenciado
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .05,
                                    child: const Icon(
                                      Icons.phone_outlined,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: Text(
                                      accreditedStore
                                          .accredited![index].telefone
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .05,
                                    child: const Icon(
                                      Icons.location_on_outlined,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .7,
                                    child: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: accreditedStore
                                                    .accredited![index]
                                                    .logradouro
                                                    .toString() +
                                                ", ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text: accreditedStore
                                                    .accredited![index].numero
                                                    .toString() +
                                                ", ",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                          TextSpan(
                                            text: accreditedStore
                                                .accredited![index].cep
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButtonComponent(
            height: 60,
            width: double.maxFinite,
            color: const Color(0xFF004d02),
            text: const TextComponent(
              text: 'Voltar',
              textColor: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
            loadingLogin: accreditedStore.loadingRequest,
            onPressed: () {
              accreditedStore.back();
            },
          ),
        ],
      );
    });
  }
}
