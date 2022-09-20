import 'package:iamspeapp/models/boleto.model.dart';
import 'package:iamspeapp/models/boletoPdf.model.dart';
import 'package:iamspeapp/models/declaracaoRenda.model.dart';

abstract class FinancialRepository {
  Future<List<BoletoModel?>> getTicket(
    String? idBeneficiary,
    String accessToken,
  );

  Future<BoletoPdfModel?> getTicketPdf(
    String? idBeneficiary,
    String? idTitle,
    String accessToken,
  );

  Future<List<DeclaracaoRendaModel?>> getStatements(
    String? idBeneficiary,
    String accessToken,
  );

  Future<DeclaracaoRendaModel> getDeclarationData(
    String? idBeneficiary,
    String? idMed,
    String accessToken,
  );
}
