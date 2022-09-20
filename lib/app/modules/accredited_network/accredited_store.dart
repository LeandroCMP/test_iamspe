import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_accredited.dart';
import 'package:iamspeapp/app/modules/accredited_network/accredited_controller.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/models/rede-credenciada/cidades.model.dart';
import 'package:iamspeapp/models/rede-credenciada/credenciados.model.dart';
import 'package:iamspeapp/models/rede-credenciada/especialidades.model.dart';
import 'package:mobx/mobx.dart';
part 'accredited_store.g.dart';

class AccreditedStore = _AccreditedStoreBase with _$AccreditedStore;

abstract class _AccreditedStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final accreditedController = Modular.get<AccreditedController>();
  final accreditedAlert = AccreditedAlert();
  @observable
  List<CidadesModel> cities = [];

  @observable
  List<CredenciadosModel>? accredited = [];

  @observable
  List<EspecialidadesModel>? specialties = [];

  @observable
  int? cityId;

  @observable
  int? specialtiesId;

  @observable
  bool loadingRequest = false;

  @observable
  bool getData = false;

  @observable
  bool visibilitySearch = true;

  @observable
  bool visibilityResult = false;

  @action
  callPage(context) {
    if (!loginController.tokenExpired(context)) {
      loadingRequest = false;
      visibilityResult = false;
      back();
      getCity();
      getSpecialties();
    }
  }

  @action
  void changed(bool visibility, String field) {
    if (field == "search") {
      visibilitySearch = visibility;
    }
    if (field == "result") {
      visibilityResult = visibility;
    }
  }

  @action
  selecaoEspecialidade(value) {
    //specialtie = value;
    var escolhida = specialties?.firstWhere(
      (element) => element.especialidade == value,
    );
    specialtiesId = escolhida!.especialidade_id;
  }

  @action
  selectCity(value) {
    //city = value;
    final escolhida = cities.firstWhere(
      (element) => element.municipio == value,
    );
    cityId = escolhida.municipio_id;
  }

  @action
  searchData(context) async {
    try {
      loadingRequest = true;
      changed(true, "result");
      changed(false, "search");
      accredited ??= [];
      final result = await accreditedController.searchAccredited(
        specialtiesId,
        cityId,
      );
      accredited = result as List<CredenciadosModel>?;
      loadingRequest = false;
    } catch (e) {}
  }

  @action
  getCity() async {
    getData = true;
    final result = await accreditedController.getCities(specialtiesId);
    if (result != null) {
      cities = result as List<CidadesModel>;
    } else {
      getData = false;
    }
    getData = false;
  }

  @action
  getSpecialties() async {
    getData = true;
    final result = await accreditedController.carregarEspecialidades();
    if (result != null) {
      specialties = result as List<EspecialidadesModel>?;
    } else {
      getData = false;
    }
    getData = false;
    Modular.to.pushNamed('/accredited');
  }

  @action
  back() {
    cityId = null;
    specialtiesId = null;
    accredited = [];
    changed(false, "result");
    changed(true, "search");
  }
}
