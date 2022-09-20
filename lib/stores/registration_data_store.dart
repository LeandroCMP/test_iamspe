import 'dart:convert';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_registration.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/repositories/profile_data/profile_data_impl.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/beneficiario.model.dart';
import 'package:iamspeapp/models/dados-perfil/contribuinteEditar.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'registration_data_store.g.dart';

class RegistrationDataStore = _RegistrationDataStoreBase
    with _$RegistrationDataStore;

abstract class _RegistrationDataStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final alertRegistration = AlertRegistration();

  var maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  var maskFormatterData = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  var maskFormatterCep = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );

  @observable
  UsuarioLogadoModel? usuario;
  @observable
  String? idBeneficiario;
  @observable
  bool isLoading = true;
  @observable
  bool loadingRequest = false;
  @observable
  bool buscaDados = false;
  @observable
  TextEditingController nomectrl = TextEditingController();
  @observable
  TextEditingController cpfctrl = TextEditingController();
  @observable
  TextEditingController nascimentoctrl = TextEditingController();
  @observable
  TextEditingController rgctrl = TextEditingController();
  @observable
  TextEditingController nomeMaectrl = TextEditingController();
  @observable
  TextEditingController desc = TextEditingController();
  @observable
  TextEditingController cep = TextEditingController();
  @observable
  TextEditingController logradouro = TextEditingController();
  @observable
  TextEditingController numero = TextEditingController();
  @observable
  TextEditingController bairro = TextEditingController();
  @observable
  TextEditingController compl = TextEditingController();
  @observable
  TextEditingController uf = TextEditingController();
  @observable
  TextEditingController cidade = TextEditingController();
  @observable
  TextEditingController phone = TextEditingController();
  @observable
  TextEditingController ddd = TextEditingController();
  @observable
  List<TextEditingController> emailctrl = [];
  @observable
  List<TextEditingController> dddctrl = [];
  @observable
  List<TextEditingController> telefonectrl = [];
  @observable
  List<TextEditingController> cepctrl = [];
  @observable
  List<TextEditingController> logradouroctrl = [];
  @observable
  List<TextEditingController> numeroctrl = [];
  @observable
  List<TextEditingController> complementoctrl = [];
  @observable
  List<TextEditingController> bairroctrl = [];
  @observable
  List<TextEditingController> ufctrl = [];
  @observable
  List<TextEditingController> cidadectrl = [];
  @observable
  ContribuinteEditarModel? dados = ContribuinteEditarModel();
  @observable
  bool cpfCerto = true;

  @action
  callPage(context, id) async {
    if (!loginController.tokenExpired(context)) {
      idBeneficiario = id;
      buscaDados = true;
      carregarDados(context);
      Modular.to.pushNamed('/registration-data');
    }
  }

  Future<ContribuinteEditarModel?> carregarDados(context) async {
    dev.log(dados!.beneficiario.toString());
    try {
      buscaDados = true;
      var repository = ProfileDataImpl();
      dev.log("idbeneficiairo------------------------$idBeneficiario");
      var resposta = await repository.getDataProfile(
        idBeneficiario,
        Settings.usuario!.token!,
      );
      dados = resposta;
      buscaDados = false;
      if (dados != null) {
        if (dados!.beneficiario!.cpf == null ||
            dados!.beneficiario!.cpf == '00000000000') {
          cpfCerto = false;
        }
        nomectrl.text = dados!.beneficiario!.nome!;

        cpfctrl.text = dados!.beneficiario!.cpf!;
        nomeMaectrl.text = dados!.beneficiario!.nomeMae ?? "";
        rgctrl.text = dados!.beneficiario!.rg!;
        nascimentoctrl.text = dados!.beneficiario!.dataNascimento!;
        if (dados!.emails != null && dados!.emails!.isNotEmpty) {
          for (var element in dados!.emails!) {
            desc.text = element.descricaoEmail!;
            if (emailctrl.length < 3) {
              emailctrl.add(desc);
            }
          }
        }
        if (dados!.enderecos != null && dados!.enderecos!.isNotEmpty) {
          dev.log(
              'lenght-endereco---------------------${dados!.enderecos!.length}');
          for (var element in dados!.enderecos!) {
            if (element.cep != null) {
              cep.text = element.cep.toString();
            } else {
              cep.clear();
            }

            logradouro.text = element.logradouro ?? '';

            if (element.numero != null) {
              numero.text = element.numero.toString();
            } else {
              numero.clear();
            }

            bairro.text = element.bairro ?? '';
            compl.text = element.complemento ?? '';
            uf.text = element.siglaUf ?? '';

            cidade.text = element.nomeCidade ?? '';

            if (logradouroctrl.length < 3) {
              cepctrl.add(cep);
              logradouroctrl.add(logradouro);
              numeroctrl.add(numero);
              bairroctrl.add(bairro);
              complementoctrl.add(compl);
              ufctrl.add(uf);
              cidadectrl.add(cidade);
            }
          }
        }
        if (dados!.telefones != null && dados!.telefones!.isNotEmpty) {
          dev.log('lenght---------------------${jsonEncode(dados!.telefones)}');
          for (var element in dados!.telefones!) {
            if (element.numero != null) {
              phone.text = element.numero.toString();
            } else {
              phone.clear();
            }
            if (element.ddd != null) {
              ddd.text = element.ddd.toString();
            } else {
              ddd.clear();
            }

            if (telefonectrl.length < 3) {
              dddctrl.add(ddd);
              telefonectrl.add(phone);
            }
          }
        }
      } else {
        alertRegistration.showDialogRegistration(
          context,
          "Erro ao buscar os dados, tente novamente mais tarde!",
          false,
        );
      }
      return dados;
    } catch (ex) {
      dev.log(
        'Erro de exception ao buscar dados do beneficiario',
        error: ex.toString(),
      );
      buscaDados = false;
      alertRegistration.showDialogRegistration(
        context,
        "Erro ao buscar os dados, tente novamente mais tarde!",
        false,
      );
      return null;
    }
  }

  Future<void> editarDadosCadastrais() async {
    try {
      loadingRequest = true;
      usuario = Settings.usuario;
      BeneficiarioModel beneficiario = BeneficiarioModel();
      beneficiario.idBeneficiario = dados!.beneficiario!.idBeneficiario;
      beneficiario.nomeMae = nomeMaectrl.text;
      beneficiario.cpf = maskFormatter.getUnmaskedText();
      var repository = ProfileDataImpl();
      dev.log(jsonEncode(beneficiario));
      var resposta = await repository.postData(
        dados!.beneficiario!.idBeneficiario,
        beneficiario,
        usuario!.token!,
      );
      loadingRequest = false;
      if (resposta != null) {
        alertRegistration.showDialogMsg(
            context, "Dados cadastrais atualizados com sucesso!", false);
      } else {
        alertRegistration.showDialogMsg(
            context,
            "Erro ao atualizar dados cadastrais, tente novamente mais tarde",
            true);
      }
    } catch (ex) {
      dev.log(
        "Erro de exception ao atualizar dados cadastrais",
        error: ex.toString(),
      );
      loadingRequest = false;
      alertRegistration.showDialogMsg(
          context,
          "Erro ao atualizar dados cadastrais, tente novamente mais tarde",
          true);
      return;
    }
  }
}
