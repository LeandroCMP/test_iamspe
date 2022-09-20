import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/beneficiary_controller.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/carteira.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/stores/registration_data_store.dart';
import 'package:mobx/mobx.dart';
part 'beneficiary_store.g.dart';

class BeneficiaryStore = _BeneficiaryStoreBase with _$BeneficiaryStore;

abstract class _BeneficiaryStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final beneficiaryController = Modular.get<BeneficiaryController>();
  final registrationDataStore = Modular.get<RegistrationDataStore>();

  @observable
  UsuarioLogadoModel? usuario;
  @observable
  List<CarteiraModel> listaBeneficiarios = [];
  @observable
  bool isLoading = true;
  @observable
  Future? futureBenef;

  callPage(context) async {
    if (!loginController.tokenExpired(context)) {
      isLoading = true;
      await getData();
      Modular.to.pushNamed('/beneficiary/data');
    }
  }

  getData() async {
    try {
      isLoading = true;
      final result = await beneficiaryController.getData();
      listaBeneficiarios = result;
      isLoading = false;
      return listaBeneficiarios;
    } catch (ex) {
      dev.log(
        'Erro de exception ao carregar dados dos beneficiários',
        error: ex.toString(),
      );
      return null;
    }
  }
}
