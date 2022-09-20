import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/schedule_controller.dart';
import 'package:iamspeapp/models/agenda.model.dart';
import 'package:mobx/mobx.dart';
part 'schedule_store.g.dart';

class ScheduleStore = _ScheduleStoreBase with _$ScheduleStore;

abstract class _ScheduleStoreBase with Store {
  final loginController = Modular.get<LoginController>();
  final scheduleController = Modular.get<ScheduleController>();

  @observable
  List<AgendaModel> scheduleList = [];

  @observable
  bool isLoading = false;

  @observable
  int tabIndex = 0;

  @action
  callPage(context, index) async {
    if (!loginController.tokenExpired(context)) {
      tabIndex = index;
      Modular.to.pushNamed('/schedule');
      if (index == 0) {
        await getDataHistory();
      } else {
        await getData();
      }
    }
  }

  @action
  callPageChoose(context) {
    if (!loginController.tokenExpired(context)) {
      Modular.to.pushNamed('/schedule/choose');
    }
  }

  @action
  getDataHistory() async {
    isLoading = true;
    scheduleList = await scheduleController.getDataHistory();
    scheduleList[0].listaItemAgenda = scheduleList[0].listaItemAgendaHistorico;
    isLoading = false;
  }

  @action
  getData() async {
    isLoading = true;
    scheduleList = await scheduleController.getData();
    isLoading = false;
  }
}
