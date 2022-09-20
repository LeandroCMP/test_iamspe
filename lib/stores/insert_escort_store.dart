import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_escorts.dart';
import 'package:iamspeapp/app/controllers/insert_escort_controller.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'insert_escort_store.g.dart';

class InsertEscortStore = _InsertEscortStoreBase with _$InsertEscortStore;

abstract class _InsertEscortStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final insertEscortController = Modular.get<InsertEscortController>();
  AlertScorts alertEscorts = AlertScorts();

  @observable
  AcompanhanteModel? acompanhante = AcompanhanteModel();
  @observable
  bool? agregadoPage;
  @observable
  String? cpfAgregado;
  @observable
  String? nomeAgregado;
  @observable
  int? prontuario;
  @observable
  UsuarioLogadoModel? usuario;
  @observable
  bool isLoading = true;
  @observable
  bool loadingRequest = false;
  @observable
  TextEditingController nomectrl = TextEditingController();
  @observable
  TextEditingController cpfctrl = TextEditingController();
  @observable
  TextEditingController emailctrl = TextEditingController();
  @observable
  var maskFormatter = MaskTextInputFormatter(
      mask: '###.###.###-##', filter: {"#": RegExp(r'[0-9]')});

  @action
  callPage(
    context, {
    AcompanhanteModel? escort,
    accredited,
    cpf,
    name,
    chart,
  }) {
    if (!loginController.tokenExpired(context)) {
      isLoading = true;
      acompanhante = escort;
      agregadoPage = accredited;
      cpfAgregado = cpf;
      nomeAgregado = name;
      prontuario = chart;
      if (escort != null) {
        getData();
      } else {
        nomectrl.clear();
        cpfctrl.clear();
        emailctrl.clear();
        Modular.to.pushNamed('/escorts/insert');
      }
    }
  }

  @action
  getData() {
    nomectrl.text = acompanhante!.nomeAcompanhante!;
    cpfctrl.text = acompanhante!.numeroCpfAcompanhante!;
    emailctrl.text = acompanhante!.emailAcompanhante!;
    loadingRequest = false;
    Modular.to.pushNamed('/escorts/insert');
  }

  @action
  Future<void> cadastrarAcompanhante(context) async {
    try {
      loadingRequest = true;
      usuario = Settings.usuario;
      insertEscortController.insertEscort(
        context,
        user: usuario,
        name: nomectrl.text,
        cpf: cpfctrl.text,
        email: emailctrl.text,
        chart: prontuario,
      );
      loadingRequest = false;
    } catch (ex) {
      dev.log(
        'Erro de exception ao cadastrar acompanhante',
        error: ex.toString(),
      );
      loadingRequest = false;
      alertEscorts.showDialogEscortUpdate(
        context,
        "Erro ao cadastrar acompanhante, tente novamente mais tarde",
        true,
      );
      return;
    }
  }

  Future<void> editarAcompanhante(context) async {
    loadingRequest = true;
    final nameConverted = nomectrl.text.toUpperCase();
    final cpfConverted = cpfctrl.text;
    final emailConverted = emailctrl.text;
    final result = await insertEscortController.updateEscort(
      context,
      acompanhante!,
      nameConverted,
      cpfConverted,
      emailConverted,
      prontuario,
    );
    result == true ? loadingRequest = false : loadingRequest = true;
  }
}
