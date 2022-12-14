import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_first_access.dart';
import 'package:iamspeapp/stores/initial_store.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/stores/onboarding_store.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FirstAccessPage extends StatefulWidget {
  const FirstAccessPage({Key? key}) : super(key: key);

  @override
  _FirstAccessPageState createState() => _FirstAccessPageState();
}

class _FirstAccessPageState extends State<FirstAccessPage> {
  @override
  Widget build(BuildContext context) {
    final alert = AlertFirstAccess();
    final onboardingStore = Modular.get<OnboardingStore>();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7ec345),
              Color(0xFF03aabd),
            ],
            stops: [0.4, 0.8],
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 10,
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(300),
              bottomRight: Radius.circular(200),
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    alert.showDialog(context);
                  },
                  child: const TextComponent(
                    text: 'Pular',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    textColor: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: onboardingStore.pageController,
                  onPageChanged: (index) {
                    onboardingStore.index = index;
                  },
                  children: [
                    firstIndex(),
                    secondIndex(),
                    thirdIndex(),
                    fourthIndex(),
                    fifthIndex(),
                    sixthIndex(),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: SmoothPageIndicator(
                  controller: onboardingStore.pageController,
                  count: 6,
                  effect: const WormEffect(
                    dotHeight: 12,
                    dotWidth: 12,
                    type: WormType.thin,
                    activeDotColor: Color(0xFF03aabd),
                    // strokeWidth: 5,
                  ),
                ),
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LayoutBuilder(builder: (context, _) {
                      return Observer(builder: (_) {
                        return onboardingStore.index == 0
                            ? const SizedBox()
                            : TextButton.icon(
                                onPressed: () {
                                  onboardingStore.backStep();
                                },
                                icon: const Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  color: Colors.black,
                                ),
                                label: const TextComponent(
                                  text: 'Voltar',
                                  textColor: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                      });
                    }),
                    LayoutBuilder(builder: (context, _) {
                      return Observer(builder: (_) {
                        return onboardingStore.index == 5
                            ? TextButton(
                                onPressed: () {
                                  alert.showDialog(context);
                                },
                                child: const TextComponent(
                                  text: 'Vamos L??!',
                                  textColor: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextButton.icon(
                                  onPressed: () {
                                    onboardingStore.nextStep();
                                  },
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: Colors.black,
                                  ),
                                  label: const TextComponent(
                                    text: 'Pr??ximo',
                                    textColor: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                      });
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget firstIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/wallet.png",
          ),
          const TextComponent(
            text: 'Carteirinha Digital',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Acesse sua carteirinha digital e as de seus acompanhantes.'
              ' Ou, se preferir, fa??a o download no celular',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/accredited_network.png",
          ),
          const TextComponent(
            text: 'Rede Credenciada',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Tenha na palma da m??o a lista de endere??os e telefones da rede credenciada do Iamspe',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget thirdIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/schedules_medical.png",
          ),
          const TextComponent(
            text: 'Minhas Agendas',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Verifique consultas e exames agendados no Hospital do Servidor P??blico Estadual e tamb??m o hist??rico dos atendimentos j?? realizados.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fourthIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/escorts.png",
          ),
          const TextComponent(
            text: 'Acompanhantes',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Tenha acesso aos nomes de seus acompanhantes e tamb??m dos seus benefici??rios. Cadastre novos acompanhantes direto no aplicativo do celular.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget fifthIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/financial.png",
          ),
          const TextComponent(
            text: 'Financeiro',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Acesso f??cil ?? segunda via do boleto e ?? declara????o para fins de IR. ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget sixthIndex() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/onboard/telemedicine.png",
          ),
          const SizedBox(height: 10),
          const TextComponent(
            text: 'Telemedicina',
            textColor: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              'Acesse o hist??rico do seu atendimento por Telemedicina no Hospital do Servidor P??blico Estadual e consultas futuras.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
