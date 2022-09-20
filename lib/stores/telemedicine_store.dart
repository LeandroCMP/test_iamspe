import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/alerts/alert_telemedicine.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/telemedicine_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/retornoAtendimento.model.dart';
import 'package:iamspeapp/models/telemedicina.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
part 'telemedicine_store.g.dart';

class TelemedicineStore = _TelemedicineStoreBase with _$TelemedicineStore;

abstract class _TelemedicineStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final telemedicineController = Modular.get<TelemedicineController>();
  final alertTelemedicine = AlertTelemedicine();

  @observable
  UsuarioLogadoModel? user = UsuarioLogadoModel();

  @observable
  RetornoAtendimentoModel? retornoAtendimento;

  @observable
  List<TelemedicinaModel>? listaAgendamentos = <TelemedicinaModel>[];

  @observable
  bool isLoading = true;

  @action
  callPage(context) {
    if (!loginController.tokenExpired(context)) {
      getData();
    }
  }

  getData() async {
    user = Settings.usuario;
    final result = await telemedicineController.carregarDados();
    listaAgendamentos = result;
    Modular.to.pushNamed('/telemedicine');
  }

  Future<void> launchBrowser(int? idAtendimento) async {
    final Uri url = Uri.parse(
        'https://telemedicina.iamspe.sp.gov.br/IAMSPE_ATENDIMENTO_$idAtendimento');
    await launchUrl(url);
    throw 'Could not launch $url';
  }

  Future<void> launchDownloadChrome() async {
    Uri url = Uri.parse('');
    if (Platform.isAndroid) {
      url = Uri.parse(
        'https://play.google.com/store/apps/details?id=com.android.chrome',
      );
    } else if (Platform.isIOS) {
      url = Uri.parse(
        "https://apps.apple.com/br/app/apple-store/id535886823",
      );
    }
    await launchUrl(url);
    throw 'Could not launch $url';
  }
}
