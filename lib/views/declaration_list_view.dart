import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/declaracaoRenda.model.dart';
import 'package:iamspeapp/stores/tax_declaration_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/views/components/loading_component.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class DeclarationListView extends StatefulWidget {
  const DeclarationListView({Key? key}) : super(key: key);

  @override
  _DeclarationListViewState createState() => _DeclarationListViewState();
}

class _DeclarationListViewState extends State<DeclarationListView> {
  final loginController = Modular.get<LoginController>();
  final taxDeclarationStore = Modular.get<TaxDeclarationStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: const CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: 'Declaração IR',
        helperTitle: 'Declarações de Imposto de Renda',
        msg:
            'Aqui você pode consultar a lista de declaração de impostos de renda disponíveis para visualização!',
      ),
      body: FutureBuilder<List<DeclaracaoRendaModel>?>(
        future: taxDeclarationStore.getData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DeclaracaoRendaModel>?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (taxDeclarationStore.listaDeclaracoes == null ||
                (taxDeclarationStore.listaDeclaracoes != null &&
                    taxDeclarationStore.listaDeclaracoes!.isEmpty)) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                  ],
                ),
              );
            } else {
              return page(context);
            }
          } else {
            return LoadingComponent(
              isLoading: taxDeclarationStore.isLoading,
              child: null,
            );
          }
        },
      ),
    );
  }

  Widget page(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: taxDeclarationStore.listaDeclaracoes!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              taxDeclarationStore.callPage(context);
            },
            child: Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(05),
              decoration: BoxDecoration(
                color: const Color(0xFFf0f0f0),
                border: Border.all(
                  color: const Color(0xFFe6e6e6),
                ),
                borderRadius: BorderRadius.circular(05),
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.feed_outlined,
                  size: 36,
                  color: Colors.black54,
                ),
                title: const TextComponent(
                  text: 'Declaração para fins de Imposto de Renda',
                  textColor: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    TextComponent(
                      text:
                          'Calendário: ${taxDeclarationStore.listaDeclaracoes![index].calendario!}',
                      textColor: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 10),
                    TextComponent(
                      text:
                          'Valor Total: ${taxDeclarationStore.listaDeclaracoes![index].valorTotal!}',
                      textColor: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextComponent(
                          text:
                              'Exercício: ${taxDeclarationStore.listaDeclaracoes![index].exercicio!}',
                          fontSize: 16,
                          textColor: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
