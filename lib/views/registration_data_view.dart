import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/text_form_field_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class RegistrationDataPage extends StatefulWidget {
  final int? idBeneficiario;
  const RegistrationDataPage({Key? key, this.idBeneficiario}) : super(key: key);
  @override
  _RegistrationDataPageState createState() => _RegistrationDataPageState();
}

class _RegistrationDataPageState extends State<RegistrationDataPage> {
  final loginController = Modular.get<LoginController>();
  final registrationDataStore = Modular.get<RegistrationDataStore>();
  final dadosCadastrais = GlobalKey<FormState>();
  final dadosEndereco = GlobalKey<FormState>();
  final dadosContato = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return page(context);
  }

  Widget page(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Meus Dados',
        helperTitle: 'Meus Dados',
        msg: 'Aqui você tem acesso aos seus dados cadastrais!',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Observer(builder: (_) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: registrationDataStore.buscaDados
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    child: LoadingComponent(
                      isLoading: registrationDataStore.isLoading,
                      child: Container(),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFf0f0f0),
                          border: Border.all(color: const Color(0xFFececec)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.error_sharp),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: size.width / 1.5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  TextComponent(
                                    text: 'Atenção',
                                    textColor: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Apenas os campos CPF e nome da mãe são liberados para edição (somente quando estiverem em branco). Os demais campos são apenas para visualização.',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      cardDados(),
                      const SizedBox(height: 20),
                      cardContato(),
                      cardEndereco(),
                    ],
                  ),
          );
        }),
      ),
    );
  }

  Widget cardDados() {
    final size = MediaQuery.of(context).size;
    return Form(
      key: dadosCadastrais,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFececec)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormFieldComponent(
              height: 60,
              width: double.maxFinite,
              fontSize: 16,
              controller: registrationDataStore.nomectrl,
              textInputType: TextInputType.text,
              labelText: 'Nome',
              backgroundColor: const Color(0xFFf0f0f0),
              labelColor: Colors.black,
              fontWeight: FontWeight.bold,
              obscureText: false,
              hasIcon: false,
              readOnly: true,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFececec)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormFieldComponent(
                  height: 60,
                  width: size.width / 2.5,
                  fontSize: 16,
                  controller: registrationDataStore.cpfctrl,
                  textInputType: TextInputType.text,
                  labelText: 'CPF',
                  backgroundColor: const Color(0xFFf0f0f0),
                  labelColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  obscureText: false,
                  hasIcon: false,
                  readOnly:
                      registrationDataStore.dados!.beneficiario!.cpf == null
                          ? false
                          : true,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFececec)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormFieldComponent(
                  height: 60,
                  width: size.width / 2.5,
                  fontSize: 16,
                  controller: registrationDataStore.rgctrl,
                  textInputType: TextInputType.text,
                  labelText: 'RG',
                  backgroundColor: const Color(0xFFf0f0f0),
                  labelColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  obscureText: false,
                  hasIcon: false,
                  readOnly: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFececec)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormFieldComponent(
              height: 60,
              width: double.maxFinite,
              fontSize: 16,
              controller: registrationDataStore.nascimentoctrl,
              textInputType: TextInputType.text,
              labelText: 'Nascimento',
              backgroundColor: const Color(0xFFf0f0f0),
              labelColor: Colors.black,
              fontWeight: FontWeight.bold,
              obscureText: false,
              hasIcon: false,
              readOnly: true,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFececec)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormFieldComponent(
              height: 60,
              width: double.maxFinite,
              fontSize: 16,
              controller: registrationDataStore.nomeMaectrl,
              textInputType: TextInputType.text,
              labelText: 'Nome da Mãe',
              backgroundColor: const Color(0xFFf0f0f0),
              labelColor: Colors.black,
              fontWeight: FontWeight.bold,
              obscureText: false,
              hasIcon: false,
              readOnly:
                  registrationDataStore.dados!.beneficiario!.nomeMae == null
                      ? false
                      : true,
            ),
          ),
          !registrationDataStore.cpfCerto ||
                  registrationDataStore.dados!.beneficiario!.nomeMae == null
              ? Container(
                  width: MediaQuery.of(context).size.width * .7,
                  height: MediaQuery.of(context).size.width * .15,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(20, 143, 58, 1),
                    border: Border.all(
                      width: 2.0,
                      color: const Color.fromRGBO(36, 140, 68, 1),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {
                      if (dadosCadastrais.currentState!.validate()) {
                        registrationDataStore.editarDadosCadastrais();
                      }
                    },
                    child: registrationDataStore.loadingRequest == false
                        ? const Text(
                            "Atualizar Dados",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          )
                        : LoadingComponent(
                            isLoading: registrationDataStore.loadingRequest,
                            child: null,
                          ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget cardContato() {
    final size = MediaQuery.of(context).size;
    return Form(
      key: dadosContato,
      child: Column(
        children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: registrationDataStore.dados!.emails != null
                ? registrationDataStore.dados!.emails!.length
                : 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFececec)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormFieldComponent(
                      height: 60,
                      width: double.maxFinite,
                      fontSize: 16,
                      controller: registrationDataStore.emailctrl[index],
                      textInputType: TextInputType.text,
                      labelText: 'Email',
                      backgroundColor: const Color(0xFFf0f0f0),
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      obscureText: false,
                      hasIcon: false,
                      readOnly: true,
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: registrationDataStore.dados!.telefones != null
                ? registrationDataStore.dados!.telefones!.length
                : 0,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width / 5,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFececec)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormFieldComponent(
                          height: 60,
                          width: double.maxFinite,
                          fontSize: 16,
                          controller: registrationDataStore.dddctrl[index],
                          textInputType: TextInputType.text,
                          labelText: 'DDD',
                          backgroundColor: const Color(0xFFf0f0f0),
                          labelColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          obscureText: false,
                          hasIcon: false,
                          readOnly: true,
                        ),
                      ),
                      Container(
                        width: size.width / 1.5,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFececec)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormFieldComponent(
                          height: 60,
                          width: double.maxFinite,
                          fontSize: 16,
                          controller: registrationDataStore.telefonectrl[index],
                          textInputType: TextInputType.text,
                          labelText: 'Telefone',
                          backgroundColor: const Color(0xFFf0f0f0),
                          labelColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          obscureText: false,
                          hasIcon: false,
                          readOnly: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget cardEndereco() {
    final size = MediaQuery.of(context).size;
    return Form(
      key: dadosEndereco,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: registrationDataStore.dados!.enderecos != null
            ? registrationDataStore.dados!.enderecos!.length
            : 0,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFececec)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormFieldComponent(
                  height: 60,
                  width: double.maxFinite,
                  fontSize: 16,
                  controller: registrationDataStore.cepctrl[index],
                  textInputType: TextInputType.text,
                  labelText: 'CEP',
                  backgroundColor: const Color(0xFFf0f0f0),
                  labelColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  obscureText: false,
                  hasIcon: false,
                  readOnly: true,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFececec)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormFieldComponent(
                  height: 60,
                  width: double.maxFinite,
                  fontSize: 16,
                  controller: registrationDataStore.logradouroctrl[index],
                  textInputType: TextInputType.text,
                  labelText: 'Logradouro',
                  backgroundColor: const Color(0xFFf0f0f0),
                  labelColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  obscureText: false,
                  hasIcon: false,
                  readOnly: true,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 5,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFececec)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormFieldComponent(
                      height: 60,
                      width: double.maxFinite,
                      fontSize: 16,
                      controller: registrationDataStore.numeroctrl[index],
                      textInputType: TextInputType.text,
                      labelText: 'Nº',
                      backgroundColor: const Color(0xFFf0f0f0),
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      obscureText: false,
                      hasIcon: false,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFececec)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormFieldComponent(
                      height: 60,
                      width: double.maxFinite,
                      fontSize: 16,
                      controller: registrationDataStore.complementoctrl[index],
                      textInputType: TextInputType.text,
                      labelText: 'Complemento',
                      backgroundColor: const Color(0xFFf0f0f0),
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      obscureText: false,
                      hasIcon: false,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFececec)),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormFieldComponent(
                  height: 60,
                  width: double.maxFinite,
                  fontSize: 16,
                  controller: registrationDataStore.bairroctrl[index],
                  textInputType: TextInputType.text,
                  labelText: 'Bairro',
                  backgroundColor: const Color(0xFFf0f0f0),
                  labelColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  obscureText: false,
                  hasIcon: false,
                  readOnly: true,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 1.5,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFececec)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormFieldComponent(
                      height: 60,
                      width: double.maxFinite,
                      fontSize: 16,
                      controller: registrationDataStore.cidadectrl[index],
                      textInputType: TextInputType.text,
                      labelText: 'Cidade',
                      backgroundColor: const Color(0xFFf0f0f0),
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      obscureText: false,
                      hasIcon: false,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    width: size.width / 5,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFececec)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormFieldComponent(
                      height: 60,
                      width: double.maxFinite,
                      fontSize: 16,
                      controller: registrationDataStore.ufctrl[index],
                      textInputType: TextInputType.text,
                      labelText: 'UF',
                      backgroundColor: const Color(0xFFf0f0f0),
                      labelColor: Colors.black,
                      fontWeight: FontWeight.bold,
                      obscureText: false,
                      hasIcon: false,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
