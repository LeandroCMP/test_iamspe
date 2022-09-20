import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/scorts_controller.dart';
import 'package:iamspeapp/models/acompanhante.model.dart';
import 'package:iamspeapp/models/pacienteAcompanhante.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/stores/beneficiary_store.dart';
import 'package:mobx/mobx.dart';
part 'escorts_store.g.dart';

class ScortsStore = _ScortsStoreBase with _$ScortsStore;

abstract class _ScortsStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final escortsController = Modular.get<ScortsController>();

  @observable
  UsuarioLogadoModel user = UsuarioLogadoModel();

  @observable
  PacienteAcompanhanteModel? escortsList = PacienteAcompanhanteModel();

  @observable
  bool isLoading = false;

  @observable
  int? userRecord;

  @observable
  bool addedCompanion = false;

  @observable
  String? escortName;

  @observable
  String? cpfEscorts;

  @observable
  bool? active = false;

  @observable
  bool validationActive = false;

  @observable
  int tabIndex = 0;

  @observable
  AcompanhanteModel activeEscort = AcompanhanteModel();

  @action
  callPage(context) {
    if (!loginController.tokenExpired(context)) {
      Modular.to.popAndPushNamed('/escorts/choose');
    }
  }

  @action
  callPageEscorts(context, index) {
    if (!loginController.tokenExpired(context)) {
      tabIndex = index;
      isLoading = false;
      if (index == 0) {
        getData(context);
      } else {
        final beneficiaryStore = Modular.get<BeneficiaryStore>();
        beneficiaryStore.getData();
      }
      Modular.to.popAndPushNamed('/escorts/registration');
    }
  }

  @action
  callPageEscortsCpf(context, cpf) async {
    isLoading = false;
    final response = await getDataCpf(context, cpf);
    return response;
    //Modular.to.popAndPushNamed('/escorts/registration');
  }

  @action
  getData(context) async {
    try {
      isLoading = true;
      escortsList = null;
      dev.log('acompanhante prontuario---------------------');
      addedCompanion = false;
      final response = await escortsController.getData();
      escortName = response.nomePaciente;
      userRecord = response.prontuario;
      escortsList = response;
      escortsList ??= null;
      isLoading = false;
      return escortsList;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados dos acompanhantes na store',
        error: ex.toString(),
      );
      return null;
    }
  }

  @action
  getDataCpf(context, cpf) async {
    isLoading = true;
    dev.log('acompanhante cpf--------------$cpfEscorts-------');
    addedCompanion = true;
    final response = await escortsController.getDataByCPF(cpf);
    escortsList = response;
    isLoading = false;
    return escortsList;
  }

  @action
  changeEscortStatus(
    bool value,
    AcompanhanteModel escort,
  ) async {
    try {
      isLoading = true;
      activeEscort = escort;
      activeEscort.ativo = value;
      validationActive = true;
      validationActive == false ? active = false : active = true;
      active = activeEscort.ativo;
      escortsController.changeEscortStatus(activeEscort, user.token);
      isLoading = false;
    } catch (ex) {
      dev.log(
        'Erro de exception ao ativar acompanhantes',
        error: ex.toString(),
      );
      return;
    }
  }
}
