import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/stores/tax_declaration_store.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';
import 'package:iamspeapp/widgets/size-config.dart';

class DeclarationDataView extends StatelessWidget {
  const DeclarationDataView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeConfig = SizeConfig(mediaQueryData: MediaQuery.of(context));
    final size = MediaQuery.of(context).size;
    final taxDeclarationStore = Modular.get<TaxDeclarationStore>();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(218, 222, 217, 1),
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Declaração',
        helperTitle: 'Declaração de Imposto de Renda',
        msg:
            'Aqui você pode visualizar sua declaração de imposto de renda referente ao ano escolhido!',
      ),
      body: SizedBox(
        height: size.height,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: taxDeclarationStore.result == null
                ? const Text(
                    'A declaração não pode ser visualizada no momento!',
                  )
                : Observer(builder: (_) {
                    return taxDeclarationStore.loading == false
                        ? LoadingComponent(
                            isLoading: taxDeclarationStore.loading,
                            child: null,
                          )
                        : Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(1, 2.0),
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                ),
                              ],
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 50,
                                      child:
                                          Image.asset("assets/brasao_sp.png"),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      width: sizeConfig.dynamicScaleSize(
                                          size: 220,
                                          scaleFactorTablet: 2,
                                          scaleFactorMini: 0.8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            "SECRETARIA DE GOVERNO",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 8),
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                          Text(
                                            "Instituto de Assistência Médica ao Servidor Público Estadual",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5),
                                          ),
                                          Text(
                                            "Avenida Ibirapuera, 981 - Vila Clementino - CEP: 04029-000 - Tel: 4573-8000",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 5),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                      child: Image.asset(
                                        "assets/logo_simples.png",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Divider(
                                  height: 5,
                                  thickness: 1,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "NÚCLEO FINANCEIRO, EM ${taxDeclarationStore.result!.calendario}",
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      "DECLARAÇÃO",
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 350,
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.justify,
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "    Declaramos para fins de Imposto de Renda que o(a) Sr.(a) ${taxDeclarationStore.result!.beneficiario!.nome}"
                                                  " - CPF: ${taxDeclarationStore.result!.beneficiario!.cpf} contribuiu para o IAMSPE - INSTITUTO DE ASSISTÊNCIA MÉDICA"
                                                  " AO SERVIDOR PÚBLICO ESTADUAL",
                                            ),
                                            const TextSpan(
                                              text:
                                                  '- CNPJ: 60.747.318/0001-62',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  ", no ano de ${taxDeclarationStore.result!.exercicio}, o valor de ${taxDeclarationStore.result!.valorTotal}"
                                                  " (${taxDeclarationStore.result!.valorExtenso}).",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Text(
                                            "Observações",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const Text(
                                        "O descrito acima contempla todos os valores pagos ao IAMSPE (Médico e Odontológico), pela contribuição e seus agregados via boleto bancário.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 11),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RichText(
                                        textAlign: TextAlign.justify,
                                        text: const TextSpan(
                                          style: TextStyle(
                                            fontSize: 11.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "O IAMSPE não é considerado PLANO DE SAÚDE. Deve ser declarado como: ",
                                            ),
                                            TextSpan(
                                              text: '"CÓDIGO 21"',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  " - Despesas com Clínicas, Hospitais e Laboratórios no Brasil.",
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Atenciosamente,",
                                            style: TextStyle(fontSize: 11),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      // new Image.file(file.path),
                                      SizedBox(
                                        width: 250,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/assinatura.png',

                                              width: 150,
                                              fit: BoxFit.fitWidth,
                                              gaplessPlayback:
                                                  true, // prevent redrawing
                                            ),
                                            const Divider(
                                              height: 1,
                                              thickness: 1,
                                              color: Colors.black,
                                            ),
                                            const SizedBox(height: 10),
                                            const Text(
                                              'Avaliador Técnico',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            const Text(
                                              'Respondendo pela Ger. Finanças',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  })),
      ),
    );
  }
}
