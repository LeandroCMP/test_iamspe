import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_exit.dart';
import 'package:iamspeapp/stores/login_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/text_form_field_component.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginStore = Modular.get<LoginStore>();
  final alertExit = AlertExit();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        alertExit.showDialogExit(context);
        return Future(() => false);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 15.0,
          top: MediaQuery.of(context).padding.top + 20,
          right: 15.0,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF03aabd),
              Color(0xFF7ec345),
            ],
            stops: [0.4, 0.8],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Container(
                  height: 110,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(
                      "assets/logo_transparente.png",
                      scale: 1.8,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                TextFormFieldComponent(
                  height: 55,
                  width: double.maxFinite,
                  backgroundColor: Colors.white,
                  controller: loginStore.formLogin,
                  textInputType: TextInputType.number,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  labelColor: Colors.grey,
                  labelText: 'CPF ou Carteirinha',
                  obscureText: false,
                  hasIcon: false,
                ),
                const SizedBox(height: 15),
                Observer(builder: (_) {
                  return TextFormFieldComponent(
                    height: 55,
                    width: double.maxFinite,
                    backgroundColor: Colors.white,
                    controller: loginStore.formPassword,
                    textInputType: TextInputType.text,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    labelColor: Colors.grey,
                    labelText: 'Senha',
                    obscureText: loginStore.obscureText,
                    hasIcon: true,
                    onPressed: () {
                      loginStore.changeVisibility();
                    },
                  );
                }),
                Observer(builder: (_) {
                  return CheckboxListTile(
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                    title: const TextComponent(
                      text: "Lembrar login",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                    ),
                    value: loginStore.checked,
                    onChanged: (value) {
                      loginStore.checkRememberLogin(value);
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }),
                Observer(builder: (_) {
                  return ElevatedButtonComponent(
                    onPressed:
                        loginStore.isAuthenticating || loginStore.loadingLogin
                            ? () {}
                            : () {
                                loginStore.callAuthForButton(context);
                              },
                    color: const Color(0xFF007bbe),
                    height: 55,
                    width: double.maxFinite,
                    text: const TextComponent(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.white,
                      text: 'Entrar',
                    ),
                    loadingLogin: loginStore.loadingLogin,
                    colorLoading: Colors.white,
                  );
                }),
                const SizedBox(height: 15),
                LayoutBuilder(
                  builder: ((context, constraints) {
                    return loginStore.hasBiometric == true
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF13A6B6),
                              onPrimary: Colors.white,
                              fixedSize: const Size(
                                double.maxFinite,
                                55,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(08),
                              ),
                            ),
                            onPressed: () {
                              loginStore.showBiometric(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Acessar com Biometria'),
                                SizedBox(width: 05),
                                Icon(Icons.fingerprint_outlined),
                              ],
                            ),
                          )
                        : const SizedBox();
                  }),
                ),
                const SizedBox(height: 30),
                TextComponent(
                  text: 'v${loginStore.version}',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.white,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        loginStore.launchForgotPassword();
                      },
                      child: const TextComponent(
                        text: "Esqueci a senha",
                        textColor: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        loginStore.launchFirstAccess();
                      },
                      child: const TextComponent(
                        text: "Primeiro Acesso",
                        textColor: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
