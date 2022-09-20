import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:iamspeapp/stores/escorts_store.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
part 'aggregate_escort_store.g.dart';

class AggregateEscortStore = _AggregateEscortStoreBase
    with _$AggregateEscortStore;

abstract class _AggregateEscortStoreBase with Store {
  final escortStore = Modular.get<ScortsStore>();
  @observable
  String? cpfAcompanhante;
  @observable
  String? nomeBeneficiario;
  @observable
  int? chart;
  @observable
  bool loadingRequest = false;
  @observable
  UsuarioLogadoModel? usuario;

  @observable
  var maskFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @action
  callPage(context, cpf, name) async {
    cpfAcompanhante = cpf;
    nomeBeneficiario = name;
    Modular.to.pushNamed('/escorts/aggregate');
    final result = await escortStore.callPageEscortsCpf(context, cpf);
    chart = result.prontuario;
  }
}
