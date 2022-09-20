import 'dart:developer' as dev;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iamspeapp/app/controllers/login_controller.dart';
import 'package:iamspeapp/app/controllers/tax_declaration_controller.dart';
import 'package:iamspeapp/config/settings.dart';
import 'package:iamspeapp/models/declaracaoRenda.model.dart';
import 'package:iamspeapp/models/user_models.dart';
import 'package:mobx/mobx.dart';
part 'tax_declaration_store.g.dart';

class TaxDeclarationStore = _TaxDeclarationStoreBase with _$TaxDeclarationStore;

abstract class _TaxDeclarationStoreBase with Store {
  final taxDeclarationController = Modular.get<TaxDeclarationController>();
  final loginController = Modular.get<LoginController>();

  @observable
  DeclaracaoRendaModel? result = DeclaracaoRendaModel();
  @observable
  bool loading = false;
  @observable
  UsuarioLogadoModel? usuario;
  @observable
  List<DeclaracaoRendaModel>? listaDeclaracoes;
  @observable
  bool? sort;
  @observable
  bool isLoading = true;

  @action
  callPage(context) async {
    if (!loginController.tokenExpired(context)) {
      usuario = Settings.usuario;
      loading = false;
      Modular.to.pushNamed('/declaration/data');
      result = await taxDeclarationController.carregarDeclaracao(
        usuario!.idBeneficiario!,
        listaDeclaracoes![0].idDmed,
      );
      loading = true;
    }
  }

  @action
  callPageDeclarationList(context) async {
    isLoading = true;
    Modular.to.pushNamed('/declaration/page');
    await getData();
  }

  Future<List<DeclaracaoRendaModel>?> getData() async {
    try {
      final response = await taxDeclarationController.getDataList();
      listaDeclaracoes = response;
      listaDeclaracoes ??= [];
      return listaDeclaracoes;
    } catch (ex) {
      dev.log(
        'Erro de Exception carregarDados imposto de renda',
        error: ex.toString(),
      );
      return null;
    }
  }
}
