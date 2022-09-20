import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_escorts.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/stores/insert_escort_store.dart';
import 'package:iamspeapp/views/components/elevated_button_component.dart';
import 'package:iamspeapp/views/components/text_component.dart';
import 'package:iamspeapp/views/components/text_form_field_component.dart';
import 'package:iamspeapp/widgets/appbar-custom.dart';
import 'package:iamspeapp/widgets/menuLateral.widget.dart';

class InsertEscortPage extends StatefulWidget {
  const InsertEscortPage({Key? key}) : super(key: key);
  @override
  _InsertEscortPageState createState() => _InsertEscortPageState();
}

class _InsertEscortPageState extends State<InsertEscortPage> {
  final loginController = LoginController();
  final insertEscortStore = Modular.get<InsertEscortStore>();
  final cadAcompanhante = GlobalKey<FormState>();
  final alertEscorts = AlertScorts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      endDrawer: const MenuLateral(),
      appBar: CustomAppBar(
        hasLogo: false,
        hasSection: true,
        section: insertEscortStore.acompanhante != null
            ? 'Alt. Acompanhante'
            : 'Cad. Acompanhante',
        helperTitle: 'Acompanhante',
        msg: insertEscortStore.acompanhante != null
            ? 'Aqui você pode visualizar e/ou alterar um acompanhante!'
            : 'Aqui você pode cadastrar um novo acompanhante!',
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: cadAcompanhante,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const TextComponent(
                  text: 'Preencha com os dados do acompanhante',
                  textColor: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFe3e3e3),
                    ),
                    borderRadius: BorderRadius.circular(08),
                  ),
                  child: TextFormFieldComponent(
                    height: 60,
                    width: double.maxFinite,
                    fontSize: 16,
                    controller: insertEscortStore.nomectrl,
                    textInputType: TextInputType.text,
                    labelText: 'Nome Completo*',
                    backgroundColor: const Color(0xFFf6f6f6),
                    labelColor: Colors.black45,
                    fontWeight: FontWeight.w600,
                    obscureText: false,
                    hasIcon: false,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFe3e3e3),
                    ),
                    borderRadius: BorderRadius.circular(08),
                  ),
                  child: TextFormFieldComponent(
                    height: 60,
                    width: double.maxFinite,
                    fontSize: 16,
                    controller: insertEscortStore.cpfctrl,
                    textInputType: TextInputType.number,
                    labelText: 'CPF*',
                    backgroundColor: insertEscortStore.acompanhante == null
                        ? const Color(0xFFf6f6f6)
                        : Colors.grey[300]!,
                    labelColor: Colors.black45,
                    fontWeight: FontWeight.w600,
                    obscureText: false,
                    hasIcon: false,
                    readOnly:
                        insertEscortStore.acompanhante == null ? false : true,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFe3e3e3),
                    ),
                    borderRadius: BorderRadius.circular(08),
                  ),
                  child: TextFormFieldComponent(
                    height: 60,
                    width: double.maxFinite,
                    fontSize: 16,
                    controller: insertEscortStore.emailctrl,
                    textInputType: TextInputType.text,
                    labelText: 'E-mail*',
                    backgroundColor: const Color(0xFFf6f6f6),
                    labelColor: Colors.black45,
                    fontWeight: FontWeight.w600,
                    obscureText: false,
                    hasIcon: false,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButtonComponent(
                  onPressed: () {
                    if (cadAcompanhante.currentState!.validate()) {
                      insertEscortStore.acompanhante != null
                          ? insertEscortStore.editarAcompanhante(context)
                          : insertEscortStore.cadastrarAcompanhante(context);
                    }
                  },
                  width: double.maxFinite,
                  height: 60,
                  color: const Color(0xFF004d02),
                  text: TextComponent(
                    text: insertEscortStore.acompanhante == null
                        ? "Cadastrar"
                        : "Salvar",
                    textColor: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  loadingLogin: insertEscortStore.loadingRequest,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
